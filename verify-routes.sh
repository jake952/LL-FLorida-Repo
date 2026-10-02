#!/usr/bin/env bash
# Verify the DFW routing against a real Apache host.
#
# The .htaccess rules were checked statically and behave correctly on the local
# preview server, but only Apache can confirm them: whether AllowOverride
# permits .htaccess, whether mod_dir's DirectorySlash chains with the
# trailing-slash rule, and whether the host injects redirects of its own.
#
#   ./verify-routes.sh https://leahylending.com
#   ./verify-routes.sh https://staging.example.com          # staging host
#   ./verify-routes.sh https://leahylending.com user:pass    # if HTTP auth is on
#
# Exits non-zero if anything is wrong, so it can gate a deploy.
#
# A note on why this matters more than usual: a misplaced 301 is cached hard by
# browsers and CDNs. One bad rule during development kept returning from cache
# after the server was fixed. Run this immediately after upload, before the
# redirects have had a chance to be cached by anything real.

set -uo pipefail

# Where this script lives, so the Austin page list can be derived from the
# fileset beside it. Same resolution preflight.sh uses.
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="${1:-}"
AUTH="${2:-}"
if [ -z "$BASE" ]; then
  echo "usage: $0 <base-url> [user:pass]" >&2
  exit 2
fi
BASE="${BASE%/}"
MP="/texas/dallas-fort-worth"

CURL=(curl -s -o /dev/null -A "leahy-route-check/1.0")
[ -n "$AUTH" ] && CURL+=(-u "$AUTH")

pass=0; fail=0

# status of a URL without following redirects
code() { "${CURL[@]}" -w '%{http_code}' "$1"; }
# Location header of a redirect
loc()  { curl -s -I -A "leahy-route-check/1.0" ${AUTH:+-u "$AUTH"} "$1" | tr -d '\r' \
         | awk 'tolower($1)=="location:"{print $2}' | tail -1; }
# final URL after following redirects
final() { "${CURL[@]}" -L -w '%{url_effective}' "$1"; }

ok()  { pass=$((pass+1)); printf '  [x] %s\n' "$1"; }
bad() { fail=$((fail+1)); printf '  [ ] %s\n' "$1"; }

expect_code() { # url expected label
  local got; got=$(code "$1")
  if [ "$got" = "$2" ]; then ok "$3 ($2)"; else bad "$3 — expected $2, got $got   $1"; fi
}

expect_301_to() { # url expected-path label
  local got_code got_loc
  got_code=$(code "$1"); got_loc=$(loc "$1")
  case "$got_loc" in
    "$2"|"$BASE$2") ;;
    *) bad "$3 — Location was '${got_loc:-none}', expected $2"; return;;
  esac
  if [ "$got_code" = "301" ]; then ok "$3 (301 -> $2)"
  else bad "$3 — Location correct but status was $got_code, expected 301"; fi
}

PAGES=(
  ""
  "/mortgage-payment-amortization-calculator"
  "/about"
  "/terms"
  "/privacy"
  "/contact"
  "/home-loans"
  "/bank-statement-mortgages"
  "/1099-mortgages"
  "/self-employed-mortgages"
  "/asset-utilization-mortgages"
  "/no-ratio-mortgages"
  "/super-jumbo-mortgages"
  "/dscr-investor-loans"
  "/construction-loans"
  "/rsu-bonus-commission-income"
)

# Products consolidated onto the two hubs, mirroring the Austin site. Each
# target is the href Austin's own program card uses. "slug|hub" pairs.
CONSOLIDATED=(
  "how-to-qualify|self-employed-mortgages"
  "dscr-investor-mortgages|dscr-investor-loans"
  "rsu-bonus-commission-mortgages|rsu-bonus-commission-income"
  "profit-and-loss-mortgages|self-employed-mortgages"
  "asset-only-mortgages|self-employed-mortgages"
  "bridge-loans|home-loans"
  "buy-before-you-sell|home-loans"
  "seller-financing-more|home-loans"
  "spec-construction-loans|home-loans"
  "jumbo-mortgages|home-loans"
  "second-home-mortgages|home-loans"
)

