# Response to the DFW Indexation and GEO Readiness Handoff

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 21 September 2026
**Re:** Your handoff of 21 September 2026

---

## In one paragraph

You were right, and the cause is smaller than it looks. Every one of the ten DFW
pages was serving `noindex, nofollow, noarchive, nosnippet`. Nothing else was
wrong with any of them — all ten return HTTP 200, none sends an `X-Robots-Tag`
header, every canonical is self-referencing, `robots.txt` restricts nothing, and
Googlebot and Bingbot receive byte-identical responses. That meta tag is the
staging value this project stamps on every DFW page by design. It is removed at
deploy time by a switch that operates on the files about to be uploaded, and
**that step was never run**. The site went live carrying the staging value, and
`robots.txt` was never uploaded at all. All ten pages are now indexable in the
build and ready to upload. A further sweep found five things you did not ask
about: four are fixed, and one is a live Austin page that has been unindexable
since it went up, which is held at its current state pending your answer. Six
items need a decision from you before anything is published.

---

## 1. What has been done

Status language below follows the project's convention. **Implemented in
staging** means the change exists in the build and has been verified there. It
does not mean published, and it does not mean approved.

### The indexing block — Implemented in staging

| | Before | Now |
| --- | --- | --- |
| Robots meta, the ten pages | `noindex, nofollow, noarchive, nosnippet` | `index, follow, max-snippet:-1, max-image-preview:large` |
| `googlebot` meta | matched the above | matches the above |
| `X-Robots-Tag` header | none | none |
| `robots.txt` | host default, no `Sitemap:` line | production file, `Allow: /` plus `Sitemap:` |
| Pages in the sitemap | 9 of 10 | 10 of 10 |

No `bingbot` meta exists anywhere on the site; Bing honors the `robots` value.

### Your Section 4 audit — Steps 1 to 6 complete

- **Step 1, public browser test.** All ten loaded from a browser with no Leahy
  session of any kind. Each returned 200, no redirect, exactly one H1, real
  content and the scenario form. No login screen, CAPTCHA or challenge.
- **Step 2, HTTP and redirects.** 200 / `text/html` / no redirect chain on all
  ten. Repeated with Googlebot and Bingbot user agents: identical responses,
  byte for byte. No bot-specific behavior of any kind.
- **Step 3, raw source.** Title, H1, robots meta, canonical and content volume
  read from raw HTML, not DevTools. All ten self-canonical, one H1 each, between
  6,200 and 16,600 characters of crawlable text inside `<main>`.
- **Step 4, robots.txt.** Nothing restricted. Detail in section 3 below.
- **Step 5, sitemap.** Found, all ten present, and every one of its 25 URLs
  confirmed to return 200 with no redirect.
- **Step 6, internal links.** 821 ordinary HTML anchors mapped. Each of the ten
  has 15 inbound source pages and your cross-link matrix is satisfied in full.
  One weakness found — section 2.7.

### Your Section 6 build task — complete

All six requirements, the four named output files, every element the report was
required to contain, and all five validation rules. The validation rules are
implemented as build failures rather than prose: the build refuses to complete
if an intended-to-rank URL renders noindex, if a canonical is missing or points
away, if a URL is absent from the sitemap, or if a page has no ordinary internal
HTML link.

Nothing on your "Do not" list was touched. No public copy, page name, taxonomy,
URL, redirect or canonical was changed, no schema was added, and no claim was
added or strengthened.

### Four documents, delivered in `go-live/`

```text
dfw-indexation-audit.md          the readable report
dfw-indexation-audit.csv         your column set, one row per URL
dfw-internal-link-map.csv        your column set, one row per link
dfw-indexation-remediation.md    what changed, and what only Search Console can finish
```

The two CSVs import directly into Tabs 2 and 3 of the spreadsheet your Section 5
specifies.

---

## 2. Things not in your handoff that were also wrong

### 2.1 The crawl path into DFW was about to stay shut — fixed

Six pages are held back from the index permanently because they are
near-duplicates of Austin pages. One of them is the DFW market home. Mapping the
link graph showed that **the market home is the only static route into the DFW
cluster from the indexed site**: six Austin program pages each carry one
"Dallas–Fort Worth Options" anchor, and every one of them points at the market
home, not at any of the ten. The Austin React application's link to DFW is added
by JavaScript after the page loads and does not exist in the HTML a crawler is
served at all.

Held back under the old value, that page also said `nofollow`. Flipping to
production would have made the ten pages indexable while the single door into
them told crawlers not to walk through it — leaving sitemap-only discovery with
no internal link signal, which Bing in particular handles poorly.

The held-back pages now use `noindex, follow` in production. They stay out of
the index for exactly the reason they were held back; crawlers can walk through
them to the pages that are meant to rank.

### 2.2 Eight sitemap URLs pointed at redirects — fixed

This is your Section 10 escalation, verbatim: *"the sitemap or internal links
point to an old/redirected URL."*

