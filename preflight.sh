#!/usr/bin/env bash
# Pre-flight: confirm every asset the fileset REFERENCES is really present on the
# target host, and that the shell points at the build the host actually serves.
#
#   ./preflight.sh https://leahylending.com
#
# Two traps on this host, both of which return HTTP 200:
#
# 1. SPA FALLBACK. .htaccess rewrites any miss to index.html, so a request for a
#    file that does not exist returns 200 with Content-Type text/html and the
#    React shell as the body. Four asset files (favicon.svg, favicon-32.png,
#    apple-touch-icon.png, og-leahylending.jpg) were missing from production for
#    exactly this reason, and a status-code check reported all four "ok".
#
# 2. ORPHANED HASHED ASSETS. Superseded bundles are never deleted, so a stale
#    filename reference also returns 200 while serving an older build.
#
# So: never trust a status code alone. Compare the body against the SPA shell,
# and compare filenames against the live shell.
#
# References are collected in BOTH forms. An earlier version scanned only
# "/assets/... and so never saw og:image / twitter:image, which are written as
# absolute https://leahylending.com/assets/... URLs -- hiding one of the four
# missing files from its own report.
#
# A miss is only a FAILURE if this fileset does not ship the file. On a full
# deploy a missing file is the thing being fixed, so it is reported as "will be
# created" -- telling you not to upload the fix would be backwards.
set -u
HOST="${1:-}"
[ -z "$HOST" ] && { echo "usage: ./preflight.sh https://leahylending.com"; exit 2; }
HOST="${HOST%/}"
HERE="$(cd "$(dirname "$0")" && pwd)"
if   [ -d "$HERE/../upload" ]; then UP="$(cd "$HERE/../upload" && pwd)"
elif [ -d "$HERE/texas" ];     then UP="$HERE"
else echo "cannot locate the fileset (no ../upload and no ./texas)"; exit 2; fi
UA="leahy-preflight/1.0"
pass=0; fail=0; warn=0; creates=0
ok()   { printf "  \033[32mok\033[0m      %s\n" "$1"; pass=$((pass+1)); }
bad()  { printf "  \033[31mFAIL\033[0m    %s\n" "$1"; fail=$((fail+1)); }
note() { printf "  \033[33mwarn\033[0m    %s\n" "$1"; warn=$((warn+1)); }
new()  { printf "  \033[36mcreate\033[0m  %s\n" "$1"; creates=$((creates+1)); }

echo "Pre-flight against $HOST"
echo "Fileset: $UP"
echo ""

curl -s -A "$UA" --max-time 30 "$HOST/" -o /tmp/ll-shell.html
SHELL_MD5=$(md5sum /tmp/ll-shell.html | cut -d' ' -f1)
echo "0. SPA-miss fingerprint"
echo "     any response with this md5 is a MISS dressed as a 200: ${SHELL_MD5:0:12}"

echo ""
echo "1. every asset the fileset references (root-relative AND absolute)"
# THREE scans, not two. The first two matched only double-quoted and absolute
# references, so every stylesheet reference of the form url(/assets/img/foo.webp)
# was invisible here -- which is exactly how the program hero photographs are
# written in landing.css. This check reported 14 assets and saw none of the five
# new heroes. An unshipped image is silent: the hero renders on the navy
# fallback and nothing errors, which is the failure this whole script exists to
# catch.
#
# SCOPED TO WHAT A BROWSER ACTUALLY FETCHES: html, css, and the compiled bundle.
# It used to scan every file under $UP, which on a working tree is the repo root
# -- so it read .sh and .md files and treated regex source and prose as asset
# references. It was matching its OWN patterns (/assets/[^"]+ and the comment
# above) and, once verify-routes.sh gained an image sweep, that file's
# /assets/img/[A-Za-z0-9._-]+ pattern too. Six spurious FAILs and a
# "Do not upload" on a fileset that was fine. Verified: every reference in the
# compiled bundle also appears in html or css, so nothing is lost by the scope.
#
# The extension requirement is the second guard: a reference must name a real
# file, so a pattern fragment cannot pass even if a scanned file gains one.
{
  grep -rhoE '"/assets/[^"]+' --include='*.html' --include='*.css' --include='*.js' "$UP" 2>/dev/null | sed 's/^"//'
  grep -rhoE "'/assets/[^']+" --include='*.html' --include='*.css' --include='*.js' "$UP" 2>/dev/null | sed "s/^'//"
  grep -rhoE "https://[a-z.]*leahylending\.com/assets/[^\"']+" --include='*.html' --include='*.css' --include='*.js' "$UP" 2>/dev/null | sed 's|^https://[a-z.]*leahylending\.com||'
} | sed "s/[\",)']*$//" | sort -u \
  | grep -E '^/assets/[A-Za-z0-9._/-]+\.(webp|png|jpg|jpeg|svg|gif|avif|ico|css|js|json|woff2?|ttf)$' \
  > /tmp/ll-refs.txt
echo "     $(wc -l < /tmp/ll-refs.txt) distinct references"
while read -r p; do
  code=$(curl -s -A "$UA" --max-time 60 "$HOST$p" -o /tmp/ll-a.bin -w '%{http_code}')
  body=$(md5sum /tmp/ll-a.bin | cut -d' ' -f1)
  ships=0; [ -f "$UP$p" ] && ships=1
  if [ "$code" != "200" ]; then
    if [ "$ships" = "1" ]; then new "$code     $p  -- absent on host, shipped in this fileset"
    else bad "$code     $p  -- absent on host and NOT in the fileset"; fi
  elif [ "$body" = "$SHELL_MD5" ]; then
    if [ "$ships" = "1" ]; then new "200 MISS $p  -- SPA fallback; this fileset creates it"
    else bad "200 MISS $p  -- SPA fallback, file NOT on host and NOT in the fileset"; fi
  elif [ "$ships" = "1" ] && [ "$(md5sum "$UP$p" | cut -d' ' -f1)" != "$body" ]; then
    note "200      $p  -- on host but not byte-identical; this fileset replaces it"
  else
    ok "200      $p"
  fi
done < /tmp/ll-refs.txt

echo ""
echo "2. the shell points at the build the host serves"
LOCAL_JS=$(grep -oE 'src="/assets/index[^"]+' "$UP/index.html" 2>/dev/null | head -1 | sed 's/^src="//')
LIVE_JS=$(grep -oE 'src="/assets/index[^"]+' /tmp/ll-shell.html   | head -1 | sed 's/^src="//')
echo "     fileset shell: ${LOCAL_JS:-none}"
echo "     host shell:    ${LIVE_JS:-none}"
if [ -n "$LIVE_JS" ] && [ "$LOCAL_JS" = "$LIVE_JS" ]; then
  ok "same bundle filename"
elif [ -n "$LOCAL_JS" ] && [ -f "$UP$LOCAL_JS" ]; then
  new "differs, but the fileset ships $LOCAL_JS -- correct for a full deploy"
else
  bad "MISMATCH and the fileset does not ship it -- would repoint the app at another build"
fi

echo ""
printf "  %d ok, %d to be created/replaced, %d warnings, %d failures\n" "$pass" "$creates" "$warn" "$fail"
if [ "$fail" -gt 0 ]; then
  echo "  Do not upload. A referenced asset is missing from BOTH the host and the fileset."
  exit 1
fi
if [ "$creates" -gt 0 ] || [ "$warn" -gt 0 ]; then
  echo "  Clear to upload. The create/replace rows are what this deploy fixes."
  echo "  Re-run after uploading: everything should then read ok."
else
  echo "  Clear to upload. Host already matches the fileset exactly."
fi