echo "Verifying $BASE"
echo
echo "1. The 14 DFW pages serve 200 at the canonical URL"
for p in "${PAGES[@]}"; do
  expect_code "$BASE$MP$p/" 200 "$MP$p/"
done

echo
echo "2. URL variants collapse to the canonical form"
for p in "${PAGES[@]}"; do
  [ -n "$p" ] && expect_301_to "$BASE$MP$p" "$MP$p/" "no trailing slash: $MP$p"
  expect_301_to "$BASE$MP$p/index.html" "$MP$p/" "index.html: $MP$p/index.html"
done

echo
echo "3. Retired and consolidated routes 301 to the right page"
expect_301_to "$BASE$MP/bank-statement-loans/" "$MP/bank-statement-mortgages/" "retired route (with slash)"
if [ "$(final "$BASE$MP/bank-statement-loans/")" = "$BASE$MP/bank-statement-mortgages/" ]; then
  ok "retired route lands on the current page"
else
  bad "retired route lands on $(final "$BASE$MP/bank-statement-loans/")"
fi
# and must not still be serving the old draft
if curl -s -L -A "leahy-route-check/1.0" ${AUTH:+-u "$AUTH"} "$BASE$MP/bank-statement-loans/" \
   | grep -q "Move Forward with Confidence"; then
  bad "retired route STILL SERVES the first-generation draft"
else
  ok "retired route no longer serves the old draft"
fi

for entry in "${CONSOLIDATED[@]}"; do
  slug="${entry%%|*}"; hub="${entry##*|}"
  expect_301_to "$BASE$MP/$slug/" "$MP/$hub/" "consolidated: $slug -> $hub"
  if [ "$(final "$BASE$MP/$slug/")" = "$BASE$MP/$hub/" ]; then
    ok "$slug lands on $hub"
  else
    bad "$slug lands on $(final "$BASE$MP/$slug/")"
  fi
done

# a consolidated page must not still be served from disk
for entry in "${CONSOLIDATED[@]}"; do
  slug="${entry%%|*}"
  if [ "$(code "$BASE$MP/$slug/")" = "200" ]; then
    bad "$slug returns 200 -- the page file is still deployed"
  else
    ok "$slug is not served from disk"
  fi
done
echo
echo "4. Intermediate and source paths 404"
expect_code "$BASE/texas/" 404 "/texas/"
expect_code "$BASE/texas/houston/" 404 "/texas/houston/ (market with no page)"
expect_code "$BASE$MP/nope/" 404 "unknown DFW page"
expect_code "$BASE/_template/" 404 "/_template/"
expect_code "$BASE/landing-manifest.json" 404 "landing-manifest.json"
# Every source doc named in the .htaccess 404 rule must actually 404.
# Only three of the seven were listed here, so CRM-ROUTING.md, IMAGE-CREDITS.md,
# COPY-REVIEW.md and GO-LIVE.md were never checked - and COPY-REVIEW.md carries
# unapproved copy while IMAGE-CREDITS.md names undocumented licensing. The list
# is read from the rule so adding a doc there covers it here automatically.
SOURCE_DOCS=$(grep 'RewriteRule' "$HERE/.htaccess" | grep '\.md' | head -1 | sed 's/.*(//;s/).*//' | tr '|' ' ')
[ -z "$SOURCE_DOCS" ] && SOURCE_DOCS="LANDING-PAGE-SPEC COMPLIANCE-RULES HANDOFF CRM-ROUTING IMAGE-CREDITS COPY-REVIEW GO-LIVE"
for doc in $SOURCE_DOCS; do
  expect_code "$BASE/$doc.md" 404 "$doc.md is not served"
done
# Not in the fileset at all, so Apache denies it before the rewrite rule runs and
# answers 403 rather than 404. Both mean not served; only a 200 would be a
# failure, and asserting one specific denial code tested the web server rather
# than the site.
CLAUDE_CODE=$(curl -s -o /dev/null -w "%{http_code}" -A "leahy-route-check/1.0" \
              ${AUTH:+-u "$AUTH"} "$BASE/.claude/static-server.js")
