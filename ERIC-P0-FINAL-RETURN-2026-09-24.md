# Final P0 Return Package

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 24 September 2026
**Re:** Your response of 24 September — the ten items required before implementation

**Nothing has been implemented.** No page, route, robots value, canonical,
sitemap entry, schema node, redirect, CRM tag or form has been changed. The build
is unchanged at 56 green steps, 32 pages, 1,760 internal links resolving.

---

# 0. One finding that changes the shape of your section 1

You chose option 1(c) and specified six acceptance conditions for `/contact/`.
Conditions 1, 2, 3 and 6 are small. **Conditions 4 and 5 are not**, because of
what `/contact/` actually is.

I parsed the form subtree on every page rather than trusting the page-level
attributes. Three routes are unlike the rest of the site:

```text
ROUTE       STEP PANELS   FORM CONTROLS   NAMED CONTROLS   data-program-interest
/contact/        0             10               0                  absent
/apply/          0              9               0                  absent
/                0              5               0                  absent

every other page with a form:  9–10 panels, 46–64 controls, all named
```

`/contact/`, `/apply/` and `/` are the three pages converted from the React
build. **Not one of their form controls carries a `name` attribute.** They have
no hidden context fields, no `data-form-type`, and no `data-form-mode`. They are
submitted by `spa-lead-forms.js`, which matches fields by reading the visible
`<label>` text, because there is nothing else to match on.

So `/contact/` today captures eight visible fields — Full Name, Phone, Email,
Income Type, Property State, Loan Amount, I'm Interested In, Tell Us About Your
Situation — and none of the scenario detail your condition 4 lists.

**Two things make this tractable rather than a blocker.**

First, `/contact/` **already loads `scenario-stepper.js`.** The script is present
and inert because the page has no stepper markup. Adding the stepper is a markup
and body-attribute change, not a new script or a new route.

Second, the DFW contact page is **the same eight-field form, correctly
instrumented** — ten named controls (`full_name`, `phone`, `email`,
`what_is_your_primary_source_of_income`, `property_state`, `est_loan_amt`,
`loan_type`, `tell_us_about_your_situation`, and two consents), with
`data-form-type="contact_form"` and `data-program-interest="not_sure"`. The
pattern to copy already exists in the repository.

Section 2 gives both options as exact diffs. **Option B is the only one that
satisfies your conditions 4 and 5 as written**, and it is the one I recommend.

---

# 1. Final exact copy — remaining Austin P0 pages

You issued final copy for `/bank-statement-loans/`,
`/self-employed-mortgage-loans/` and `/dscr-investor-loans/`. Those three are
taken verbatim and are not restated here.

Five remain. Each applies your five controls: the real borrower problem stated,
no superlatives or universal qualification, conditional without being vague, and
the product distinctions preserved.

## 1.1 `/1099-mortgage-loans/`

```text
H1:
Mortgage Options for 1099 and Contract Income

Lede:
Independent contractors, consultants and freelancers are often paid on Forms 1099
rather than W-2s, and that income may be reviewed differently from salary. 1099
income is an income type rather than a separate mortgage product, so it is
generally evaluated as part of a broader review that also considers credit,
assets, down payment and the property. Which documentation is relevant depends on
the borrower, property, lender and program. A scenario review can help identify
which path may fit.
```

Removes: "We use your 1099 income history to qualify you — without requiring full
tax returns." That sentence promised an outcome and made a blanket no-tax-return
claim.

## 1.2 `/bonus-commission-rsu-income-mortgage/`

```text
H1:
Mortgage Options for RSU, Bonus and Commission Income

Lede:
Professionals paid substantially in restricted stock, bonus or commission often
find that this income is documented and evaluated differently from base salary.
Whether those sources may be considered depends on vesting or payment history,
employment documentation, the consistency of the income, and the available
program. Requirements vary by borrower, property, lender and program. A scenario
review can help identify which path may fit.
```

Removes: "We count what others won't" and "giving you the full buying power your
compensation package deserves."

## 1.3 `/construction-loans/`

```text
H1:
Construction Loan Options in Texas

Lede:
Financing a custom home means covering a period when the house does not exist
yet, then arranging what happens once it is complete. A construction-to-permanent
structure, a stand-alone construction loan, or another available approach may be
relevant depending on the plans, the builder, the documentation situation and the
property. Availability and requirements vary by borrower, property, lender and
program. A scenario review can help identify which path may fit.
```

