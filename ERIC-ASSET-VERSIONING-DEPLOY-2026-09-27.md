# Deployment Verification Report — Asset URL Versioning

**Date:** 27 September 2026
**Scope:** Eric §1 — asset-reference version stamping, isolated deployment
**Status:** PRE-DEPLOYMENT VERIFICATION COMPLETE · POST-DEPLOYMENT PENDING UPLOAD

---

## Scope confirmation

This upload is limited to asset-reference version stamping and the build
corrections required to support it. That claim is verified rather than asserted —
see "Isolation" below.

**Build corrections included, and why each was strictly necessary:** adding a
query string to asset references broke four build scripts that resolved a
stylesheet href to a file on disk and swallowed the failure. Each then reported
the opposite of the truth — `check-faq-accordions.js` reported that `.faq-panel`
sets no `overflow: hidden` when it does. The four now strip the query before
resolving. No page output changes as a result; this is verified below.

---

## Pre-deployment verification

### Isolation — the upload changes URLs only

Every built page was compared against the live page with version stamps
normalised away. Anything surviving that normalisation would be an unauthorised
change.

```text
pages identical to live apart from stamps ....... 33 / 33
version stamps to be added ...................... 245
sitemap.xml ..................................... unchanged
robots.txt ...................................... unchanged
```

Asset file contents were compared against production separately:

```text
assets byte-identical to live ................... 22 / 22
```

**No asset content changes. No page content changes. URLs only.**

Because route URLs, canonical tags, robots directives, form markup, form
endpoints and CRM hidden values all live inside the page HTML, byte-identity of
the normalised HTML establishes that none of them changed.

### Stamping coverage

```text
unstamped landing-asset references in upload set ... 0
stamped landing-asset references ................... 171
unstamped icon references .......................... 0
stamped icon references ............................. 74
total .............................................. 245
distinct assets hashed .............................. 22
```

Stamps are content-derived: the first 8 hex characters of the SHA-1 of the file's
bytes, e.g. `/landing-assets/accordion.js?v=94c340e5`. A future edit changes the
URL by itself; an unchanged file keeps its cached copy.

### Gate coverage

A new gate distinguishes two failures, and both were negative-tested before the
gate was trusted:

| State | Expected | Result |
|---|---|---|
| No stamps present | fail | failed, 245 references named |
| Stamps correct | pass | passed, 245 verified |
| Asset edited, stamps left behind | fail as **stale** | failed, 9 stale, old and new hash both reported |

The third case is the one a hand-maintained date stamp produces silently, and is
the reason the stamp is derived from content rather than a release date.

Full build: every gate green. 1,793 internal links + 65 in-page anchors resolve
across 33 pages. Upload set: 81 files, 7.19 MB, 19 distinct `/assets/` references
all resolving inside the set.

### Returning-visitor mechanism — verified on production

The stamping only helps if the **document** revalidates. Confirmed on the live
site:

```text
HTML documents    no Cache-Control; ETag + Last-Modified only
assets            Cache-Control: max-age=31536000
```

Conditional requests against the live DFW market page:

```text
stale validator  (If-Modified-Since: 26 Sep)   -> HTTP 200, 85,645 bytes (fresh HTML)
current validator (If-None-Match: current ETag) -> HTTP 304, 0 bytes
```

So a returning visitor revalidates the document, receives HTML carrying the new
stamped URLs, and must fetch those assets because their browser has never seen
those URLs. The year-long cache on the old URLs becomes irrelevant rather than
needing to expire.

This also confirms the fix could not have been achieved from `.htaccess`:
SiteGround's NGINX Direct Delivery serves these files off disk and never reaches
Apache (`X-Proxy-Cache-Info: DT:1` on every asset response).

### Local render verification

The built tree was loaded and inspected: all stamped asset URLs return 200, no
console errors, page renders correctly with a single marquee bar and intact
navigation.

---

## Post-deployment verification — PENDING UPLOAD

To be completed and appended once the upload is made. Against Eric's list:

```text
[ ] all rendered asset references use content-derived version values
[ ] no unstamped production asset references remain
[ ] route URLs, forms, endpoints, CRM tags, canonical tags, robots,
    sitemap entries, redirects and lead routing unchanged
[ ] returning-visitor simulation loads the updated accordion.js,
    scenario-stepper.js, home-sections.css and favicon assets
[ ] Austin contact flow functions
[ ] DFW intake flow functions
```

Note on the last two: confirming the flows requires live submissions, which
create CRM records. Those records will be logged with their IDs and deleted, per
Eric §7, and no borrower data will be used.

---

## Two findings outside this upload's scope

Raised here because both were discovered during verification. **Neither is
included in this deployment.**

### The sitemap mismatch is Eric's own profile page

Eric's §6 lists "sitemap mismatch: 22 URLs versus 23 indexable pages" as a
routine backlog item. The missing page is specifically:

```text
/texas/dallas-fort-worth/loan-officers/eric-bennett/
```

It is the **only** indexable page not listed. It carries `index, follow`, a
self-referential canonical, Person schema with NMLS identifier 288376, and 13
internal links — and it is not advertised to Google.

This is material to the author-entity and E-E-A-T work rather than a counting
discrepancy. It is also entangled with the §4 canonical-route decision, so no
change has been made. Detail is in the route-decision package.

### An intermediate path segment returns 403

```text
/texas/dallas-fort-worth/loan-officers/     HTTP 403
a genuinely absent path                     HTTP 404
```

A crawler walking up the canonical profile URL receives "forbidden" rather than
"not found". Also covered in the route-decision package, and unchanged pending
Eric's §4 response.

---

## Build controls and their limits

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not a compliance clearance and is not a production approval.

---

*Kyber Mortgage Corporation dba Leahy Lending · NMLS 2653540*