case "$CLAUDE_CODE" in
  403|404) ok "/.claude/ is not served ($CLAUDE_CODE)" ;;
  *) bad "/.claude/static-server.js returned $CLAUDE_CODE — it must not be served" ;;
esac

echo
echo "5. The Austin side is untouched"
# SPA routes with no file of their own: the shell answers 200 directly.
for p in / /about /contact /privacy /terms ; do
  expect_code "$BASE$p" 200 "$p"
done
# Routes that became real directories in the static conversion. Apache 301s the
# unslashed form to the slashed one, and the slashed form is what each of those
# pages declares as its own canonical — so the redirect is correct, and
# expecting 200 here reported the conversion working as eight failures. The
# sitemap was corrected to the slashed form for the same reason.
for p in /home-loans /bank-statement-loans /1099-mortgage-loans \
         /dscr-investor-loans /construction-loans \
         /bonus-commission-rsu-income-mortgage /self-employed-mortgage-loans \
         /how-self-employed-borrowers-qualify-for-mortgage \
         /mortgage-payment-amortization-calculator ; do
  expect_301_to "$BASE$p" "$p/" "unslashed: $p"
  expect_code "$BASE$p/" 200 "$p/"
done

echo
echo "6. Indexing state is consistent"
RT=$(curl -s -A "leahy-route-check/1.0" ${AUTH:+-u "$AUTH"} "$BASE/robots.txt")
if printf '%s' "$RT" | grep -qE '^\s*Disallow:\s*/\s*$'; then
  echo "  robots.txt: BLOCKING all crawlers (staging state)"
  EXPECT_INDEXABLE=no
else
  echo "  robots.txt: allowing crawlers (production state)"
  EXPECT_INDEXABLE=yes
fi
# Seven DFW pages are deliberately noindex, follow — held out of the index as
# near-duplicates of Austin pages, but crawlable so their links still pass
# through. Against the old rule that read as seven mismatches, so what is
# checked now is the contradiction that actually matters: robots.txt must not
# BLOCK a page, and a page must not claim to be indexable while robots.txt
# disallows it. A page choosing noindex for itself is a decision.
for p in "${PAGES[@]}"; do
  META=$(curl -s -A "leahy-route-check/1.0" ${AUTH:+-u "$AUTH"} "$BASE$MP$p/" \
         | grep -o '<meta name="robots" content="[^"]*"' | head -1)
  if printf '%s' "$META" | grep -q noindex; then HAS=no; else HAS=yes; fi
  if [ "$EXPECT_INDEXABLE" = "no" ] && [ "$HAS" = "yes" ]; then
    bad "robots CONTRADICTION at $MP$p/ — page says indexable, robots.txt disallows"
  elif printf '%s' "$META" | grep -q nofollow; then
    bad "$MP$p/ is nofollow — its links stop passing through"
  else
    ok "robots state is coherent: $MP$p/ ($( [ "$HAS" = yes ] && echo indexable || echo 'noindex, follow'))"
  fi
done