## 1.4 `/home-loans/`

```text
H1:
Home Financing Options in Texas

Lede:
Buying, refinancing, or moving between homes can involve more than one financing
path — including bridge financing, buy-before-you-sell arrangements, construction
lending, and seller financing. Which may be relevant depends on timing, the
current property, income documentation and the program. Requirements vary by
borrower, property, lender and program. A scenario review can help narrow the
options.
```

Removes: "creative home financing solutions for every situation."

**Flag.** The product list is carried over unchanged from the existing page. If
seller financing is not currently an offered path, say so and I will drop it —
I am not in a position to confirm product availability. This is decision 4.

**Note.** This page has no live twin. `/texas/dallas-fort-worth/home-loans/` is
already `noindex, follow`, which is how the 84% pair overlap was handled. So this
is a copy-quality change only, not a differentiation change.

## 1.5 `/how-self-employed-borrowers-qualify-for-mortgage/`

```text
H1:
How Self-Employed Borrowers Qualify for a Mortgage

Lede:
Mortgage review for a self-employed borrower usually focuses on how income is
documented rather than on whether self-employment is acceptable. This guide
explains the documentation approaches a lender may consider — including tax
returns, bank statements, 1099 income, profit-and-loss statements, and
asset-based review — and what each generally involves. Availability and
requirements vary by borrower, property, lender and program.
```

H1 retained: it matches the borrower query and the URL, and your own approved
self-employed lede uses "can qualify," so the word is not the problem. Removes:
"how to position your application for success."

---

# 2. Exact diff — `/contact/`

## 2.1 Body attributes — both options

```diff
- <body class="ll-chrome" data-crm-tags="austin" data-page-route="/contact/">
+ <body class="ll-chrome"
+       data-crm-tags="austin"
+       data-page-route="/contact/"
+       data-program-interest="general"
+       data-form-type="scenario_review"
+       data-form-mode="live"
+       data-crm-source="Website Contact Form — Austin">
```

`data-crm-tags="austin"` is already present and is **not** changed. ClientCare
routing is unchanged: it is derived from the tag, and the tag does not move.

## 2.2 Option A — instrument the existing form (smaller)

Add `name` attributes to the ten existing controls, matching the DFW contact page
exactly so both markets produce the same field set, plus the hidden context block:

```diff
+ <input type="hidden" name="landing_page"  value="austin_contact">
+ <input type="hidden" name="market_page"   value="austin">
+ <input type="hidden" name="form_type"     value="scenario_review">
+ <input type="hidden" name="program_interest" value="general">

- <input type="text"  ...>                    (Full Name)
+ <input type="text"  name="full_name" ...>
- <input type="tel"   ...>                    (Phone)
+ <input type="tel"   name="phone" ...>
- <input type="email" ...>                    (Email Address)
+ <input type="email" name="email" ...>
- <select ...>                                (Income Type)
+ <select name="what_is_your_primary_source_of_income" ...>
- <input type="text"  ...>                    (Property State)
+ <input type="text"  name="property_state" ...>
- <input type="text"  ...>                    (Loan Amount (Approx.))
+ <input type="text"  name="est_loan_amt" ...>
- <select ...>                                (I'm Interested In)
+ <select name="loan_type" ...>
- <textarea ...>                              (Tell Us About Your Situation)
+ <textarea name="tell_us_about_your_situation" ...>
- <input type="checkbox" ...>                 (consents)
+ <input type="checkbox" name="sms_consent" value="yes" ...>
+ <input type="checkbox" name="sms_marketing_consent" value="yes" ...>
```

```text
Satisfies your conditions 1, 2, 3, 6 and part of 5.
Does NOT satisfy condition 4 — an eight-field contact form does not capture
scenario detail for a DSCR, Asset Utilization, No Ratio or Super Jumbo enquiry.
```

## 2.3 Option B — port the general scenario stepper (recommended)

Replace the eight-field form with the same ten-panel general questionnaire the
DFW market home uses, emitted from the existing shared builder `form-steps.js`,
tagged for Austin. `scenario-stepper.js` is already loaded on the page.

