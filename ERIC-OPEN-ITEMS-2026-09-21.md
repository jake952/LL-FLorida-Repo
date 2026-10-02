# Open Items — Everything Blocked On Eric

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 21 September 2026

This is written to be answered cold. It assumes you have read nothing else
today. Every item states what is true now, what is needed from you, and what
happens either way. Numbered so you can reply with a list.

Blunt version: **Handoff B cannot start.** Seven of its nine build tasks need
copy and facts only you can supply, and none has arrived. Separately, six
decisions are open, three of them about claims already live on the site.

---

## 0. State of play — read this before anything else

**Nothing has been published. The DFW pages are still invisible to search.**

Every DFW page on production is serving `noindex, nofollow, noarchive,
nosnippet`. That is why Search Console reported the Self-Employed page excluded
by a noindex tag. The cause was a missed deploy step, not a defect: this project
stamps a staging robots value on every DFW page by design and removes it at
upload time with a switch. The switch was never run.

The corrected files are built and waiting. In them:

```text
9 pages   index, follow      your nine intended-indexable DFW pages
7 pages   noindex, follow    market home, about, privacy, terms,
                             both calculators, DFW home-loans
robots.txt                   Allow: / plus the Sitemap: line — never uploaded before
sitemap.xml                  all nine, every URL verified to return 200 with no redirect
```

**None of it is live until someone uploads it.** Until then, nothing in Handoff
B's entity system can work regardless of what you approve or what gets built.

Also done, so you are not asked again: the DFW market home is already
`noindex, follow` with crawlable links, which is exactly what your Task 4
requires. And `/texas/dallas-fort-worth/home-loans/` was briefly made indexable
earlier today, before Handoff B arrived; Handoff B excludes it, so **it has been
reverted** to `noindex, follow` and removed from the sitemap. Nothing was
published in that window.

---

## 1. Blocking inputs — Handoff B tasks 1, 2, 3, 5, 6, 7

Nothing below can be substituted with placeholder text. A placeholder on a page
about a real licensed individual is a factual claim about that individual.

### 1.1 Canonical profile page (Task 1)

```text
[ ] Profile copy, final wording
[ ] Your role and title, exactly as it may appear publicly
[ ] The Leahy Lending / Kyber Mortgage Corporation relationship statement,
    in the form it may appear publicly
[ ] NMLS treatment — which number, what form, where on the page
[ ] Required disclosures, verbatim
[ ] DFW service-market statement
[ ] Areas of guidance
[ ] Headshot file, plus the alt text you want with it
[ ] Direct professional contact method
[ ] Professional profile URLs for sameAs — real, current, yours
[ ] Primary CTA destination: the DFW scenario-review form or calendar URL
[ ] Secondary CTA destination, if any
[ ] Route: /loan-officers/eric-bennett/ or /about/eric-bennett/
```

On the route: `/loan-officers/` is your stated preference and creates a new
top-level section on a site that has none. Confirm, and say whether anything
else is planned to live under it. A directory with one child forever is worth
knowing about before it exists.

### 1.2 Work With Eric module (Task 2)

```text
[ ] Module copy
[ ] Primary CTA label and destination
[ ] DSCR Investor Loans — yes or no
[ ] Construction Loans — yes or no
```

Your deployment list marks those two "only if Eric approves". They are otherwise
in your intended-indexable nine, so they will be indexed either way; the question
is only whether the module appears on them.

### 1.3 Root-site routing module (Task 3)

```text
[ ] Routing copy
[ ] Destination — your own rule excludes the market home, so this is the
    profile page, a specific indexable DFW program page, or the
    scenario-review endpoint
[ ] Which root pages it goes on
```

One correction to your list: **there is no generic Super Jumbo page on the
Austin site.** That location has nothing to attach to. The generic Self-Employed
and Bank Statement pages do exist.

Your instruction not to rely solely on links from the noindex market home for
discovery is, today, unsatisfiable — and this module is the fix. Right now the
market home is the **only** static route into the DFW cluster from the indexed
site: six Austin program pages each carry one "Dallas–Fort Worth Options" anchor
and every one of them points at the market home, not at any of the nine. The
Austin application's DFW link is added by JavaScript after load and does not
exist in the HTML a crawler is served — the raw response for
`leahylending.com/` contains zero occurrences of `dallas-fort-worth`.

### 1.4 Attribution and resources (Tasks 5, 6)

```text
[ ] "Prepared by" / "Reviewed by" wording
[ ] A named list of what you actually authored or materially reviewed
[ ] The last-reviewed date for each
[ ] Resource copy, per resource
[ ] The borrower-facing qualifier/disclaimer, verbatim
```

### 1.5 Structured data (Task 7)

No separate input. It mirrors the visible approved facts from 1.1, so it is
written once 1.1 is answered, and it will carry nothing else — no ratings, no
volume, no tenure, no awards, no address.

---

## 2. Decisions — these block the upload or need answering with it

### 2.1 Three claims you gated, now about to go indexable

**This is the one to answer first.**

Three claims are live on the site today and are approved for a **noindex staging**
build only. Each carries "Pending evidence record" against an indexable
production release — a condition you set:

```text
258 five-star reviews
Over $1 billion in loans funded
25+ Years of Experience
```

The upload makes every page carrying them indexable for the first time. Your
Handoff B validation list bars introducing a new tenure, review or volume claim.
These are not new — they are existing ones whose audience is about to change from
nobody to everybody.

**Needed: for each of the three, either the evidence record, or an explicit
waiver, or instruction to remove it before upload.** Silence defaults to
publishing them, which is the one outcome nobody has chosen.

