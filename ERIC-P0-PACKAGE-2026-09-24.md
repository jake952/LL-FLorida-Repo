# Phase 1 / P0 Implementation Proposal

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 24 September 2026
**Re:** Your response of 24 September — P0 package for approval

**Nothing in this document has been implemented.** No page, route, robots value,
canonical, sitemap entry, schema node, redirect or CRM tag has been changed. This
is the proposal you asked to approve, reject or revise.

---

# 0. Read this first — one dependency blocks part of P0

Your section 2 told me to confirm that each market-choice CTA reaches a genuine
all-scenario intake, and to flag it rather than invent a route. I inspected it.

**The questionnaire's questions are universal. Its CRM tagging is not.**

Step 1 of the stepper on every program page reads:

```text
What are you hoping to do?
  Buy a home
  Refinance my current home
  Take cash out from a property I own
  Buy or refinance an investment property
  I am still exploring
```

That is an all-scenario question set. But each instance carries a
`data-program-interest` value fixed by the page it sits on:

```text
DFW      general               /texas/dallas-fort-worth/        noindex
         not_sure              /texas/dallas-fort-worth/contact/ noindex
         bank_statement, dscr, no_ratio, super_jumbo, 1099,
         asset_utilization, construction, rsu_bonus_commission,
         home_loan_options, self_employed_general

Austin   self_employed_general /self-employed-mortgage-loans/ and two others
         bank_statement, dscr_investor, 1099, construction,
         rsu_bonus_commission, home_loan_options
         (/contact/ and /apply/ carry NO program_interest at all)
```

**Consequence:**

- **DFW has a universal intake** — `/texas/dallas-fort-worth/`, tagged `general`,
  ten steps. It is `noindex, follow`, which does not prevent a human or a
  crawler following a link to it.
- **Austin has no equivalent.** The nearest is `self_employed_general`, which is
  scoped to self-employed and is the wrong tag for a DSCR, investor or Super
  Jumbo enquiry arriving from a guide. `/contact/` carries no program tag at all.

**This is an implementation dependency, not a route I will invent.** Decision 1
in section 11 puts three options to you. Until it is answered, the Austin
market-choice CTA on every guide has no correct destination, and the guides
cannot ship — although everything else in P0 can.

---

# 1. Route-by-route P0 inventory

```text
ROUTE                                               P0 ITEM        CHANGE TYPE
/1099-mortgage-loans/                               P0-1, P0-2     copy
/bank-statement-loans/                              P0-1, P0-2     copy
/bonus-commission-rsu-income-mortgage/              P0-1, P0-2     copy
/construction-loans/                                P0-1, P0-2     copy
/dscr-investor-loans/                               P0-1,2,3       copy — accuracy
/home-loans/                                        P0-2           copy
/how-self-employed-borrowers-qualify-for-mortgage/  P0-2           copy
/self-employed-mortgage-loans/                      P0-1, P0-2     copy
/                                                   P0-4, P0-5     copy + claim
/about/                                             P0-4           claim placement
/apply/                                             P0-6           robots + sitemap
/texas/                                             P0-7           NEW page
14 pages (schema)                                   P0-7 adjacent  areaServed
27 pages (footer)                                   P0-5           Yelp label review
DFW cluster, 6 pages                                P0-1           copy
```

**No DFW program page changes except the six pair members**, and those keep every
form, tag, contact address and conversion path exactly as they are.

---

# 2. Before / after copy diffs

Every "after" below is a draft for your approval, not applied copy. All use
conditional language and none states eligibility, rates, APR, payments, closing
dates, savings, loan amounts, LTV, FICO or reserve requirements.

## 2.1 `/dscr-investor-loans/` — P0-3, the accuracy correction

```text
BEFORE  H1:   DSCR Investor Mortgage Loans
        lede: Qualify using the rental income from the property — not your
              personal income. Our DSCR loans, 2nd lien cash-outs, and seller
              financing solutions are unmatched in the industry.
```

Three problems: it promises qualification, it never says the property is an
investment property rather than a primary residence, and "unmatched in the
industry" is an unsupported superlative.

```text
AFTER   H1:   DSCR Mortgage Options for Investment Property
        lede: A DSCR review focuses on the rental income a property is expected
              to produce in relation to its debt obligations, rather than on the
              borrower's personal income. It applies to investment property, not
              to a primary residence. Documentation, property type, loan purpose
              and available terms depend on the borrower, the lender and the
              program. A scenario review is the step that identifies which paths
              may be relevant.
```

