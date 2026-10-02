# P0 Staging Return Package

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 25 September 2026
**Re:** Your §9 required return package — ten items

**Implemented in staging. Not published.** No production deployment, upload,
live route, robots, schema, indexing, redirect or CRM-routing change has been
made.

```text
build                    63 steps, all green
pages                    33
internal links           1,810 + 65 anchors, all resolve
indexing                 23 indexable / 10 held back
sitemap                  23 URLs, exactly the indexable set
schema                   35 ld+json blocks, 0 invalid
web root                 81 files, 0 internal .md documents
barred phrases visible   0
P0 verification          51 of 51 checks pass against the built upload set
```

**Two items require your decision before publication — §11.**

---

# 1. Before / after — prohibited phrase replacements

**Correction first: there were fourteen occurrences on six pages, not six on
four.** My earlier count came from a pass that inventories only the seven pages
it owns; it never examined the homepage or `/apply/`. You issued replacement
wording on the strength of that count. The full sweep found:

```text
/                    (homepage, INDEXABLE)   4 occurrences  — never scanned before
/self-employed-mortgage-loans/  INDEXABLE    5
/bank-statement-loans/          INDEXABLE    2
/how-self-employed-borrowers-…/ INDEXABLE    1
/apply/                         noindex      1  — never scanned before
```

Two of those matter beyond the count. The homepage carried **"No Tax Returns
Required"** as a hero line directly beneath "We Say Yes When Others Say No". And
`/self-employed-mortgage-loans/` described No Ratio as **"No Income Docs / No
income verification required"** — the exact description your rules prohibit by
name.

## 1.1 Pages you addressed

```text
/bank-statement-loans/
  BEFORE (H2)      No Tax Returns. No Problem.
  AFTER  (H2)      When Tax Returns Do Not Reflect Your Business

  BEFORE (bullet)  No tax returns required
  AFTER  (bullet)  Reviewed on bank statements rather than tax returns

/self-employed-mortgage-loans/
  BEFORE  Qualify using 12–24 months of personal or business bank statements —
          no tax returns required. Perfect for business owners who maximize
          deductions.
  AFTER   A review of 12–24 months of personal or business bank statements may
          be worth exploring when tax returns do not fully reflect current
          business cash flow. It may be worth reviewing for business owners
          whose documentation does not fit a standard mortgage review.

  BEFORE (card label)  No Income Docs
  AFTER  (card label)  Asset-Based Review

  BEFORE  No income verification required. Qualify based on your assets, credit
          score, and down payment — not your tax returns or income documentation.
  AFTER   A No Ratio review sets aside the personal income and debt-to-income
          calculation, not the rest of the file. Credit, assets, down payment,
          property type and loan purpose still apply.

  BEFORE (bullet ×2)  No tax returns required
  AFTER  (bullet ×2)  Reviewed on bank statements or a CPA-prepared P&L

  BEFORE (bullet)     No income verification
  AFTER  (bullet)     Debt-to-income ratio not calculated in the usual way

/how-self-employed-borrowers-qualify-for-mortgage/
  BEFORE  Use 12–24 months of bank deposits to demonstrate income. No tax
          returns required. Best for business owners with strong cash flow.
  AFTER   Use 12–24 months of bank deposits to demonstrate income. Some mortgage
          approaches may use documentation beyond a standard tax-return review,
          depending on the borrower, property, lender, and program.
```

The No Ratio replacement deliberately mirrors wording already approved and live
on `/texas/dallas-fort-worth/no-ratio-mortgages/`, so both markets describe No
Ratio identically. Your instruction not to repeat one sentence three times is
honored — the three instances were three different elements and each took
wording suited to its element.

## 1.2 New surfaces — pending your confirmation (§11, decision 1)

```text
/  (homepage)
  BEFORE  No Tax Returns Required
  AFTER   For borrowers whose tax returns do not fully reflect current business
          cash flow

  BEFORE  Qualify using 12–24 months of bank statements — no tax returns required.
  AFTER   A review of 12–24 months of bank statements may be an option when tax
          returns do not fully reflect current business cash flow.

  BEFORE  We use bank statements, P&L statements, or no income verification to
          qualify you for the home you've earned.
  AFTER   Depending on the situation, a review may consider bank statements, a
          CPA-prepared profit and loss statement, or an asset-based approach.

  BEFORE  Bank statements, P&L, or no income verification
  AFTER   Bank statements, P&L, or asset-based review

/apply/  (noindex, follow)
  BEFORE  No tax returns required for self-employed
  AFTER   Documentation approaches beyond tax returns for self-employed borrowers
```