```diff
+ <body ... data-total-steps="10" data-program-interest="general" data-form-mode="live">

+ <input type="hidden" name="landing_page"    value="austin_contact">
+ <input type="hidden" name="market_page"     value="austin">
+ <input type="hidden" name="campaign_theme"  value="alternative_documentation_non_qm">
+ <input type="hidden" name="form_type"       value="scenario_review">
+ <input type="hidden" name="program_interest" value="general">

  step 1   transaction_goal            purchase | refinance | cash_out_refinance |
                                       investment_purchase_or_refinance | exploring
  step 2   income_profile              business_owner | paid_primarily_1099 |
                                       w2_plus_business_or_side_income |
                                       contract_consulting_or_freelance |
                                       substantial_assets_limited_income |
                                       real_estate_investor | other
  step 3   self_employment_history     two_years_or_more | one_to_two_years |
                                       less_than_one_year | prior_related_experience |
                                       not_sure
  step 4   documentation_path          bank_statements | 1099_income | profit_and_loss |
                                       asset_utilization | no_ratio | dscr_rental_income |
                                       super_jumbo | tax_returns |
                                       multiple_income_sources | not_sure
  step 4a  super_jumbo_loan_range      conditional
  step 5   purchase_funds_readiness / property_equity_estimate /
           investment_property_use     conditional on step 1
  step 6   timeline                    exploring | preparing | shopping |
                                       under_contract | ready_to_refinance
  step 7   property_city_state
  step 8   first_name, email, phone
  step 9   preferred_contact_method, best_contact_time, discovery_source
  step 10  sms_consent, sms_marketing_consent, ll_hp (honeypot)
```

```text
Satisfies conditions 1, 2, 3, 4, 6 and all of 5 except guide title (see 2.4).
Step 4 is exactly the list in your condition 4: Bank Statement, Asset
Utilization, No Ratio, DSCR and Super Jumbo each appear as a distinct answer.
```

**Consequence to accept:** `/contact/` stops being a short contact form and
becomes a scenario questionnaire. If you want a short contact path preserved
alongside it, say so and I will specify one.

## 2.4 Condition 5 — what is preserved, and the one genuine gap

`scenario-stepper.js` already sends, on every submission:

```text
referrer, utm_source, utm_medium, utm_campaign, utm_content, utm_term,
first_touch_source, last_touch_source, click_ids,
sms_consent_url  (= location.origin + location.pathname)
discovery_source (the visitor's own answer, sent separately and never
                  overwritten by the attribution fields above)
```

Against your four required items:

```text
source URL                partly — carried today only as sms_consent_url.
                          Proposed: add a dedicated lead field
                            source_url = location.origin + location.pathname
                          Path only, never the query string, so no personal
                          data can be carried in a URL parameter.
chosen market             YES — market_page hidden field.
declared borrower objective  YES — transaction_goal, step 1.
guide title               DOES NOT EXIST ANYWHERE ON THE SITE.
                          Verified: source_url, guide_title and
                          borrower_objective appear in zero files.
```

`guide_title` is only meaningful once `/guides/` exists, which is P1. Proposed:
specify it now as `guide_title`, populated from the guide page's H1 and empty
elsewhere, and implement it with the guides rather than in P0. Decision 3.

---

# 3. `/texas/` — full page draft

```text
Route      /texas/
Robots     index, follow, max-snippet:-1, max-image-preview:large
Canonical  https://leahylending.com/texas/
Sitemap    add
Form       none        CRM tag  none        Lead owner  none
Schema     WebPage only — no FinancialService node (it carries an address and
           would imply a location on a market-neutral page), no FAQPage
Author     none
```

**H1** *(your wording)*

> Mortgage Options for Self-Employed, Investor and High-Balance Borrowers in Texas

**Direct answer** *(your wording, verbatim)*

> Leahy Lending works with self-employed borrowers, business owners, real-estate
> investors and high-balance borrowers throughout Texas, including Austin and
> Dallas–Fort Worth. Which documentation and financing approaches may be relevant
> depends on the borrower, the property, the lender and the program. A scenario
> review can help identify which paths may fit a particular situation.

## H2 — How Texas borrowers usually arrive here

> **Tax returns do not reflect what the business actually earns.** Business owners
> who take every deduction available to them often find that the income shown on
> a return is lower than the cash actually moving through the business. The
> question is not whether self-employment is acceptable — it is which
> documentation a lender may be able to consider.

