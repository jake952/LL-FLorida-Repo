# P0 Staging Return Package

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 24 September 2026
**Re:** P0 implemented in staging — the ten items required before production review

**Status: implemented in staging. Not uploaded, not published.** No production
deployment, no live route, robots, schema, indexing, redirect or CRM-routing
change has been made. The upload set exists on disk and has not been transferred.

```text
build            62 steps, all green
pages            33 on disk
internal links   1,809 + 65 anchors, all resolve
indexing         23 indexable / 10 held back
sitemap          23 URLs, exactly matching the indexable set
schema           35 ld+json blocks, 0 invalid
web root         81 files, 0 internal .md documents
independent P0 verification   51 of 51 checks pass against the BUILT upload set
```

---

# 0. Three findings you should see before the checklist

## 0.1 `/texas/` would have returned 404 in production

`.htaccess` line 61 carried an unconditional rule:

```apache
# /texas/ carries no page of its own. Without this it returns 403
RewriteRule ^texas/?$ - [R=404,L]
```

It was correct when `/texas/` was an empty intermediate directory. With the hub
built, that rule would have served a **404 for a page that is indexable and in
the sitemap** — we would have asked Google to index a URL the server refuses.
The preview server carried the same hard-coded rule, so a casual look would have
shown the same 404 and told us nothing about why.

Fixed using the idiom already in the file one rule below it:

```apache
RewriteCond %{DOCUMENT_ROOT}/texas/index.html !-f
RewriteRule ^texas/?$ - [R=404,L]
```

The clean 404 is preserved if the hub is ever removed. `/texas/` now returns 200.

## 0.2 The lifted questionnaire rendered unstyled, and looked fine in the HTML

`/contact/` is a bundle-clone page; it ships the prebuilt Tailwind bundle. The
questionnaire is template markup whose classes (`.form-card`, the stepper
classes) are defined in `landing-assets/scenario-form.css`, which bundle clones
do not load. The markup was present, correct and complete — and rendered as
unstyled blocks. Every HTML-level check passed while the page was visibly
broken. Caught only by looking at it. The stylesheet is now linked and gated.

## 0.3 Four new CRM fields would have been silently dropped

`audit-integrity.js` failed the build with:

```text
[HIGH] posted by a form but NOT in crm_custom_fields_required —
       GoHighLevel drops these silently: selected_market
```

`source_url`, `entry_page_title`, `guide_title` and `selected_market` are now
declared in `landing-manifest.json`. **Declaring them here does not create them
in GoHighLevel.** That is an external dependency — see section 11.

---

# 1. Staging URL list

Served from the local staging origin; every route returns 200 unless noted.

```text
NEW
/texas/                                   200   index, follow   NEW neutral hub

CHANGED
/contact/                                 200   index, follow   general scenario intake
/apply/                                   200   noindex, follow robots + sitemap
/                                         200   index, follow   claim para, Yelp tile
/about/                                   200   index, follow   claim paragraph
/1099-mortgage-loans/                     200   index, follow   H1 + lede
/bank-statement-loans/                    200   index, follow   H1 + lede
/bonus-commission-rsu-income-mortgage/    200   index, follow   H1 + lede
/construction-loans/                      200   index, follow   H1 + lede
/dscr-investor-loans/                     200   index, follow   H1 + lede
/how-self-employed-borrowers-qualify-…/   200   index, follow   H1 + lede
/self-employed-mortgage-loans/            200   index, follow   H1 + lede
27 pages                                        —               Yelp link relabel
14 pages                                        —               areaServed schema

UNCHANGED BY INSTRUCTION
/home-loans/                              200   index, follow   seller financing, §8
/texas/dallas-fort-worth/home-loans/      200   noindex, follow seller financing, §8
all other DFW routes                                            tags, routing, ownership
```

---

# 2. What was checked in the browser

Rendered and inspected at desktop and at 375px:

```text
/texas/            H1, direct answer, all sections, both CTAs render.
                   375px: no horizontal scroll (scrollWidth 375 = viewport 375).
/contact/          stepper renders as a white card with the gold rule,
                   "STEP 1 OF 9", step 1 showing the five universal options:
                   Buy a home / Refinance / Take cash out / Buy or refinance an
                   investment property / I am still exploring.
                   10 panels in the DOM, 1 visible — the stepper is driving.
short-contact      renders below the questionnaire under "Prefer to send a short
                   message?" with the not-an-application note.
homepage grid      2x2 intact after the Yelp tile became 2002 / Serving Texas
                   Clients Since.
console            no errors on either page after the /texas/ fix.
```

---

# 3. Raw HTML extracts

## `/contact/` body attributes