## 1.3 Two matches deliberately left in place

Both carry a barred string inside a sentence that negates it — the correction
you mandated, not a breach of it:

```text
/texas/                    "It is not the same as no income verification, and it
                            does not mean a borrower's finances go unreviewed."
/texas/dallas-fort-worth/no-ratio-mortgages/
                           "Does No Ratio mean no documentation at all? No. A No
                            Ratio review sets aside the personal income and
                            debt-to-income calculation, not the rest of the file."
```

The gate understands the difference, so a later pass cannot "fix" the correction
by deleting it.

## 1.4 One change caught only by reading the rendered page

The homepage hero replacement went through two versions. The first read
"Documentation Beyond Tax Returns" — clean in isolation. In the extracted text
stream it sits immediately after the line above and reads:

```text
"We Say Yes When Others Say No Documentation Beyond Tax Returns"
```

A person sees two separate elements. A crawler and an AI assistant read the
concatenation, and that reads as a "no documentation" claim. Reworded to the
version in §1.2. **No phrase-level check catches this** — every individual string
was clean.

## 1.5 Internal review comments removed

24 HTML comments of the form `<!-- REVIEW: Eric: "no tax returns required" is
barred -->` were shipping on nine pages. Invisible to a reader, present in the
served source, quoting the barred phrase verbatim and exposing internal review
chatter. All removed; the gate fails if one returns.

They also caused a real defect: several sat **inside** the sentences being
replaced, splitting them, so the first run of the replacement pass matched
nothing on the long sentences while reporting success on the short ones.
Comments are now stripped before any text edit.

---

# 2. Seller-financing preservation report

Nothing seller-financing was touched. The drafted `/home-loans/` lede was
**withdrawn, not deferred** — absent from the builder, with an explicit hands-off
guard that fails the build if `/home-loans/` is added to the copy pass.

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

The withdrawn string "Home Financing Options in Texas" appears on zero pages.
No seller-financing section, heading, feature list, CTA, link, schema, FAQ,
testimonial, metadata or asset text was altered; no seller-financing page, guide,
comparison or module was created. None of the pages edited for prohibited copy
contains seller-financing language, so your §2 exclusion was never engaged.

---

# 3. Final staging URL list

33 routes. Every page self-canonical; no page canonicalizes elsewhere.

```text
INDEXABLE (23)
/                                          /about/
/1099-mortgage-loans/                      /bank-statement-loans/
/bonus-commission-rsu-income-mortgage/     /construction-loans/
/contact/                                  /dscr-investor-loans/
/home-loans/                               /how-self-employed-borrowers-qualify-for-mortgage/
/loan-officers/eric-bennett/               /mortgage-payment-amortization-calculator/
/self-employed-mortgage-loans/             /texas/                            ← NEW
/texas/dallas-fort-worth/1099-mortgages/
/texas/dallas-fort-worth/asset-utilization-mortgages/
/texas/dallas-fort-worth/bank-statement-mortgages/
/texas/dallas-fort-worth/construction-loans/
/texas/dallas-fort-worth/dscr-investor-loans/
/texas/dallas-fort-worth/no-ratio-mortgages/
/texas/dallas-fort-worth/rsu-bonus-commission-income/
/texas/dallas-fort-worth/self-employed-mortgages/
/texas/dallas-fort-worth/super-jumbo-mortgages/

HELD BACK — noindex, follow (10)
/apply/            ← CHANGED THIS RELEASE      /privacy/            /terms/
/texas/dallas-fort-worth/                      /texas/dallas-fort-worth/about/
/texas/dallas-fort-worth/contact/              /texas/dallas-fort-worth/home-loans/
/texas/dallas-fort-worth/privacy/              /texas/dallas-fort-worth/terms/
/texas/dallas-fort-worth/mortgage-payment-amortization-calculator/
```

---

# 4. Route and redirect report

```text
301 rules      28   none added, removed or repointed in P0
404 rules       9   one MODIFIED this release
```