> **The property is an investment, not a home to live in.** Financing a rental or
> an investment purchase is reviewed differently from financing a primary
> residence, and the rental income the property is expected to produce may form
> part of that review.

> **The loan amount is above conventional limits.** Higher-balance purchases and
> refinances are underwritten against different guidelines, and the documentation
> and reserve expectations may differ from a conforming loan.

## H2 — Documentation approaches that may be reviewed

> These are approaches to documenting income, not separate mortgage products. Which
> may be relevant depends on the borrower, the property, the lender and the program.

> **Bank Statement review** — considers deposits into personal or business
> accounts over a defined period, alongside business expenses and the rest of the
> file. Deposits are not automatically treated as income.
>
> **Asset Utilization** — considers eligible assets as part of the income
> analysis for borrowers who hold substantial assets relative to documented
> income.
>
> **No Ratio** — an approach in which a debt-to-income ratio is not calculated in
> the usual way. It is not the same as no income verification, and it does not
> mean a borrower's finances go unreviewed.
>
> **1099 income** — an income type rather than a documentation approach of its
> own, generally reviewed alongside the rest of the file.
>
> **Tax returns** — still the right path for many self-employed borrowers, and
> the first thing a scenario review looks at.

## H2 — Investment property is reviewed differently

> A DSCR review focuses on the rental income a property is expected to produce in
> relation to its debt obligations, rather than primarily on the borrower's
> personal employment income. DSCR mortgage options are generally used for
> investment property, not a primary residence. Documentation, property type,
> loan purpose and available terms depend on the borrower, lender and program.

## H2 — Where Leahy Lending works

> Leahy Lending serves borrowers throughout Texas, including Dallas–Fort Worth.
> Dallas–Fort Worth pages and conversion paths are part of Leahy Lending's
> Texas-wide business; they do not represent a separate branch, office, location,
> or legal entity.

> Leahy Lending, a DBA of Kyber Mortgage Corporation, has been serving Texas
> clients since 2002. Over $1 billion in loans funded reflects the company's
> residential mortgage lending history.

## H2 — Choose your market

> A scenario review is a conversation, not an application. It is the step that
> identifies which documentation and financing approaches may be worth exploring.

```text
[ Start an Austin scenario review ]            → /contact/
[ Start a Dallas–Fort Worth scenario review ]  → /texas/dallas-fort-worth/
```

**Prohibited on this page and gated in the build:** any branch, office or
location claim for a named city; any rate, APR, payment, term, LTV, FICO, reserve
or eligibility outcome; any program-availability guarantee; any Yelp rating; any
Florida reference.

---

# 4. Exact claim-placement copy

## 4.1 `/about/`

`Over $1 billion in loans funded` is already present as a visible bullet (no
period). `Serving Texas clients since 2002.` is absent. Proposed, in the "Our
Story" block:

```diff
+ <p>Leahy Lending, a DBA of Kyber Mortgage Corporation, has been serving Texas
+ clients since 2002. Over $1 billion in loans funded reflects the company's
+ residential mortgage lending history.</p>
```

The existing bullet stays. No marquee or stat tile changes.

## 4.2 `/` (homepage)

Current hero carries the compact forms only — `Serving Texas Since 2002` in the
trust strip and `$1B+` in a stat tile. Both remain. Proposed addition in the
trust/proof block beneath the hero:

```diff
+ <p>Leahy Lending, a DBA of Kyber Mortgage Corporation, has been serving Texas
+ clients since 2002. Over $1 billion in loans funded reflects the company's
+ residential mortgage lending history.</p>
```

Neither placement attributes these to any individual. Your `25+ Years of
Mortgage Experience` remains only on your profile and team card.

---

# 5. Yelp — complete removal and relabel diff

## 5.1 The rating claim — one page, one occurrence

```diff
  /  (homepage)  hero stat grid
- <div class="bg-white/5 p-4 border border-white/10">
-   <p class="font-display text-2xl font-bold text-white mb-1">5.0★</p>
-   <p class="font-body text-xs text-white/50 uppercase tracking-wide">Google &amp; Yelp Rating</p>
- </div>
```

**Layout consequence you should decide.** The grid is `grid-cols-2` holding four
tiles — `20+ Years of Experience`, `$1B+ In Loans Funded`, `5.0★ Google & Yelp
Rating`, `14 States Licensed`. Removing one leaves three in a two-column grid,
so the last tile sits alone on the second row. Options: accept the orphan, or
replace the removed tile with a non-rating tile such as `2002 / Serving Texas
Since`. This adds no new claim — 2002 is already approved and already on the
page. Decision 2.