```html
<body data-page-id="LL-CONTACT-01"
      data-page-route="/contact/"
      data-landing-page="austin_contact"
      data-market-page="austin"
      data-crm-tags="austin"
      data-campaign-theme="mortgage_scenario_review"
      data-program-interest="general"
      data-form-type="scenario_review"
      data-form-mode="live"
      data-selected-market="austin"
      data-crm-source="Scenario Review – Austin">
```

## `/contact/` hidden context — primary questionnaire

```html
<input type="hidden" name="landing_page"     value="austin_contact">
<input type="hidden" name="market_page"      value="austin">
<input type="hidden" name="selected_market"  value="austin">
<input type="hidden" name="campaign_theme"   value="mortgage_scenario_review">
<input type="hidden" name="form_type"        value="scenario_review">
<input type="hidden" name="program_interest" value="general">
```

`alternative_documentation_non_qm` appears nowhere on the page, per your §1.1.

## `/contact/` hidden context — secondary short-contact path

```html
<input type="hidden" name="landing_page"     value="austin_contact">
<input type="hidden" name="market_page"      value="austin">
<input type="hidden" name="selected_market"  value="austin">
<input type="hidden" name="form_type"        value="short_contact">
<input type="hidden" name="program_interest" value="general">
```

Its ten controls are named exactly as the DFW contact page names them:
`full_name, phone, email, what_is_your_primary_source_of_income, property_state,
est_loan_amt, loan_type, tell_us_about_your_situation, sms_consent,
sms_marketing_consent`.

## `/texas/` head and CTAs

```html
<meta name="robots" content="index, follow, max-snippet:-1, max-image-preview:large">
<link rel="canonical" href="https://leahylending.com/texas/">
<script type="application/ld+json">{"@context":"https://schema.org","@type":"WebPage",…}</script>

<a href="/contact/" class="btn-gold justify-center">Start an Austin scenario review</a>
<a href="/texas/dallas-fort-worth/" class="btn-gold justify-center">Start a Dallas–Fort Worth scenario review</a>
```

No `<form>`, no `data-crm-tags`, no `data-program-interest`, no
`FinancialService`, no `address`, no `FAQPage`.

## `/apply/`

```html
<meta name="robots" content="noindex, follow">
<link rel="canonical" href="https://leahylending.com/apply/">
```

## areaServed

```diff
- "areaServed":["Texas","Florida","Colorado","Arizona","Georgia","Washington",
-               "Oregon","Idaho","Indiana","Kansas","Oklahoma","Arkansas",
-               "Alabama","Alaska"]
+ "areaServed":"Texas"
```

14 pages. Source: `_build/austin-head-data.json`. Visible "Licensed in 14
States", the state dropdown and the 14 States Licensed stat tile are unchanged,
per your §9.

## Yelp

```diff
  homepage hero tile
- <p class="…text-2xl font-bold text-white mb-1">5.0★</p>
- <p class="…text-xs text-white/50 uppercase tracking-wide">Google &amp; Yelp Rating</p>
+ <p class="…text-2xl font-bold text-white mb-1">2002</p>
+ <p class="…text-xs text-white/50 uppercase tracking-wide">Serving Texas Clients Since</p>

  footer link, 28 pages (27 + the new /texas/)
- <span class="footer-stars" aria-hidden="true">★★★★★</span><span>Yelp Reviews</span>
+ <span>Leahy Lending on Yelp</span>
```

**A second Yelp rating shape was found during implementation.** On every
template-built page the Yelp link carried five star glyphs immediately before the
label. `aria-hidden` kept them from screen readers but they were plainly visible
— a Yelp star rating on the page. Removed from the Yelp link only. The Google
element keeps its stars and its text, untouched, on 28 pages.

---

# 4. Test-submission results — NOT PERFORMED

This is the one item in your §12 I have not delivered, and I am not going to
quietly substitute something weaker for it.

**Why not.** A submission from a `data-form-mode="live"` page posts a real record
into GoHighLevel. That is an outward-facing write to a production system, it is
not reversible from here, and you have authorized staging implementation rather
than production traffic. I am not putting test records into the live CRM without
you saying so.

**And it would not prove what it needs to prove yet.** The four new context
fields do not exist as custom fields in GoHighLevel. Until they are created, a
submission would arrive with `source_url`, `entry_page_title`, `guide_title` and
`selected_market` **silently dropped** — so a "successful" test would show a
green result and prove the opposite of what §12.4 asks.

**What I can evidence now, statically:**