echo
echo "7. Austin product pages — static files that must shadow the React routes"
# These eight are static copies placed at live Austin URLs. The server serves a
# real file in preference to the SPA rewrite, which is the whole mechanism: if
# one of them is missing, the route silently falls back to the React page and
# the questionnaire disappears with no error anywhere.
# Derived from the fileset, not hardcoded. The list was written into this array
# when the section was generated, so a ninth Austin page would simply never have
# been tested - the exact drift this project keeps hitting. Resolved the same way
# preflight.sh resolves the fileset: ../upload when run from the package, else
# the repo root. Any top-level directory holding an index.html is an Austin page;
# texas/ is the DFW tree and is covered by the sections above.
if   [ -d "$HERE/../upload" ]; then FS="$(cd "$HERE/../upload" && pwd)"
elif [ -d "$HERE/texas" ];     then FS="$HERE"
else FS=""; fi
AUSTIN_PAGES=()
if [ -n "$FS" ]; then
  # Selected by the page identifying ITSELF, not by directory name. A name-based
  # sweep pulled in _template and the calculator - the calculator is noindex by
  # design and would fail the indexability assertion. An Austin product page is
  # exactly one that carries data-crm-tags="austin", which is also what makes its
  # leads route, so the two cannot disagree.
  for d in "$FS"/*/; do
    n=$(basename "$d")
    [ -f "$d/index.html" ] || continue
    grep -q 'data-crm-tags="austin"' "$d/index.html" || continue
    AUSTIN_PAGES+=("$n")
  done
fi
if [ ${#AUSTIN_PAGES[@]} -eq 0 ]; then
  note "no Austin pages found in the fileset — section 7 skipped"
else
  printf '     %d Austin pages found in the fileset
' "${#AUSTIN_PAGES[@]}"
fi
# Fetched once to a file per page, then grepped from the file. Holding a 73 KB
# body in a shell variable and piping it through printf for each of eight checks
# gave inconsistent results between pages for identical code - the body was
# being truncated. File-based grep is reliable and it is one request, not two.
for p in "${AUSTIN_PAGES[@]}"; do
  TMP=$(mktemp)
  CODE=$(curl -s -A "leahy-route-check/1.0" ${AUTH:+-u "$AUTH"} -o "$TMP" -w '%{http_code}' "$BASE/$p/")
  SIZE=$(wc -c < "$TMP" | tr -d ' ')

  if [ "$CODE" = "200" ]; then ok "/$p/ (200)"; else bad "/$p/ returned $CODE"; fi

  # the SPA shell is ~3.4 KB; a real page is tens of KB. A shell-sized response
  # means the static file is absent and React is answering instead.
  # Everything below reads the page body. If the response is shell-sized the
  # static file is absent and React answered, so those checks would be measuring
  # the SPA shell rather than our page - and the shell has a description and the
  # site-wide JSON-LD, so they would PASS and read as reassurance. Skip them and
  # say so once, otherwise a pre-deploy run reports a confusing mix.
  if [ "$SIZE" -le 20000 ]; then
    bad "/$p/ is only $SIZE bytes - not deployed; the React route is answering (content checks skipped)"
    # One true observation about the LIVE page while we are here: the React
     # pages mirror aggregateRating into schema, which Eric bars. Our static
     # page removes it. Reported, not counted as a failure of ours.
    if grep -q 'aggregateRating' "$TMP"; then
      printf '  [33mnote[0m    %s
' "/$p/ the LIVE React page mirrors a ratings claim into schema - our static page drops it"
    fi
    rm -f "$TMP"
    continue
  fi
  ok "/$p/ is the static file, not the SPA shell ($SIZE bytes)"

  if grep -q 'aside class="form-card"' "$TMP"; then ok "/$p/ carries the questionnaire"
  else bad "/$p/ has no questionnaire"; fi

  if grep -q 'id="ll-mobile"' "$TMP"; then ok "/$p/ has a working mobile panel"
  else bad "/$p/ has no mobile panel - mobile navigation is dead"; fi

  if grep -q 'data-crm-tags="austin"' "$TMP"; then ok "/$p/ tagged austin"
  else bad "/$p/ is missing the austin CRM tag"; fi

  if grep -q '(214) 531-6416' "$TMP"; then bad "/$p/ shows the DFW phone number"
  else ok "/$p/ keeps the Austin phone"; fi

  if grep -q 'name="description"' "$TMP"; then ok "/$p/ has a meta description"
  else bad "/$p/ has no meta description"; fi

  if grep -q 'application/ld+json' "$TMP"; then ok "/$p/ has JSON-LD"
  else bad "/$p/ has no JSON-LD"; fi

  if grep -q 'aggregateRating' "$TMP"; then bad "/$p/ mirrors a ratings claim into schema"
  else ok "/$p/ has no ratings claim in schema"; fi

  # NOT the staging-aware check used for DFW: these are live ranking pages and
  # must be indexable regardless of what robots.txt currently says.
  if grep -q 'name="robots" content="noindex' "$TMP"; then
    bad "/$p/ is NOINDEX - a live ranking page, so that is a de-indexing incident"
  else ok "/$p/ is indexable"; fi
  rm -f "$TMP"
done

echo
echo "8. Images referenced by the DFW pages are actually served"
# A build gate proves a file exists in the source tree. It cannot prove the
# file arrives: the package ships a subset and withholds hero-home.webp on
# purpose, so a reference can be valid on disk and still 404 for a visitor.
IMG_TMP="$(mktemp)"
: > "$IMG_TMP"
for p in "${PAGES[@]}"; do
  BODY="$(mktemp)"
  curl -s ${AUTH:+-u "$AUTH"} "$BASE/texas/dallas-fort-worth$p/" -o "$BODY"
  grep -oE "/assets/img/[A-Za-z0-9._-]+\\.(webp|png|jpg|jpeg|svg|gif|avif|ico)" "$BODY" >> "$IMG_TMP" 2>/dev/null
  # Five program heroes are CSS background-images, declared only in
  # landing.css and never in the markup. Scraping the HTML alone missed
  # exactly the files most likely to break, so follow every same-origin
  # stylesheet the page links as well.
  for css in $(grep -o 'href="/[A-Za-z0-9._/-]*\.css"' "$BODY" | sed 's/href="//;s/"//' | sort -u); do
    curl -s ${AUTH:+-u "$AUTH"} "$BASE$css" \
      | grep -oE "/assets/img/[A-Za-z0-9._-]+\\.(webp|png|jpg|jpeg|svg|gif|avif|ico)" >> "$IMG_TMP" 2>/dev/null
  done
  rm -f "$BODY"
done
IMGS="$(sort -u "$IMG_TMP")"
rm -f "$IMG_TMP"
if [ -z "$IMGS" ]; then
  bad "no /assets/img/ references found on any DFW page - the scrape is broken"
else
  for img in $IMGS; do
    c=$(code "$BASE$img")
    if [ "$c" = "200" ]; then ok "$img (200)"
    else bad "$img returned $c - referenced by a DFW page but not served"; fi
  done
fi

# The closing-CTA background was an aerial of Lake Austin waterfront estates.
# Wrong market for this page, and the price tier implied a product bracket
# nobody approved. Named explicitly because it is a decision, not a sweep.
HOME_BODY="$(mktemp)"
curl -s ${AUTH:+-u "$AUTH"} "$BASE/texas/dallas-fort-worth/" -o "$HOME_BODY"
if grep -q "austin-skyline-home.webp" "$HOME_BODY"; then
  bad "the market home still references the Lake Austin estates aerial"
else ok "the market home no longer references the Lake Austin estates aerial"; fi
# The replacement photograph is applied by CSS — home-sections.css sets it as
# the background-image on .dh-hero-media — so its filename never appears in the
# page HTML. Grepping the body for it therefore failed on every run since the
# hero was built, while reporting a missing "closing-CTA background" that is
# actually the hero and is not missing at all. The check now looks where the
# reference lives, and confirms the file is served rather than just named.
HERO_IMG="/assets/img/suburban-neighborhood-aerial.webp"
if curl -s ${AUTH:+-u "$AUTH"} "$BASE/landing-assets/home-sections.css" | grep -q "suburban-neighborhood-aerial.webp"; then
  HERO_CODE=$(curl -s -o /dev/null -w "%{http_code}" ${AUTH:+-u "$AUTH"} "$BASE$HERO_IMG")
  if [ "$HERO_CODE" = "200" ]; then
    ok "the market home hero photograph is referenced in CSS and served ($HERO_CODE)"
  else
    bad "home-sections.css references $HERO_IMG but the host returns $HERO_CODE"
  fi
else
  bad "home-sections.css no longer references the market home hero photograph"
fi
if grep -q "alt=\"Austin luxury homes\"" "$HOME_BODY"; then
  bad "the old CTA alt text is still on the market home"
else ok "the old CTA alt text is gone"; fi
rm -f "$HOME_BODY"

echo
echo "-------------------------------------------"
printf '  %d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ] && echo "  routing confirmed on this host" || echo "  DO NOT ANNOUNCE THE LAUNCH — fix the above first"
exit $(( fail > 0 ))