## 5.2 The footer label — 27 pages

```diff
- <a href="https://www.yelp.com" ...> ... Yelp Reviews</a>
+ <a href="https://www.yelp.com" ...> ... Leahy Lending on Yelp</a>
```

```text
27 pages   19 indexable · 8 held back
Authored in: _build/clone-common.js, _build/build-dfw-home.js
Link target, icon and placement unchanged. No score, count, ranking or
testimonial claim in the new label.
```

The adjacent `Google · 5.0 · 258 Reviews` element is a Google rating, which your
section 4 confirms as approved, and is not changed.

---

# 6. areaServed — exact schema diff

```diff
- "areaServed":["Texas","Florida","Colorado","Arizona","Georgia","Washington",
-               "Oregon","Idaho","Indiana","Kansas","Oklahoma","Arkansas",
-               "Alabama","Alaska"]
+ "areaServed":"Texas"
```

```text
Single source:  _build/austin-head-data.json
Affected:       14 pages
  /  /about/  /apply/  /contact/  /privacy/  /terms/
  /1099-mortgage-loans/  /bank-statement-loans/
  /bonus-commission-rsu-income-mortgage/  /construction-loans/
  /dscr-investor-loans/  /home-loans/
  /how-self-employed-borrowers-qualify-for-mortgage/
  /self-employed-mortgage-loans/

NOT changed, per your section 9:
  the visible "Licensed in 14 States" text
  the state dropdown on contact and intake forms
  the "14 States Licensed" homepage stat tile
No Florida schema, page or conversion path is added.
```

---

# 7. `/apply/` — exact robots and sitemap diff

```diff
  apply/index.html
- <meta name="robots" content="index, follow, max-snippet:-1, max-image-preview:large">
+ <meta name="robots" content="noindex, follow">

  sitemap.xml
- <url><loc>https://leahylending.com/apply/</loc></url>

  _build/set-indexing.js
+ add 'austin/apply' to ALWAYS_NOINDEX
```

The sitemap follows automatically: `build-sitemap.js` derives its exclusions from
`ALWAYS_NOINDEX`, so the two cannot drift apart. Canonical stays self-referencing.
The page stays reachable from the nav.

---

# 8. Route-by-route P0 change log

```text
ROUTE                                    CHANGE                              ROBOTS
/texas/                                  NEW page                            index (new)
/contact/                                form instrumentation + general      unchanged
                                         intake; body attrs; austin tag
                                         and ClientCare routing unchanged
/apply/                                  robots + sitemap                    index → noindex
/                                        claim paragraph; Yelp tile removed  unchanged
/about/                                  claim paragraph                     unchanged
/1099-mortgage-loans/                    H1 + lede                           unchanged
/bank-statement-loans/                   H1 + lede (your wording)            unchanged
/bonus-commission-rsu-income-mortgage/   H1 + lede                           unchanged
/construction-loans/                     H1 + lede                           unchanged
/dscr-investor-loans/                    H1 + lede (your wording)            unchanged
/home-loans/                             H1 + lede                           unchanged
/how-self-employed-borrowers-qualify…/   lede                                unchanged
/self-employed-mortgage-loans/           H1 + lede (your wording)            unchanged
14 pages                                 areaServed → "Texas"                unchanged
27 pages                                 Yelp link relabel                   unchanged

Indexable  22 → 22   (/texas/ added, /apply/ removed)
Held back   9 → 10
Sitemap    23 → 23
Redirects  none created, none changed
Six Austin/DFW pairs: NOT rewritten in P0, per your section 8.
```

---

# 9. CTA matrix

```text
SOURCE     LABEL                                DESTINATION                  STATUS
/texas/    Start an Austin scenario review      /contact/                    200, index
/texas/    Start a DFW scenario review          /texas/dallas-fort-worth/    200, noindex follow
/guides/*  (P1, same two destinations)          as above                     as above

DESTINATION                  CRM TAG              PROGRAM INTEREST   LEAD OWNER
/contact/                    austin               general (new)      ClientCare@
/texas/dallas-fort-worth/    dfw                  general            Eric@
```

**Expected submitted-lead fields, both destinations, after option B:**