```text
routing        /contact/ carries data-crm-tags="austin" and ClientCare@;
               Eric@ appears nowhere on it. DFW pages keep dfw and Eric@.
field shape    the two general intakes carry an IDENTICAL set of 25 named
               fields. Verified by set comparison, not by eye.
conditionals   emitted always, empty when the branch was not shown, so both
               markets produce one payload shape.
attribution    referrer, utm_*, first/last_touch_source, click_ids preserved.
discovery      discovery_source is the visitor's own answer and is sent as its
               own field; nothing overwrites it with attribution data.
source_url     built as location.origin + location.pathname. The query string
               is never read into it.
```

**The order I propose:** create the four custom fields in GoHighLevel, then I run
one Austin and one DFW submission against staging and return the received
records. Say the word and I will do that as a discrete step.

---

# 5. Sitemap and indexability

```text
SITEMAP        23 URLs
  added        /texas/
  removed      /apply/
  integrity    every sitemap URL is an indexable page; no noindex page is listed;
               every indexable page is listed. Zero drift in either direction.

INDEXING       23 indexable / 10 held back

  held back    /apply/            (changed this release)
               /privacy/  /terms/
               /texas/dallas-fort-worth/         and its about, contact,
               home-loans, calculator, privacy, terms
```

**One reporting discrepancy, flagged rather than papered over.** The build's own
summary line says "22 indexable". The artifact has 23, and the sitemap agrees
with 23. The build under-reports because its page walker starts at the site root
and skips it — `if (rel && …)` — so the homepage is invisible to that enumeration
and to every sweep built on it. The files on disk are correct; the summary line
is not. I have not changed the walker: doing so alters what a dozen gates see and
deserves its own change rather than being folded into this one.

---

# 6. Schema validation

```text
35 ld+json blocks across 33 pages, 0 invalid (every block JSON.parse'd)

WebPage 16 · FinancialService 15 · MortgageLender 14 · FAQPage 14 · PostalAddress 29
Question 83 · Answer 83 · City 6 · State 6 · Organization 3 · WebSite 3
Person 1 · PropertyValue 1 · AboutPage 1 · ContactPage 1 · Thing 1

/texas/   WebPage + WebSite + Thing only.
          No FinancialService, no PostalAddress, no FAQPage, no aggregateRating.
areaServed "Texas" on all 14 pages that carry it. No Florida in any schema node.
Every FAQPage still corresponds to a visible Q&A block on its page.
```

---

# 7. Redirect report

```text
301 rules   28    unchanged — none added, removed or repointed in P0
404 rules   10    one MODIFIED, described in section 0.1:
                  /texas/ now 404s only when no page exists there
```

No redirect behavior changed for any existing route.

---

# 8. Seller-financing preservation report

Per your §8, nothing seller-financing was touched. The drafted `/home-loans/`
lede was **withdrawn, not deferred** — it is absent from the builder, and the
builder carries an explicit hands-off guard that fails the build if
`/home-loans/` is ever added to the copy pass.

```text
ROUTE                                          OCCURRENCES  H1
/                                              2            unchanged
/about/                                        1            unchanged
/home-loans/                                   4            "Home Loan Solutions" — unchanged
/texas/dallas-fort-worth/                      1            unchanged
/texas/dallas-fort-worth/about/                1            unchanged
/texas/dallas-fort-worth/construction-loans/   1            unchanged
/texas/dallas-fort-worth/home-loans/           4            "Home Loan Solutions" — unchanged
```

Verified absent from the build: the withdrawn string "Home Financing Options in
Texas" appears on zero pages. No seller-financing section, heading, feature list,
CTA, link, schema, FAQ, testimonial, alt text or footer reference was altered,
and no seller-financing page, guide, comparison or module was created.

The only edit that touched a seller-financing page at all is the footer Yelp
link relabel, which is chrome shared by all 28 pages and is not
seller-financing language.

---

# 9. Build and test report

62 steps green. The gates that bit during this work, and the negative test each
one survived:

```text
GATE                          WHAT IT CAUGHT                      NEGATIVE TEST
austin lift wording guard     selected_market="dfw" leaking into   injected; fails
                              an Austin page via the lifted card
audit-integrity crm-fields    4 new fields not registered -> GHL   injected; fails
                              would drop them silently
sync-yelp end-state           a SECOND Yelp rating shape (stars)   4 injections,
                              the first pass did not match         all 4 caught
austin openings hands-off     /home-loans/ added to the copy pass  guard exits 1
texas hub neutrality          form / CRM tag / program interest /  asserted at build
                              address schema reaching the hub
```