**The one modified rule, and why it mattered.** `.htaccess` carried an
unconditional rule that 404'd `/texas/`:

```apache
RewriteRule ^texas/?$ - [R=404,L]
```

Correct while `/texas/` was an empty intermediate directory. With the hub built
it would have served **a 404 for a page that is indexable and in the sitemap** —
we would have asked Google to index a URL the server refuses. Now:

```apache
RewriteCond %{DOCUMENT_ROOT}/texas/index.html !-f
RewriteRule ^texas/?$ - [R=404,L]
```

Same idiom as the market-segment rule directly below it. The clean 404 is
preserved if the hub is ever removed.

**301 target verification.** 25 of the 28 rules have literal targets, and every
one resolves to a page that exists on disk. The remaining three are pattern
rules with backreferences — the `index.html` canonicalizer and two trailing-slash
normalizers — whose targets are computed at request time and cannot be checked
statically. **Live verification of all 28 is post-deployment by nature and is
item 1 of the deployment sequence in §10.**

---

# 5. `/index.html` duplicate handling

```apache
RewriteCond %{THE_REQUEST} \s/(.*/)?index\.html[\s?] [NC]
RewriteRule ^(.*/)?index\.html$ /%1 [R=301,L]
```

Present and verified in the deployment package. `THE_REQUEST` holds the original
request line, so the rule fires only when a browser or crawler actually asked for
`index.html`. An internal rewrite to `index.html` — which is how every directory
is served — leaves `THE_REQUEST` untouched and falls through. Matching on the
rewritten path instead would loop: directory rewrites to `index.html`,
`index.html` redirects to directory, forever.

`%1` is the captured directory, so the redirect lands on that directory rather
than the site root. The rule sits above the pass-through rule, which ends in
`[L]`, so a redirect placed after it would never be reached.

This has never been live. Every one of the 27 duplicate URLs found in the
September route sweep still answers 200 in production today, and will until this
file deploys.

---

# 6. Search Console and analytics baseline plan

Per your §5.

```text
GOOGLE SEARCH CONSOLE
  branded vs non-branded impressions, clicks, CTR, average position
  query groups: self-employed, Bank Statement, Asset Utilization, No Ratio,
                DSCR, investor, Super Jumbo, Austin, DFW, Texas
  pages earning impressions for loan-type queries
  index coverage, crawl behavior, canonical selection

ANALYTICS
  scenario-review starts · completed forms · booked consultations
  applications · funded-loan attribution · market and source routing

TECHNICAL
  live route status · raw rendered HTML · canonicals · robots directives
  sitemap inclusion · redirect behavior

CADENCE      baseline at deploy, then 2, 4, 8 and 12 weeks

AI TESTING   a fixed prompt set, run across multiple sessions and several weeks.
             Recorded per run: exact prompt, model/platform, date, location or
             context where known, the answer, companies named, visible citations
             and source URLs, notes. A one-day test is not treated as conclusive.
```

**One operational note.** Search Console retains 16 months, so publishing does
not destroy the baseline — but the before/after comparison is only clean if the
**exact deploy timestamp is recorded** as the boundary. That figure is what
settles whether the FMO gap was structural or genuinely about off-site authority.

---

# 7. GoHighLevel field confirmation

```text
FIELD               STATUS                    EMITTED BY THE SHIPPED PAYLOAD
source_url          created by Jake, 25 Sep   yes
entry_page_title    created by Jake, 25 Sep   yes
guide_title         created by Jake, 25 Sep   yes
selected_market     created by Jake, 25 Sep   yes

crm_custom_fields_required   63 -> 67
```

Placed in the `Page / campaign context` folder alongside `landing_page`,
`market_page` and `program_interest`.

Value rules implemented exactly as your §1.2 specifies:

```text
source_url        location.origin + location.pathname. The query string is never
                  read into it, so no personal data can travel in a URL parameter.
entry_page_title  the page's H1, falling back to <title>; trimmed to 200 chars.
guide_title       populated only from a /guides/ page; blank everywhere else, so
                  blank on every P0 submission by construction.
selected_market   austin or dfw, derived from the page's own market_page value or
                  its data-market-page attribute. Never inferred from anything the
                  visitor types.
```