```text
identity      first_name, email, phone
scenario      transaction_goal, income_profile, self_employment_history,
              documentation_path, timeline, property_city_state
conditional   super_jumbo_loan_range, purchase_funds_readiness,
              property_equity_estimate, investment_property_use
              (always emitted, empty when not applicable, so both markets
               produce an identical field shape)
context       landing_page, market_page, campaign_theme, form_type,
              program_interest, source_url (new), guide_title (P1)
attribution   referrer, utm_*, first_touch_source, last_touch_source, click_ids
self-reported discovery_source — sent separately and never overwritten by the
              attribution fields
consent       sms_consent, sms_marketing_consent, sms_consent_timestamp,
              sms_consent_url, sms_consent_text
```

No CRM tag, contact address or lead owner changes on any existing page.

---

# 10. Test plan and pass criteria

```text
RAW HTML        every changed page serves its new H1 and lede in the raw
                response, not after JavaScript
CONDITIONAL     every rewritten lede contains conditional language and none of:
                approval, guaranteed, eligibility, rate, APR, payment, closing
                date, savings, loan amount, LTV, FICO, reserve requirement
PROHIBITED      zero occurrences of the seven prohibited phrases; zero
                occurrences of "Written by Leahy Lending"
DISTINCTIONS    DSCR page states investment property and does not present DSCR
                as a primary-residence path; 1099 page does not present 1099 as
                a product; No Ratio never described as "no income verification";
                Super Jumbo never described as NQM; Bank Statement never states
                that all deposits count as income
INDEXABILITY    22 indexable, 10 held back; /texas/ index, /apply/ noindex
SITEMAP         23 URLs; /texas/ present, /apply/ absent; every URL a real
                indexable page
CANONICAL       every page self-referencing; none repointed
SCHEMA          valid JSON on every page; areaServed reads "Texas" on all 14;
                no FinancialService node on /texas/; no FAQPage claiming an
                answer that is not visible on the page
CRM TAGS        /contact/ still austin; every DFW page still dfw; /texas/ carries
                none; no tag changed anywhere
LEAD ROUTING    a submission from /contact/ reaches ClientCare@; a submission
                from /texas/dallas-fort-worth/ reaches Eric@; neither crosses
SUBMITTED FIELDS both destinations emit the identical field set in section 9,
                including empty conditionals
SOURCE ATTRIB.  source_url present and equal to origin+pathname, never carrying
                a query string; discovery_source present and not overwritten by
                first_touch_source or last_touch_source
PII             no personal data in any analytics event label, URL, console log
                or client-side error report
MOBILE          /texas/ and the homepage hero grid render at 375px with no
                horizontal scroll; the stat grid has no broken row after the
                Yelp tile is removed
ACCESSIBILITY   one h1 per page; heading order unbroken; every image has alt;
                every CTA has discernible text; stepper reachable by keyboard
ENTITY          zero occurrences of a DFW branch, office or location claim, or
                "Leahy Lending Dallas", or separate-entity language, on any page
CLAIMS          both approved full strings present on /, /about/ and /texas/;
                neither attributed to an individual
YELP            zero rating claims site-wide; 27 footer labels read
                "Leahy Lending on Yelp"
```

Each gate is negative-tested — fed a failing input first to confirm it actually
fails — before its pass is trusted. Two gates this session passed only because
their detection predicate never matched the pages they were meant to cover, so a
green check is not evidence until the red has been seen.

---

# 11. Decisions needed before implementation

```text
1  /contact/ — Option A or Option B (section 2). Option B is required to meet
   your own conditions 4 and 5; Option A is smaller but leaves condition 4
   unmet. Option B also converts /contact/ from a short contact form into a
   ten-step questionnaire — confirm that is acceptable, and say whether a short
   contact path should be preserved alongside it.

2  Homepage stat grid after the Yelp tile is removed — accept the orphan third
   tile, or replace it with a non-rating tile (section 5.1).

3  guide_title — specify now, implement with /guides/ in P1 (section 2.4).

4  Seller financing on /home-loans/ — confirm it is still an offered path, or
   I drop it from the lede (section 1.4).

5  The five ledes in section 1 — approve, revise or replace.
```

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not compliance clearance and not production approval. No
production upload, staging deployment, publication, or route, schema or indexing
change has been made, and none is authorized until this package is approved.