## 2.2 `/bank-statement-loans/`

```text
BEFORE  H1:   Bank Statement Mortgage Loans
        lede: Qualify using 12–24 months of personal or business bank statements
              — no tax returns required. Perfect for business owners who maximize
              their deductions.

AFTER   H1:   Bank Statement Mortgage Options for Self-Employed Borrowers
        lede: Bank Statement mortgage options may be worth reviewing where tax
              returns do not fully reflect current business cash flow. Depending
              on the borrower, property, lender and program, the review may
              consider personal or business account deposits, business expenses,
              assets, credit, down payment and reserves. A full scenario review
              is needed before identifying which approaches may fit.
```

## 2.3 `/1099-mortgage-loans/`

```text
BEFORE  H1:   1099 Contractor Mortgage Loans
        lede: Designed specifically for 1099 contractors, freelancers, and
              independent professionals. We use your 1099 income history to
              qualify you — without requiring full tax returns.

AFTER   H1:   Mortgage Options for 1099 and Contract Income
        lede: Independent contractors, consultants and freelancers may be paid on
              Forms 1099 rather than W-2s. 1099 history may form part of a
              broader mortgage income review rather than a mortgage product of
              its own. Which documentation is relevant depends on the borrower,
              the property, the lender and the program.
```

Reflects your rule that 1099 is an income type, not a standalone product.

## 2.4 `/bonus-commission-rsu-income-mortgage/`

```text
BEFORE  H1:   RSU, Bonus & Commission Income Mortgages
        lede: We count what others won't. RSU income, bonus income, and
              commission income all count toward your mortgage qualification —
              giving you the full buying power your compensation package
              deserves.

AFTER   H1:   Mortgage Options for RSU, Bonus and Commission Income
        lede: Compensation paid as restricted stock, bonus or commission is not
              always documented or evaluated the same way as base salary. Whether
              those sources may be considered depends on vesting or payment
              history, employment documentation, consistency and the available
              program. A scenario review looks at the full picture before
              identifying a path.
```

## 2.5 `/self-employed-mortgage-loans/`

```text
BEFORE  H1:   Self-Employed Mortgage Loans in Texas
        lede: Traditional lenders penalize you for maximizing your tax
              deductions. We don't. Explore our full suite of non-QM mortgage
              solutions designed for self-employed borrowers.

AFTER   H1:   Mortgage Options for Self-Employed Borrowers in Texas
        lede: Self-employment does not by itself prevent a borrower from getting
              a mortgage. Where tax returns understate current cash flow, other
              documentation approaches may be worth reviewing — bank statements,
              asset-based review, or others — depending on the borrower, the
              property, the lender and the program. A scenario review identifies
              which may be relevant.
```

## 2.6 `/construction-loans/`

```text
BEFORE  H1:   Construction Loan Solutions
        lede: From standard construction-to-permanent financing to spec builds —
              Leahy Lending offers flexible construction loan solutions for
              homebuilders and custom home buyers.

AFTER   H1:   Construction Loan Options in Texas
        lede: Building a custom home means financing a period when the house does
              not exist yet, then arranging what happens once it does. A scenario
              review looks at the plans, the builder, the documentation situation
              and which available programs may fit. Availability, documentation
              and requirements vary by borrower, property, lender and program.
```

## 2.7 `/home-loans/`

```text
BEFORE  H1:   Home Loan Solutions
        lede: From bridge loans and buy-before-you-sell to construction lending
              and seller financing — Leahy Lending offers creative home financing
              solutions for every situation.

AFTER   H1:   Home Financing Options in Texas
        lede: Buying, refinancing or moving between homes can involve more than
              one financing path — bridge, buy-before-you-sell, construction and
              others. Which may be relevant depends on the borrower, the
              property, the lender and the program. A scenario review is the step
              that narrows it.
```

Note: this page has no live twin to differentiate against.
`/texas/dallas-fort-worth/home-loans/` is already `noindex, follow` — that is how
the 84% pair overlap was handled previously. The Austin page is the indexable
survivor of the pair, so this is a copy-quality change (P0-2), not a
differentiation change (P0-1).

## 2.8 `/how-self-employed-borrowers-qualify-for-mortgage/`

```text
BEFORE  lede: A complete guide to mortgage qualification for business owners,
              freelancers, and self-employed professionals. Learn which programs
              are available and how to position your application for success.

AFTER   lede: Mortgage review for a self-employed borrower generally looks at how
              income is documented rather than whether self-employment is
              acceptable. This guide explains the documentation approaches that
              may be considered and what each generally involves. Availability
              and requirements vary by borrower, property, lender and program.
```