`discovery_source` remains the visitor's own answer in its own field and is never
overwritten by referrer, UTM, click-ID or touch-source data.

---

# 8. Intake test submissions — PARTIAL, one step outstanding

**Payload construction and market routing: verified. Delivery and CRM retention:
not yet proven.**

A submission from the local staging origin is refused by the integration's CORS
policy:

```text
Access to fetch at 'https://ll-crm-integration2.vercel.app/api/contact' from
origin 'http://localhost:4173' has been blocked by CORS policy.
```

That is the endpoint behaving correctly — it should not accept posts from
arbitrary origins — and production will pass because the origin will be
`https://leahylending.com`. **No record was written, so nothing was polluted and
nothing was proven about retention.**

What the browser built was captured before the request left, and is correct:

```text                  AUSTIN /contact/              DFW /texas/dallas-fort-worth/
tags                     ["austin","general"]          ["dfw","general"]
source                   Scenario Review – Austin      Scenario Review — dfw_homepage
landing_page             austin_contact                dfw_homepage
market_page              austin                        dallas_fort_worth
selected_market          austin                        dfw
program_interest         general                       general
form_type                scenario_review               scenario_review
campaign_theme           mortgage_scenario_review      alternative_documentation_non_qm

source_url               .../contact/                  .../texas/dallas-fort-worth/
entry_page_title         Let's Discuss Your Mortgage   Mortgage Options for Self-Employed
                         Options                       Borrowers & Business Owners
guide_title              (empty)                       (empty)

transaction_goal         purchase                      investment_purchase_or_refinance
income_profile           business_owner                real_estate_investor
documentation_path       bank_statements               dscr_rental_income
timeline                 shopping                      shopping
property_city_state      Austin, TX                    Dallas, TX

discovery_source         google_search                 chatgpt
attribution              referrer, utm_*, click_ids, first/last_touch all present
consent                  sms_consent=yes, timestamp, consent URL, disclosure text

custom fields            38                            38   ← identical shape
```

Neither payload carries the other market's identity. Conditional fields are
emitted in both, empty where the branch did not apply, so the shape matches.

**Also verified incidentally:** when the POST fails, the borrower sees *"We could
not send your request right now. Please try again in a moment or call us at
(512) 240-2897."* — the correct market's number. That is what a CRM outage looks
like to a lead.

**To close this item**, either run both submissions from the live origin
immediately after deployment, or temporarily allowlist the staging origin on the
integration. Recommended: the former, as step 4 of the deployment sequence in
§10, so the test exercises exactly the path production uses.

---

# 9. P1 guide blueprints — review only, not implemented

```text
LAYER RULES (unchanged from your prior direction)
  no lead-capture form            no automatic Austin or DFW CRM tag
  no default market ownership     no implied office, branch or location
  indexable, self-canonical       two labelled market-choice CTAs only
  guide_title populated from the guide H1 on submissions originating there
  no mirrored Austin/DFW variants of any guide
```

Six guides carrying all nine borrower questions that currently have no answer
anywhere on the site:

```text
/guides/bank-statement-vs-conventional/
    How a Bank Statement review differs from a conventional review; what deposits
    are and are not; why tax returns may understate cash flow. Absorbs the
    generic explanation now duplicated across both market pages.

/guides/asset-utilization-explained/
    What an asset-based income review considers; how it differs from "no income
    verification", which it is not.

/guides/no-ratio-explained/
    What No Ratio means, with the explicit correction that it is not no income
    verification and does not mean an unreviewed borrower.

/guides/dscr-for-investment-property/
    What a DSCR review looks at; that it is investment-property financing and not
    a primary-residence path.

/guides/1099-and-contract-income/
    How 1099 income is reviewed; that it is an income type and not a separate
    product; K-1 income, which appears zero times on the site today.

/guides/documenting-self-employed-income/
    The hub. Which documentation approaches exist and when each may be relevant.
    Links to the five above.
```

**Sequencing, per your §6.** No guide is drafted or published until P0 is live,
Phase B baseline capture is complete, and you have approved the blueprints and
final copy. For each of the six Austin/DFW pairs I will return, before any copy
is written: what generic content moves to the guide layer, what market-specific
framing stays, what unique FAQs each page answers, what internal links each uses,
and confirmation that CTA and conversion behavior is unchanged.