The Austin block of the sitemap predates the static conversion and listed the
application's route names without trailing slashes — `/home-loans`,
`/bank-statement-loans` and six more. Once those became real directories the
server began 301-ing the unslashed form, while each of those pages declares the
**slashed** URL as its own canonical. Sitemap, canonical and server disagreed
three ways on the same eight pages.

Corrected by a derived rule rather than a list of slugs, so it cannot go stale
the next time a page is added, and re-verified against the live site: all 25
sitemap URLs now resolve 200 with no redirect.

### 2.3 Where the block came from, for the record

Not a CMS setting, a host setting or a CDN rule — there is no CMS, and no CDN or
WAF headers appear in the live responses. The staging value is written into each
page by its builder and removed by `go-live/set-indexing.js` at deploy time. The
one-line cause is that the deploy step was skipped.

### 2.4 An Austin page has been unindexable since it went up — needs your call

**The Austin mortgage calculator, `/mortgage-payment-amortization-calculator/`,
is live, returns 200, and carries `noindex, nofollow, noarchive, nosnippet`.** It
is also absent from the sitemap. Nobody decided that.

The switch identifies Austin pages by a CRM tag the builder stamps on lead-form
pages. The calculator is a tool page with no lead routing, so it carries no CRM
tag — and the switch therefore never saw it in either direction. It was not on
the held-back list and it was not in the page list either. It did not exist to
the tool that sets indexing, so it kept whatever value it was built with, which
is the staging one.

The detection is fixed: the test is now "a directory at the web root holding an
index.html that is not the DFW tree or an asset folder", which is a fact about
the layout rather than a proxy for it.

**The page's value has deliberately NOT been changed.** It is now on the
held-back list, which preserves exactly the state that is live today rather than
turning an unnoticed defect into an unreviewed publication. It did gain `follow`,
so crawlers can pass through it, but it remains unindexed.

This needs your decision, and there is a specific reason to think the current
state is wrong: **the DFW calculator is held back because it duplicates this
Austin one.** If the Austin original is also unindexed, then neither calculator
can rank and the duplicate-avoidance protects nothing. Removing one line makes
it indexable; it would also need adding to the sitemap's Austin block, which is
hand-maintained.

### 2.5 Two stale build comments were shipping to production — fixed

Publicly readable in view-source on the DFW market home and contact page:

```text
<!-- Staging: the whole package is noindex and robots.txt is Disallow: /. ... -->
<!-- Staging. Flip with scratchpad/dfw-robots.js production at launch ... -->
```

Both described the build as noindex with `robots.txt` set to `Disallow: /`, which
will be false the moment the corrected files are uploaded, and the second named a
script that no longer exists. Replaced with a mode-neutral note that states where
indexing is actually decided, so the comment cannot contradict the tag above it
again.

### 2.6 The control that guards promotion had never run — fixed

Your Section 6 required that unresolved placeholders block promotion to
indexable, and a gate exists for it. It had never once seen an indexable page.

The repository is permanently staging by design — the production value is
written onto the upload set at deploy time — and the gate could only read the
repository. So the branch that fails the build on a placeholder in an indexable
page had never executed, and its own report printed "0 indexable" on every run
without anyone noticing what that meant. A control that cannot reach the
condition it guards is not a control.

It now accepts a path, so the same gate runs against the flipped upload set as a
pre-upload step. Pointed at the corrected files it reports 11 indexable pages
checked and no unresolved placeholders, and it was negative-tested by planting a
placeholder on an indexable page to confirm it fails.

### 2.7 The remaining structural weakness — Proposed future enhancement

Even with 2.1 fixed, the ten pages have deep linking among themselves and one
shallow connection to the indexed site: a single hop, through a page that is
itself not indexed. Two changes would strengthen it, and both are beyond the
scope you set for this task, so neither was made:

1. Real static anchors from the Austin program pages to their matching DFW
   pages, rather than only to the market home.
2. The Austin application's DFW link rendered into the served HTML rather than
   added by JavaScript.

---

## 3. What needs your consideration or approval

### 3.1 The evidence-record condition is yours, and this change triggers it

**Pending evidence record — needs your decision before publishing.**

Three claims are currently approved for a **noindex staging** build and carry
"Pending evidence record" against an indexable production release:

```text
258 five-star reviews
Over $1 billion in loans funded
25+ Years of Experience
```

Making these pages indexable is the precise event those entries were written to
gate. Your 21 September handoff does not mention them. They are not resolved by
anything in this work, and the build has not treated the flip as clearing them.

Please either record the evidence or waive the condition explicitly. It should
not pass silently.

### 3.2 `home-loans` — decided by Jake, but the duplication is unresolved

**Owner-approved (Jake Bennett, 21 September 2026).** The URL is #9 on your
intended-to-rank list. It had been held back since 9 September, on instruction,
because it measured **84% identical** to the Austin `/home-loans/` page by
5-gram overlap — the other seven cross-market pairs sit at 30–39%, because those
were written from the DFW template while this one is the Austin page with its
links repointed. Jake has directed that it be indexed, and it now is, and it has
entered the sitemap.