"How to position your application for success" is removed: it implies an outcome.

## 2.9 The six pairs — differentiation, not paraphrase

Per your section 1, the aim is genuine usefulness, not defeating a similarity
score. The mechanism proposed is subtractive first:

```text
1  Move the shared generic explanation OUT of both pages into /guides/.
   This is where most of the 53-67% overlap lives, because the underlying
   facts are identical and both pages state them.
2  Each page keeps and expands its own market's scenario framing, FAQ set
   and conversion path.
3  Each page links to the relevant guide for the generic explanation.
```

Measured overlap today, Austin against DFW twin:

```text
/1099-mortgage-loans/                    63%
/construction-loans/                     67%
/bonus-commission-rsu-income-mortgage/   62%
/bank-statement-loans/                   59%
/dscr-investor-loans/                    54%
/self-employed-mortgage-loans/           53%
```

**Per-page differentiated content is drafted only after you approve the guide
blueprints**, because what stays on the market page is defined by what moves to
the guide. Sequencing them the other way would produce two rewrites.

## 2.10 P0-4 — approved claim strings

Current state, measured:

```text
"Serving Texas clients since 2002."     0 pages
"Over $1 billion in loans funded."      0 pages
SERVING CLIENTS SINCE 2002             17 pages  (marquee)
OVER $1 BILLION IN LOANS FUNDED        30 pages  (marquee / stat)
Serving Texas Since 2002                1 page   (homepage hero)
$1B+                                    5 pages  (stat tiles)
```

Per your section 5, compact variants may remain in marquee and stat treatments.
The proposal is therefore **additive, not a sweep**:

```text
PLACE the full approved strings in:
  /about/           company story block — both strings, in prose
  /                 primary trust/proof block beneath the hero — both strings
  /texas/           new page, company context paragraph — both strings

LEAVE unchanged:
  the DFW marquee, the homepage hero stat row, the footer stat tiles
```

No claim is reframed as your personal credential; `25+ Years of Mortgage
Experience` stays on your profile and team card only.

---

# 3. `/texas/` — full draft content

```text
Route        /texas/
Type         Neutral statewide hub
Robots       index, follow
Canonical    self
Sitemap      add
Form         NONE
CRM tag      NONE — no data-crm-tags, no data-program-interest
Lead owner   none; the visitor chooses a market
```

**H1**

```text
Mortgage Options for Self-Employed, Investor and High-Balance Borrowers in Texas
```

**Direct answer beneath the H1**

> Leahy Lending works with self-employed borrowers, business owners, real-estate
> investors and high-balance borrowers throughout Texas, including Austin and
> Dallas–Fort Worth. Which documentation and financing approaches may be relevant
> depends on the borrower, the property, the lender and the program. A scenario
> review is the step that identifies which paths may fit a particular situation.

**Section outline**

```text
H2  How Texas borrowers usually arrive here
      three short scenario paragraphs: tax returns understate income;
      investment property; high-balance purchase or refinance
H2  Documentation approaches that may be reviewed
      Bank Statement / Asset Utilization / No Ratio — one sentence each,
      each linking to its guide. No product framing, no eligibility claim.
H2  Investment property is reviewed differently
      DSCR distinction, linking to the DSCR guide
H2  Where Leahy Lending works
      the section 3 market-clarification framework, verbatim
H2  Choose your market
      the two CTAs
```

**Required verbatim paragraph** (your market framework)

> Leahy Lending serves borrowers throughout Texas, including Dallas–Fort Worth.
> Dallas–Fort Worth pages and conversion paths are part of Leahy Lending's
> Texas-wide business; they do not represent a separate branch, office, location,
> or legal entity.

**Company context paragraph** (carries the approved full strings)

> Leahy Lending, a DBA of Kyber Mortgage Corporation, has been serving Texas
> clients since 2002 and has funded over $1 billion in loans.

```text
Must not claim   a branch, office or location in any named city; any rate, APR,
                 payment, term, LTV, FICO, reserve or eligibility outcome;
                 program availability
Schema           WebPage only. No FinancialService node — that node carries an
                 address and would imply a location for a market-neutral page.
                 No FAQPage unless visible Q&A is added.
Author           none. No attribution until you review content.
```

---

# 4. CTA table

Every proposed CTA, with the destination's actual tag and owner.