### 2.2 The Austin mortgage calculator has been noindex by accident

`https://leahylending.com/mortgage-payment-amortization-calculator/` is live,
returns 200, and carries `noindex, nofollow, noarchive, nosnippet`. It is also
absent from the sitemap. **Nobody decided this.** The tool that sets indexing
identified Austin pages by a CRM tag that lead-form pages carry; the calculator
is a tool page with no lead routing, so it had no tag and the switch never saw it
in either direction. It has been invisible since it went up.

The detection is fixed. The page's value has deliberately **not** been changed —
it is held at exactly its current state so an unnoticed defect does not become an
unreviewed publication.

The reason to think the current state is wrong: **the DFW calculator is held back
from the index precisely because it duplicates this Austin one.** If the Austin
original is also unindexed, then neither calculator can rank and the
duplicate-avoidance protects nothing.

**Needed: should the Austin calculator be indexable?** If yes, it also needs
adding to the sitemap's Austin block, which is hand-maintained.

### 2.3 `/texas/dallas-fort-worth/contact/` is indexable and on neither of your lists

It is currently `index, follow` and in the sitemap. Your first handoff named ten
URLs and Handoff B names nine; it appears in neither.

**Needed: indexable, or held back with about, privacy and terms?**

### 2.4 DFW Home Loans — reverted, and one thing to know if you revisit it

Now `noindex, follow` and out of the sitemap, per Handoff B.

For whenever the content-differentiation brief happens: the page measured **84%
identical** to the Austin `/home-loans/` page by 5-gram overlap. The other seven
cross-market pairs sit at 30–39%, because those DFW pages were written from a
template with their own copy while this one is the Austin page with its links
repointed.

Its H1 also reads **"Home Loan Solutions"** — the only DFW program page whose H1
contains no market name. Its title tag says Dallas–Fort Worth; the heading does
not. If that page is ever meant to rank in DFW, that is the weakest available
differentiation signal and the cheapest thing to change.

---

## 3. Three copy problems already live. Not touched, because your Handoff A forbade copy changes during the technical task.

### 3.1 The DFW About page claims Austin

`https://leahylending.com/texas/dallas-fort-worth/about/`

```text
H1: "Austin's Trusted Lender for Over Two Decades"
```

The page is noindex, so there is no search impact. A Dallas–Fort Worth visitor
reading the DFW About page sees it.

### 3.2 The Austin calculator page shows the wrong phone number and a claim you removed

`https://leahylending.com/mortgage-payment-amortization-calculator/` — the gold
marquee reads:

```text
WE SAY YES WHEN OTHERS SAY NO · LEAHY LENDING SAYS YES · SINCE 2002 ·
(214) 531-6416 · AUSTIN'S TRUSTED MORTGAGE SPECIALIST ·
OVER $1 BILLION IN LOANS FUNDED
```

Two problems on one Austin page:

- **`(214) 531-6416` is the DFW number.** The live Austin application shows
  `(512) 240-2897` in the same bar on every other Austin page.
- **"Austin's Trusted Mortgage Specialist"** is a possessive market-standing
  claim. On 18 September you removed exactly that construction from the DFW
  marquee. It is still on this Austin page.

**Needed: confirm the phone correction, and say whether the superlative stays.**

### 3.3 Your own credential says 20+ years while the company now says 25+

The Austin team section carries, for you:

```text
title:        "Executive Vice President"
credentials:  "20+ Years Experience"
nmls:         "NMLS# 288376"
bio:          "Eric Bennett brings over 20 years of experience in retail,
               wholesale, and consumer direct lending..."
```

On 18 September the company tenure line was set to "25+ Years of Experience"
site-wide, and the instruction was to make every "20+ years" instance read "25+".
**This one was deliberately left alone.** It is a statement about your personal
professional history sitting beside your NMLS number, not a company claim, and
raising it would have contradicted your own bio sentence one line below it.

**Needed: confirm 20+ is correct for you, or supply the right figure.** It is
your credential; nobody else should be setting it.

---

## 4. Answered already, so you are not asked twice

- **Task 4, market home.** Already `noindex, follow`, links crawlable, not in
  the sitemap. No work needed.
- **Your Section 10 escalation, "sitemap points to a redirected URL."** Found and
  fixed: eight Austin sitemap entries had no trailing slash and 301'd, while each
  of those pages declared the slashed URL as its own canonical. All 25 sitemap
  URLs now return 200 directly.
- **No `X-Robots-Tag` anywhere**, no CDN or WAF in front of the origin that
  appears in any response header, no bot-specific behavior — Googlebot and
  Bingbot receive byte-identical responses.
- **No false DFW office or address** exists anywhere. The DFW schema correctly
  states `addressLocality: Austin`.
- **No all-caps CSS on any hero H1.**

---

## 5. What happens after you answer

```text
1. Upload the corrected files, including robots.txt, which has never been uploaded
2. Purge every cache layer
3. Re-fetch each URL and confirm the robots meta actually changed
4. Submit the sitemap in Google Search Console and Bing Webmaster Tools
5. Live Test each URL; request indexing only on the ones that pass
6. Build Handoff B's modules once 1.1 to 1.4 arrive
```

Step 3 is not ceremony. A cache serving the old HTML shows Google the `noindex`
again, and a Request Indexing submitted against that is worse than not
submitting at all.

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

Nothing here is approval to publish. No claim is made about whether Google or
Bing will index these pages, whether they will rank, or whether answer engines
will cite them or associate them with you.