That settles the instruction. It does not settle the duplication. Two
self-canonical pages at 84% overlap are now both declaring themselves indexable,
and Google selects one canonical for a near-duplicate pair regardless of what
each page asks for. If it selects the Austin URL, the DFW page is crawled,
folded into the Austin one, and reports as a duplicate rather than ranking. No
robots tag prevents that and no build step can.

Two things follow:

- After submission, the field to watch for this URL is **Google-selected
  canonical**, not just indexed status.
- Its H1 reads **"Home Loan Solutions"** — the only one of the ten with no
  market name in its heading. Its title tag says Dallas–Fort Worth; the H1 does
  not. For the page most at risk of being treated as a duplicate, that is the
  weakest available differentiation signal. Changing it is copy, which your
  Section 4 excluded from this task, so it was left alone and is raised here.

### 3.3 Five pages remain deliberately unindexed — please confirm

**Implemented in staging, awaiting your confirmation.**

```text
/texas/dallas-fort-worth/            the market home
/texas/dallas-fort-worth/about/
/texas/dallas-fort-worth/privacy/
/texas/dallas-fort-worth/terms/
/texas/dallas-fort-worth/mortgage-payment-amortization-calculator/
```

Each is a near-duplicate of an Austin page that is already indexed, and each
self-canonicalises, so indexing both copies would put near-identical pages in
competition. They keep their nav, their paid traffic and — now — their ability
to pass crawlers through. None is on your list of ten. The calculator sits in
the main navigation, which is the one that might surprise you.

### 3.4 The Austin calculator — see 2.4

Held at its current live state pending your answer, because the alternative was
to publish a page nobody had reviewed. The reason to think it should be
indexable is in 2.4.

### 3.5 `/texas/dallas-fort-worth/contact/` is indexable but is not on your list

It is currently `index, follow` and in the sitemap. Your Section 2 names ten
URLs and this is not among them. Should it be indexable, or held back with
about, privacy and terms?

### 3.6 Two copy items noticed and deliberately not changed

Raised because your Section 4 forbade copy changes during this task, not because
they are indexation issues.

- The **DFW About page** H1 reads *"Austin's Trusted Lender for Over Two
  Decades"*. The page is not indexed, so there is no search impact, but a
  Dallas–Fort Worth visitor sees it.
- The **Austin calculator page** marquee shows the DFW telephone number
  `(214) 531-6416` where the live Austin application shows `(512) 240-2897`, and
  carries the phrase *"Austin's Trusted Mortgage Specialist"* — a market-standing
  claim of the kind removed from the DFW marquee on your 18 September direction.

---

## 4. What cannot be done from the repository

These are yours and Jake's, and no build can substitute for them.

| Your step | Why it is outstanding |
| --- | --- |
| Step 7 — Google Search Console audit | No Search Console access from the build. |
| Step 8 — Bing Webmaster inspection | Same. |
| Step 9 — cache purge | No hosting access, and premature until the corrected files are uploaded. |
| Section 5 — the audit spreadsheet | Not built. The two CSVs populate Tabs 2 and 3; Tabs 1, 4, 5 and 6 need Search Console and Bing evidence that does not exist yet. |
| Section 7D — screenshots | Requires Search Console and Bing. |

One item genuinely cannot be confirmed either way from here: whether a CDN or
WAF sits in front of the origin. None was visible in the live response headers —
`nginx`, no Cloudflare or similar — but only the hosting account can confirm
what is configured.

### Deployment order, which matters

```text
1. Upload the corrected files, INCLUDING robots.txt, which has never been uploaded
2. Purge every cache layer
3. Re-fetch each URL and confirm the robots meta actually changed
4. Submit the sitemap in Google Search Console and Bing Webmaster Tools
5. Run the Search Console Live Test per URL
6. Request indexing ONLY after each live test reports indexing allowed
```

Step 3 is not ceremony. A cache serving the old HTML would show Google the
`noindex` again, and a Request Indexing submitted against that is worse than not
submitting at all.

---

## 5. Not yet clarified

1. **Who runs Steps 7, 8 and 9?** Jake has the Search Console and hosting
   access; confirm he is the one executing, or say who is.
2. **Does the sitemap submission wait on 3.1?** If the evidence records are a
   precondition for an indexable release, then submission waits on them, and the
   sequencing in your Section 8 needs that step inserted.
3. **The spreadsheet.** Your Section 5 asks for Google Sheets. It has not been
   built. A six-tab workbook with the ten URLs, dropdowns, conditional
   formatting and filters can be generated for import if that is wanted — say
   so and it will be produced.
4. **3.2, 3.4, 3.5 and 3.6 above**, each of which needs a yes or no from you.

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

The build completing without failures states how much was checked, not that the
pages are correct or complete. This build is **not compliance-cleared and not
production-approved**, and nothing here is approval to publish. No statement is
made about whether Google or Bing will index these pages, whether they will
rank, or whether answer engines will cite them — those are Search Console and
Bing Webmaster Tools, after deployment, over time.