```text
LABEL                                SOURCE        DESTINATION                        TAG AT DEST   OWNER       UNIVERSAL INTAKE?
Start a Dallas–Fort Worth            /texas/       /texas/dallas-fort-worth/          dfw           Eric        YES — program_interest="general", 10 steps
  scenario review                    /guides/*     (same)                             dfw           Eric        YES

Start an Austin scenario review      /texas/       ** NO CORRECT DESTINATION **       —             —           NO — see section 0
                                     /guides/*     ** NO CORRECT DESTINATION **       —             —           NO

(unchanged, for reference)
Start a scenario review              each Austin   that page's own questionnaire      austin        ClientCare  product-scoped by design
                                     program page
Start a scenario review              each DFW      that page's own questionnaire      dfw           Eric        product-scoped by design
                                     program page
```

**The DFW destination is confirmed and correct.** `/texas/dallas-fort-worth/`
carries `program_interest="general"`, the full ten-step all-scenario stepper, the
`dfw` tag and Eric's contact address. It is `noindex, follow`, which does not
affect a human following a link or a crawler passing through it.

**The Austin destination does not exist.** Decision 1.

---

# 5. Robots, canonical, sitemap, redirect and schema effects

```text
ROUTE       ROBOTS                 CANONICAL   SITEMAP        REDIRECT   SCHEMA
/texas/     index, follow          self (new)  ADD            none       WebPage (new)
/apply/     index → noindex,follow unchanged   REMOVE         none       unchanged
all others  unchanged              unchanged   unchanged      none       see below

SCHEMA, areaServed only:
  14 pages   "areaServed": [14 states]  →  "areaServed": "Texas"
  no other schema node added, removed or altered

COUNTS
  indexable   22 → 22   (/texas/ added, /apply/ removed)
  held back    9 → 10
  sitemap     23 → 23   (/texas/ added, /apply/ removed)

NO redirect is created or changed by P0. No canonical other than /texas/'s own
is added, removed or repointed.
```

---

# 6. Yelp removal inventory

**The rating claim exists on exactly one page.**

```text
REMOVE — 1 occurrence, 1 page
  /  (homepage)   visible text:  "5.0★"  +  "Google &amp; Yelp Rating"
                  stat tile in the hero proof panel
                  authored in: _build/home-content.js (hero proof tiles)
```

**The remaining 27 pages carry a link label only, not a rating:**

```text
LABEL "Yelp Reviews" — footer review block, 27 pages
  12 indexable Austin/root  ·  8 indexable DFW  ·  7 noindex
  authored in: _build/clone-common.js, _build/build-dfw-home.js
```

Your section 5 permits an ordinary external profile link whose visible label makes
no rating claim. `Yelp Reviews` states no score or count.

**One judgment point for you.** In the footer that label sits directly beneath
`Google · 5.0 · 258 Reviews`. The words make no claim, but the adjacency could
read as one. Two options: leave it, or relabel to `Leahy Lending on Yelp`.
Decision 2. Nothing is removed from the 27 pages without your answer.

---

# 7. areaServed removal inventory

```text
14 pages carry one identical array:

  "areaServed": ["Texas","Florida","Colorado","Arizona","Georgia","Washington",
                 "Oregon","Idaho","Indiana","Kansas","Oklahoma","Arkansas",
                 "Alabama","Alaska"]

PROPOSED:  "areaServed": "Texas"

Pages: /  /about/  /apply/  /contact/  /1099-mortgage-loans/
       /bank-statement-loans/  /bonus-commission-rsu-income-mortgage/
       /construction-loans/  /dscr-investor-loans/  /home-loans/
       /how-self-employed-borrowers-qualify-for-mortgage/
       /self-employed-mortgage-loans/  /privacy/  /terms/

Authored in: _build/austin-head-data.json  (the single source; the other
             files that mention areaServed read from it)
```

**Not touched:** the visible "Licensed in 14 States" list on `/about/` and the
state dropdown on the contact forms. Those are licensing statements and form
inputs, not service-area schema, and you did not direct their removal. Flagged
so the difference is deliberate.

---

# 8. `/apply/` specification

```text
CURRENT   robots     index, follow, max-snippet:-1, max-image-preview:large
          canonical  self
          sitemap    listed
          inbound    0 links of any kind; unreachable from the homepage by link-walk
          content    581 words; a 9-field enquiry form

PROPOSED  robots     noindex, follow
          canonical  unchanged (self)
          sitemap    REMOVE the <url> entry
          inbound    unchanged — it stays reachable from the nav "Start Application"
          content    unchanged

IMPLEMENTATION  add "austin/apply" to ALWAYS_NOINDEX in _build/set-indexing.js;
                the sitemap follows automatically because build-sitemap.js
                derives exclusions from that list.
```