`sync-yelp.js` gained a `YELP_CHECK_ONLY=1` mode specifically so its gate could
be negative-tested. It is a self-healing pass: it repairs what it finds and then
asserts the end state, which means in normal operation the gate can never go red
for anything the rewriter can fix — and therefore could not be proven to work.
With the rewrite suppressed, all four injected violations are caught. **A gate
that has only ever been seen green is not evidence.**

## Unresolved, reported not fixed

**Prohibited phrases survive in body copy on four indexable pages.** These sit
outside the opening blocks you approved. I did not rewrite them, because no
approved replacement wording exists for that copy and inventing public copy for
indexable pages is not a build decision.

```text
/bank-statement-loans/                            x1  "no tax returns required"
/self-employed-mortgage-loans/                    x3  "no tax returns required"
/self-employed-mortgage-loans/                    x1  "perfect for business owners"
/bonus-commission-rsu-income-mortgage/            x1  "we count what others won't"
/how-self-employed-borrowers-qualify-for-mortgage/ x1 "no tax returns required"
```

"No tax returns required" is on your standing prohibited list. Six occurrences,
four indexable pages. **I regard this as a production blocker** and need
replacement wording from you.

**Two smaller items, flagged not fixed:**

- `/texas/dallas-fort-worth/about/` renders the H1 "Austin's Trusted Lender for
  Over Two Decades" — Austin wording on a DFW page. It is `noindex, follow`, so
  the impact is limited, but it is wrong and it is not in my authorized scope.
- The Austin privacy policy has **no CCPA section and no `#ccpa` anchor**, while
  the DFW one does. The consent disclosure on the new Austin intake links "Do Not
  Sell My Personal Information". I pointed it at `/privacy/` rather than
  fabricate an anchor, so nothing is broken — but the Austin policy still lacks
  the section that link names. That is a privacy-review content gap.

---

# 10. P1 guide-blueprint package

**Not implemented.** Blueprints only, for your approval.

```text
LAYER RULES (from your 24 September §2 and the earlier response)
  no lead-capture form          no automatic Austin or DFW CRM tag
  no default market ownership   no implied office, branch or location
  indexable, self-canonical     two labelled market-choice CTAs only
  CTA destinations              /contact/ (austin) and
                                /texas/dallas-fort-worth/ (dfw)
  guide_title populated from the guide H1 on submissions originating there
  no mirrored Austin/DFW variants of any guide
```

Nine of your nineteen borrower queries currently have no answer anywhere on the
site. These six guides carry all nine.

```text
/guides/bank-statement-vs-conventional/
    Answers: how a Bank Statement review differs from a conventional review;
    what deposits are and are not; why tax returns may understate cash flow.
    Absorbs the generic explanation now duplicated across both market pages.

/guides/asset-utilization-explained/
    Answers: what an asset-based income review considers; how it differs from
    "no income verification", which it is not.

/guides/no-ratio-explained/
    Answers: what No Ratio means; the explicit correction that it is not no
    income verification and does not mean an unreviewed borrower.

/guides/dscr-for-investment-property/
    Answers: what a DSCR review looks at; that it is investment-property
    financing and not a primary-residence path.

/guides/1099-and-contract-income/
    Answers: how 1099 income is reviewed; that it is an income type and not a
    separate product; K-1 income, which appears zero times on the site today.

/guides/documenting-self-employed-income/
    The hub. Answers: which documentation approaches exist and when each is
    generally relevant. Links to the five above.
```

**Sequencing, per your §9.** The market-pair differentiation copy is drafted only
after you approve these blueprints, because what stays on each commercial page is
defined by what moves into the guide layer. For each of the six Austin/DFW pairs
I will return, before writing any copy: what generic content moves to the guide,
what market-specific framing stays, what unique FAQs each page answers, what
internal links each uses, and confirmation that CTA and conversion behavior is
unchanged.

---

# 11. What is needed before production

```text
1  REPLACEMENT WORDING for the six prohibited-phrase occurrences in section 9.
   Production blocker.

2  GOHIGHLEVEL CUSTOM FIELDS — create source_url, entry_page_title, guide_title
   and selected_market. Until they exist the CRM drops them silently.
   Blocks the §12.4 test submissions.

3  AUTHORIZATION FOR TEST SUBMISSIONS once (2) is done — one Austin, one DFW.

4  AUSTIN PRIVACY POLICY — the CCPA / Do Not Sell gap in section 9.

5  /texas/dallas-fort-worth/about/ — the Austin H1 on a DFW page.

6  PRODUCTION UPLOAD is a separate manual step and remains unauthorized.
```

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not compliance clearance and not production approval. Sixty-two
green steps and fifty-one passing checks describe what the files contain, not
whether the claims in them are substantiated or the product statements accurate.
No production deployment has been made and none is authorized.