**The Austin intake dependency that blocked this is resolved.** `/contact/` now
carries the general ten-step scenario review, tagged austin, routing to
ClientCare, submitting the same 38-field shape as the DFW intake.

---

# 10. QA report and deployment sequence

## 10.1 Gates, and the negative test each survived

A gate that has only ever been seen green is not evidence. Each of these was fed
a failing input and observed to go red before its pass was trusted.

```text
GATE                        CAUGHT                              NEGATIVE TEST
austin lift wording guard   selected_market="dfw" leaking into  injected; fails
                            an Austin page via the lifted card
audit-integrity crm-fields  4 new fields unregistered — GHL     injected; fails
                            would drop them silently
sync-yelp end-state         a SECOND Yelp rating shape (five    4 injections,
                            star glyphs) the first pass missed  all 4 caught
prohibited-copy gate        barred claim in visible copy, with  negation cases
                            mandated negations excluded         verified excluded
austin openings hands-off   /home-loans/ added to the copy pass guard exits 1
texas hub neutrality        form / CRM tag / program interest / asserted at build
                            address schema reaching the hub
```

`sync-yelp.js` gained a `YELP_CHECK_ONLY=1` mode specifically so its gate could
be negative-tested: it repairs what it finds and then asserts the end state, so
in normal operation it can never go red for anything the rewriter can fix.

## 10.2 Results

```text
63 build steps                                          all green
33 pages, 1,810 internal links + 65 anchors             all resolve
23 indexable / 10 held back; sitemap 23                 exact match
35 ld+json blocks                                       0 invalid
barred phrases in visible copy                          0
internal REVIEW comments in served HTML                 0
internal .md documents in the web root                  0
independent P0 verification                             51 of 51 pass
```

## 10.3 Unresolved, reported not fixed

```text
/texas/dallas-fort-worth/about/ renders the H1 "Austin's Trusted Lender for Over
  Two Decades" — Austin wording on a DFW page. It is noindex, follow, so impact
  is limited, and it is outside the scope you authorized.

The Austin privacy policy has no CCPA section and no #ccpa anchor, while the DFW
  one does. The new Austin intake's consent disclosure links "Do Not Sell My
  Personal Information"; I pointed it at /privacy/ rather than fabricate an
  anchor, so nothing is broken, but the section the link names does not exist.
  Pending privacy review.

The build summary line reports "22 indexable" where the artifact has 23. Its page
  walker starts at the site root and skips it, so the homepage is invisible to
  that enumeration and to every sweep built on it. The files are correct; the
  summary is not. Not changed here — it alters what a dozen gates see and
  deserves its own change.
```

## 10.4 Production deployment sequence

```text
1  Upload the full 81-file web root INCLUDING .htaccess. Partial deployment is
   not acceptable — the route structure depends on that file and it has never
   reached production.
2  Verify every legacy 301 resolves in one hop and lands on a real page.
3  Verify /index.html and each of the 27 directory duplicates now 301 to their
   directory and no longer answer 200.
4  Run the Austin and DFW intake submissions from the live origin; confirm the
   records arrive, carry all four new fields, and reach ClientCare and Eric
   respectively with no crossing.
5  Verify status, canonical, robots and raw rendered HTML for all 33 routes.
6  Confirm /texas/ returns 200 and /apply/ returns noindex, follow and is absent
   from the sitemap.
7  Record the exact deploy timestamp for the Phase B baseline boundary.
8  Submit the updated sitemap in Search Console.
```

---

# 11. Decisions required before publication

```text
1  CONFIRM OR REPLACE the five new-surface replacements in §1.2 — four on the
   homepage, one on /apply/ — and the /bank-statement-loans/ H2 in §1.1. These
   are the only places I have written public copy for pages your response did
   not cover. This is the blocking item.

2  APPROVE THIS PACKAGE for Phase A publication, or state what else you need.

Noted, not blocking: item 8 closes at deployment step 4. If you want the CRM
retention proven before deployment instead, say so and the staging origin can be
allowlisted temporarily.
```

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not compliance clearance and not production approval.
Sixty-three green steps and fifty-one passing checks describe what the files
contain, not whether the claims in them are substantiated or the product
statements accurate. The replacement wording in §1.2 has not been reviewed by
you. No production deployment has been made and none is authorized.