---

# 9. Internal links

**P0 additions** — descriptive anchors, no sitewide footer link added.

```text
FROM                          ANCHOR TEXT                               TO
/                             "Mortgage options across Texas"           /texas/
/texas/                       "Dallas–Fort Worth mortgage options"      /texas/dallas-fort-worth/
/texas/                       "Mortgage options for self-employed
                               borrowers in Texas"                      /self-employed-mortgage-loans/
/texas/                       "Bank Statement mortgage options"         /bank-statement-loans/
/texas/                       "DSCR mortgage options for investment
                               property"                                /dscr-investor-loans/
/about/                       "Mortgage options across Texas"           /texas/
```

**P0 removals:** none.

**Not proposed:** any link from an Austin commercial page to its DFW counterpart
or the reverse, per your section 1 rule 5.

**Noted, not actioned:** six indexable pages have no editorial inbound link —
`/`, `/about/`, `/apply/`, `/construction-loans/`,
`/how-self-employed-borrowers-qualify-for-mortgage/`, `/mortgage-payment-amortization-calculator/`.
P0 fixes two of them. The rest are P1 work once the guides exist to link from.

---

# 10. Acceptance tests

Each is a build gate, negative-tested before being trusted.

```text
RAW HTML       every changed page serves its new direct answer in the raw
               response, not after JavaScript
CONDITIONAL    every rewritten lede contains conditional language and none of:
               approval, eligibility, rate, APR, payment, closing date, savings,
               loan amount, LTV, FICO, reserve
DSCR ACCURACY  /dscr-investor-loans/ states investment property and does not
               present DSCR as a primary-residence path
CTA ROUTING    every CTA destination returns 200 and carries the expected
               data-crm-tags and data-program-interest
CRM TAGS       no page's tag changes; /texas/ carries none
LEAD OWNERSHIP each market page's contact address is unchanged
INDEXABILITY   22 indexable, 10 held back; /texas/ index, /apply/ noindex
SITEMAP        23 URLs; /texas/ present, /apply/ absent; every URL a real
               indexable page with content
CANONICAL      every page self-referencing; no page canonicalizes elsewhere
SCHEMA         valid JSON on every page; areaServed reads "Texas" on all 14;
               no FAQPage claims an answer not visible on the page
MOBILE         /texas/ renders without horizontal scroll at 375px
ACCESSIBILITY  one h1; heading order; every image has alt; CTA links have
               discernible text
ENTITY         zero occurrences of DFW/Dallas branch, office, location,
               "Leahy Lending Dallas", separate-entity language, on any page
CLAIMS         both approved full strings present on /about/, / and /texas/
YELP           zero rating claims; link labels only
```

---

# 11. Items still requiring a decision

```text
1  AUSTIN UNIVERSAL INTAKE — blocks the Austin market-choice CTA, and so
   blocks the guides. Three options, none invented:
     a  Designate an existing Austin page as the universal intake and
        re-tag its questionnaire program_interest to "general".
        Candidate: /self-employed-mortgage-loans/ — but its tag would then
        stop describing its own page.
     b  Create an Austin equivalent of /texas/dallas-fort-worth/ — an Austin
        market page with a general-tagged intake. This is /texas/austin/,
        which you deferred in section 8.
     c  Point the Austin CTA at /contact/, which has no program_interest and
        no stepper. Simplest; loses scenario detail on the lead.
   No option is implemented. (a) needs a CRM tag decision, (b) reverses a
   deferral, (c) accepts a thinner lead.

2  YELP LINK LABEL — leave "Yelp Reviews" or relabel. Section 6.

3  P0-1 SEQUENCING — confirm that per-page differentiated copy for the six
   pairs is drafted AFTER the guide blueprints are approved, since what stays
   on each market page depends on what moves to the guides.

4  /texas/ H1 AND DIRECT ANSWER — approve, revise or replace the draft in
   section 3.

5  THE EIGHT AUSTIN LEDE REWRITES — approve, revise or replace each draft in
   section 2.

6  VISIBLE LICENSING LIST — the "Licensed in 14 States" text and the state
   dropdown are unchanged by the areaServed reduction. Confirm that is right.
```

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not compliance clearance and not production approval. No
implementation is authorized by this document, and none has been performed.
