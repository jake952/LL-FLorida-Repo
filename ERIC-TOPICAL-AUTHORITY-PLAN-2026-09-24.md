# Leahy Lending Staging Topical Authority and AI Retrieval Plan

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 24 September 2026
**Status:** Audit and plan only. Nothing in this document has been implemented.

---

# 1. Executive summary

The staging build is **technically sound and topically shallow**. Every page is
server-rendered, self-canonical, uniquely titled and crawlable. What it does not
do is answer the questions your handoff lists: **nine of your nineteen borrower
queries have no answer anywhere on the site, and five more are answered only in
passing.**

Four findings drive the whole plan.

**1. The DFW pages are the model. The Austin pages are the legacy.** All nine
indexable DFW program pages open with a conditional direct answer under the H1.
Only one of eleven indexable Austin pages does. The architecture you want already
exists in miniature — on the wrong half of the site.

**2. Six Austin/DFW pairs are 53–67% identical and both halves are indexable.**
You held `home-loans` out of the index at 84% overlap. These six sit just below
that line, self-canonical on both sides, competing.

**3. The comparison content that answers AI questions does not exist.** Not one
page compares Bank Statement to conventional, Asset Utilization, No Ratio or
DSCR — yet those four comparisons are five of your nineteen queries. `K-1`
appears **zero times** on the entire site.

**4. Florida exists only in schema.** Fourteen states are listed in an
`areaServed` array on 23 pages. No visible page says anything about Florida. That
is structured data asserting service areas the content does not support.

**The constraint that shapes the answer.** Lead routing is by URL path: a
root-level page tags `austin` and reaches ClientCare, a `/texas/dallas-fort-worth/`
page tags `dfw` and reaches Eric. The two halves are a commercial division, not a
topical one, so no recommendation may move informational content to one side —
that would misroute the other side's borrowers. §2.1 states this in full; an
earlier draft of this plan ignored it and was wrong.

**The resolution.** Both market clusters keep every page, form and tag they have.
The generic explanation that makes the six pairs 53–67% identical moves out of
both and into a new **market-neutral guidance layer that carries no form** and
closes with two labelled CTAs, one into each market's own scenario review. That
single move reduces the duplication *and* creates the comparison content that is
missing — one change, two problems.

Sequence: lift the Austin pages to the DFW standard and build the statewide spine
(P0), then the eight guides (P1), then market depth (P2). **11 new pages, none of
them inside either commercial cluster**, not the ~40 the template implies.

---

# 2. Scope, constraints, and facts used

**In scope.** The static build at
`C:/Users/damie/Downloads/leahylending_staging_full_v56_ai_visibility` and
the upload set it produces (119 files). 32 pages on disk.

**Evidence method.** Measured against the built upload set, not the source, so
findings describe what a crawler would receive. Twin similarity is 5-gram
overlap. Link counts are computed twice — once including nav and footer, once
with both stripped — because a page linked only from a sitewide menu is not
topically supported.

**Facts used, from your handoffs.** Organization is Leahy Lending, a DBA of Kyber
Mortgage Corporation. Eric Bennett, Executive Vice President & Mortgage Loan
Originator, NMLS #288376, 25+ Years of Mortgage Experience — personal credential.
Company claims: `Serving Texas clients since 2002.`, `Over $1 billion in loans
funded.`, Google rating and review count — approved, company-level, not
reframed as Eric's production. DFW is a service market, not a branch, office,
location or entity.

**Not authorized and not done.** No page added, deleted, rewritten, redirected,
re-indexed or re-schema'd. No sitemap or robots change. This document is the
only artifact.

## 2.1 The governing constraint: lead routing is by URL path

This plan was first drafted without it, and that draft was wrong. It is stated
here because every architectural recommendation below depends on it.

Measured from the built pages:

```text
/*                            data-crm-tags="austin"   contact: ClientCare@
/texas/dallas-fort-worth/*    data-crm-tags="dfw"      contact: Eric@
```

**The page a visitor lands on determines who receives the lead.** The two site
halves are not a topical division; they are a commercial one. DFW-intent traffic
is meant to reach Eric, and Austin and general traffic is meant to reach the rest
of Leahy Lending.

Three consequences follow, and they constrain everything in §9 onward:

1. **Any page that attracts search traffic must sit on the side that should
   receive its leads.** A well-ranked page on the wrong side is worse than no
   page, because it silently misroutes.
2. **A single shared educational layer at root level would tag every visitor
   `austin`** — including DFW-intent searchers. The first draft of this plan
   proposed exactly that. It would have sent Eric's traffic to the general queue.
3. **Splitting the halves by function — "Austin holds the information, DFW holds
   the application" — defeats the separation entirely**, because informational
   queries are how most borrowers arrive.

**The resolution used throughout this plan (option D).** Content that is
genuinely market-specific stays mirrored on both sides, each half keeping its own
forms and tags. Content that is genuinely market-neutral — a comparison between
two documentation approaches does not change between Austin and Dallas–Fort
Worth — is built once, **carries no form at all**, and offers two clearly
labelled CTAs that link into each market's own scenario review. No lead is
created on a neutral page; the lead is created on whichever market page the
visitor chooses. Routing stays clean by path, one click later.

A structural alternative — routing by a market the borrower declares on the form,
rather than by URL — is recorded as decision 9 in §18. It would remove this
constraint permanently, but it is a CRM workflow change and is not assumed here.

---

# 3. Staging-site inventory

32 pages on disk: **23 indexable**, 9 held back at `noindex, follow`. 28 declared
301 redirects. Every page is self-canonical; every page has exactly one `<h1>`;
no duplicate titles among indexable pages.

| Family | Routes | Indexable | Status |
|---|---|---|---|
| Austin program pages | 8 | 8 | root-level, legacy generation |
| Austin utility | `/about/` `/contact/` `/apply/` `/mortgage-payment-amortization-calculator/` | 4 | `/apply/` is orphaned |
| Austin legal | `/privacy/` `/terms/` | 0 | held back |
| Homepage | `/` | 1 | converted from React 24 Sep |
| DFW program pages | 9 | 9 | newest generation |
| DFW market home + utility + legal | 7 | 0 | held back |
| Profile | `/loan-officers/eric-bennett/` | 1 | built to your spec |

**New versus legacy.** The nine DFW program pages and the Eric profile are the
new generation. The eight Austin program pages are captured React output from the
prior site. `/`, `/about/`, `/contact/`, `/apply/`, `/privacy/`, `/terms/` were
React-only routes converted to static HTML on 24 September; their **content** is
legacy even though their delivery is new.

---

# 4. Current topical coverage matrix

Indexable pages only. "Leads with it" means the topic appears in the H1 or an
early heading, not merely in body text.

| Topic | Mentions | Leads with it | Gap |
|---|---|---|---|
| Self-employed / complex income | 23 | 4 | covered |
| Bank Statement | 23 | 2 | covered |
| Asset Utilization | 13 | **1** (DFW only) | no Austin/statewide page |
| No Ratio | 22 | **1** (DFW only) | no Austin/statewide page |
| 1099 income | 23 | 2 | covered |
| **K-1 income** | **0** | **0** | **absent entirely** |
| Commission / bonus / RSU | 23 | 2 | covered |
| Investor | 23 | 2 | covered |
| DSCR | 23 | 2 | covered |
| Super Jumbo / high balance | 20 | **2** (one is Eric's profile) | one real page, DFW only |
| **Conventional vs alt-doc** | **3** | **0** | **no comparison content** |
| **Primary vs investment property** | **2** | **0** | **DSCR's defining distinction is unstated** |
| Austin market | 23 | **1** (`/about/`) | no Austin market page |
| Dallas–Fort Worth | 20 | 9 | over-served relative to Austin |
| **Texas statewide** | **1** | **0** | **no statewide hub** |
| **Florida** | 5 | **0** | **schema only — see §6** |

**The shape of the problem:** DFW has nine topic-leading pages. Austin has one,
and it is the About page.

---

# 5. Query-to-page coverage audit

Your nineteen queries, measured against indexable pages. `OWNED` = answered in a
heading. `partial` = answer text exists in body copy but no page is organised
around the question. `MISSING` = no answer anywhere.

| Query | Status | Best current page |
|---|---|---|
| Can I get a mortgage if I am self-employed? | **OWNED** | `/self-employed-mortgage-loans/` |
| Tax returns show low income because of deductions | partial | `/self-employed-mortgage-loans/` |
| Bank statements instead of tax returns? | **OWNED** | `/bank-statement-loans/` |
| Business bank statements to qualify? | partial | `/bank-statement-loans/` |
| **Personal vs business Bank Statements** | **MISSING** | — |
| 12 or 24 months of Bank Statements | partial | `/bank-statement-loans/` |
| **How business expenses affect the review** | **MISSING** | — |
| **Bank Statement vs conventional** | **MISSING** | — |
| **Bank Statement vs Asset Utilization** | **MISSING** | — |
| **Bank Statement vs No Ratio** | **MISSING** | — |
| **Bank Statement vs DSCR** | **MISSING** | — |
| 1099 contractor or K-1 recipient? | **OWNED** (1099 only) | `/1099-mortgage-loans/` — K-1 absent |
| **Is DSCR primary residence or investment?** | **MISSING** | — |
| **What should an investor compare for DSCR?** | **MISSING** | — |
| **How can an entrepreneur finance a higher-value home?** | **MISSING** | — |
| Super Jumbo purchase/refinance paths | partial | `/texas/dallas-fort-worth/super-jumbo-mortgages/` |
| Self-employed help in Austin? | partial | `/` |
| Self-employed help in DFW? | **OWNED** | `/loan-officers/eric-bennett/` |
| **Investors evaluating DSCR in Texas?** | **MISSING** | — |

**Score: 5 owned, 5 partial, 9 missing.** Every comparison question is missing,
and comparison is exactly the shape answer engines quote. This is the single
largest content gap and it maps almost one-to-one onto the P1 build list in §10.

**Status:** Confirmed from staging.

---

# 6. Entity, trust, and market-positioning audit

| Check | Indexable pages | Finding |
|---|---|---|
| `A DBA of Kyber Mortgage Corporation` | 23 / 23 | consistent |
| Company NMLS 2653540 | 23 / 23 | consistent |
| Eric's NMLS 288376 | 12 | on the profile and the Work With Eric modules |
| `Executive Vice President` | **2** | his approved title is nearly invisible |
| **`Serving Texas clients since 2002.`** | **0** | **the approved wording appears nowhere** |
| any "since 2002" phrasing | 23 | three competing variants, see below |
| **`Over $1 billion in loans funded.`** | **1** | approved wording on one page |
| Google rating + review count | 19 | consistent at 258 |
| **Yelp rating** | **19** | **never supplied or approved** |
| Physical address block | 23 | Austin address, correctly single-location |

**Finding 6.1 — the approved company claim is not on the site.** Your wording is
`Serving Texas clients since 2002.` The build carries three different strings and
none of them is that:

```text
x16  SERVING CLIENTS SINCE 2002      (the DFW marquee)
x 1  Serving Texas Since 2002        (the homepage hero)
x 1  Serving Clients Since 2002      (a hero star row)
```

Same for funded volume: `$1B+ IN LOANS FUNDED` in the marquee and stat tiles,
`Over $1 billion in loans funded.` on one page. The claims are present and
approved; the **canonical strings are not**. For entity extraction this matters —
a consistent literal string across a site is a stronger signal than four
paraphrases.

**Finding 6.2 — an unapproved Yelp rating on 19 indexable pages.** Your §2
approves a *Google* rating and review count. The homepage and footer carry
`5.0★ Google & Yelp Rating` and a `Yelp Reviews` link. No Yelp figure has been
supplied or approved. **Requires a business decision.**

**Finding 6.3 — Florida is asserted in schema and nowhere in content.** Every
Austin page carries `"areaServed":["Texas","Florida","Colorado","Arizona",
"Georgia","Washington","Oregon","Idaho","Indiana",…]` — 14 states. No visible
page discusses Florida. Two DFW pages list the states in a licensing table.
Eric's profile is the only page with a visible Florida sentence: *"borrowers in
approved Florida markets."* Schema asserting service areas the content does not
support is the pattern your own instruction bars.

**Finding 6.4 — no false branch or office language anywhere.** Zero occurrences
of any barred term, on any page. `TEXAS'S TRUSTED MORTGAGE SPECIALIST` appears on
no DFW page. This is clean and was verified negatively.

**Finding 6.5 — zero author or reviewer attribution.** 0 of 32 pages. 7 of 32
carry a review or modified date. Handoff B task 5 remains unstarted, correctly,
because it is blocked on your confirmation of what you authored.

---

# 7. Technical retrieval-readiness audit

**Confirmed from staging — all good:**

```text
Server-rendered content     32 of 32 pages; no client-only route remains
Crawlable HTML links        1,760 internal + 65 anchors, all resolve
Canonicals                  32 of 32 self-referencing
Titles                      unique across all 23 indexable pages
H1                          exactly one per page
robots directives           explicit on every page; 23 index, 9 noindex/follow
Sitemap                     23 URLs, every one a real indexable page
Image alt text              0 of 18 images missing alt
lang + viewport             present on every page
Structured data             every indexable page carries at least one node
FAQ schema                  14 pages, each matching visible on-page text
404 handling                real 404 document, noindex/follow
```

**Confirmed from staging — problems:**

**7.1 Direct-answer blocks are a two-tier site.** Measuring the first ~45 words
after each H1 for conditional language:

```text
DFW program pages    9 of 9   conditional   ("may", "depending on", "vary by")
Austin pages         1 of 11  conditional
```

Every DFW page opens the way your §6 page model requires. Austin opens with
promotional assertions — *"We count what others won't"*, *"Traditional lenders
penalize you for maximizing your tax deductions. We don't."*, *"Qualify using the
rental income from the property — not your personal income."* The last is also a
DSCR accuracy problem (§8.4).

**7.2 `/apply/` is orphaned.** Zero inbound links of any kind, and unreachable
from the homepage by link-walking. It is indexable and in the sitemap.

**7.3 Six indexable pages have no editorial inbound link** — reachable only via
the sitewide nav or footer: `/`, `/about/`, `/apply/`,
`/how-self-employed-borrowers-qualify-for-mortgage/`, `/construction-loans/`,
`/mortgage-payment-amortization-calculator/`. Sitewide chrome links distribute
authority thinly and carry no topical signal.

**7.4 Click depth is flat and healthy** — depth 0: 1 page, depth 1: 15, depth 2:
15, unreachable: `/apply/` only.

**Blocked by missing application source:** none. The React dependency is gone —
all six former SPA routes are static as of 24 September.

---

# 8. Duplicate, thin, orphan and canonical-risk findings

**8.1 Six indexable Austin/DFW pairs are near-duplicates.** 5-gram overlap,
Austin measured against its DFW twin, **both sides indexable and self-canonical**:

```text
/1099-mortgage-loans/                    63%   vs /texas/dallas-fort-worth/1099-mortgages/
/construction-loans/                     67%   vs /texas/dallas-fort-worth/construction-loans/
/bonus-commission-rsu-income-mortgage/   62%   vs /texas/dallas-fort-worth/rsu-bonus-commission-income/
/bank-statement-loans/                   59%   vs /texas/dallas-fort-worth/bank-statement-mortgages/
/dscr-investor-loans/                    54%   vs /texas/dallas-fort-worth/dscr-investor-loans/
/self-employed-mortgage-loans/           53%   vs /texas/dallas-fort-worth/self-employed-mortgages/
```

For reference, you held `home-loans` out of the index at 84%. These sit below
that but well above the 30–39% you would expect from independently written pages.
Google picks one of a near-duplicate pair regardless of what each asks for.
**Requires a business decision** — treatment options in §12.

**8.2 Already-held-back near-duplicates, correctly handled:** `/about/` 88%,
`/home-loans/` 85%, `/contact/` 77%, `/privacy/` 89%, `/terms/` 88%, calculator
93%. In every case exactly one side is indexable. No action needed.

**8.3 No thin pages.** The shortest indexable page is `/apply/` at 581 words; the
median is about 1,600. Thinness is not this site's problem.

**8.4 One accuracy risk, not a duplication risk.** `/dscr-investor-loans/` opens
*"Qualify using the rental income from the property — not your personal income."*
Your rules require DSCR to be distinguished from owner-occupied financing, and
this page never states that it is for investment property. Its DFW twin does.
**Requires a content rewrite, flagged in §15.**

---

# 9. Proposed information architecture

Your template, reduced to what the evidence supports and reorganised around the
§2.1 routing constraint. Three tiers, distinguished by **who receives the lead**.

## Tier 1 — the two market clusters. Unchanged, and deliberately so.

```text
Austin  (root level)            data-crm-tags="austin"   ->  ClientCare
  /self-employed-mortgage-loans/   /bank-statement-loans/   /1099-mortgage-loans/
  /dscr-investor-loans/   /construction-loans/   /home-loans/
  /bonus-commission-rsu-income-mortgage/
  /how-self-employed-borrowers-qualify-for-mortgage/

DFW  (/texas/dallas-fort-worth/)  data-crm-tags="dfw"      ->  Eric
  nine program pages, all indexable, each with its own questionnaire
```

**No page is promoted, moved or merged out of either cluster.** An earlier draft
of this plan proposed promoting `/self-employed-mortgage-loans/` into a neutral
topic hub. That would have stripped an Austin lead-capture page of its tag and
its form and handed its traffic to no one in particular. Both clusters keep every
page, every form and every tag they have today.

What changes in tier 1 is **quality, not structure**: P0-2 lifts the Austin
pages' opening blocks to the DFW conditional model, and market framing is
sharpened on both sides to pull the six near-duplicate pairs apart (§12).

## Tier 2 — the market-neutral guidance layer. NEW. Carries no form.

A comparison between two documentation approaches does not change between Austin
and Dallas–Fort Worth. Writing one version per market would manufacture a
seventh, eighth and ninth near-duplicate pair on top of the six that already
exist. So these are built **once**, carry **no form at all**, and close with two
clearly labelled CTAs into each market's own scenario review.

No lead is created on a neutral page. The lead is created on whichever market
page the visitor chooses, which keeps routing correct by path — one click later.

```text
/guides/                                                        hub, P1
  /guides/bank-statement-vs-conventional-mortgage/              P1
  /guides/bank-statement-vs-asset-utilization/                  P1
  /guides/bank-statement-vs-no-ratio/                           P1
  /guides/bank-statement-vs-dscr/                               P1
  /guides/personal-vs-business-bank-statements/                 P1
  /guides/12-month-vs-24-month-bank-statements/                 P1
  /guides/how-business-expenses-affect-bank-statement-analysis/ P1
  /guides/what-dscr-means-for-rental-property-financing/        P1
```

Every one answers a query that is **MISSING on both sides today** (§5). None
competes with an existing page, because no existing page addresses comparison at
all.

`/guides/` is chosen over `/complex-income-mortgage-options/` deliberately: it
signals "this page informs, it does not capture", which is precisely its job, and
it keeps the neutral layer visibly distinct from the two commercial clusters.

## Tier 3 — the market spine. Also neutral.

```text
/texas/                      statewide hub, no form, two CTAs      P0
/texas/austin/               Austin market application             P2, decision 7
/texas/dallas-fort-worth/    exists, noindex, unchanged
```

`/texas/` must be neutral for the same reason the guides are: a statewide hub
that tagged `austin` would misroute every DFW visitor who landed on it.

**Not proposed, with reasons:**

- `business-owner-mortgage-planning/` — overlaps the self-employed pages; no
  distinct query in your list.
- `k-1-income-mortgage-options/` standalone — K-1 has zero site presence and no
  query separate from variable income.
- Five `/investor-mortgages/` transaction pages — one query between them.
- Four of five `/super-jumbo-mortgages/` children — one distinct query.
- **A per-market copy of any guide** — that is the near-duplicate condition §8.1
  already flags six times.
- `/florida/*` — no approved market list, no visible content, no evidence.

**Architecture rules applied.** Bank Statement, Asset Utilization and No Ratio are
compared against one another as documentation approaches, not listed as parallel
"mortgage types". 1099 is an income type. DSCR sits with investor content and is
never presented as primary-residence financing. Super Jumbo is its own pillar and
is never labelled NQM.

---

# 10. Proposed URL and page-priority roadmap

**P0 — consolidate and lift. No new topics.**

```text
P0-1  Resolve the six near-duplicate pairs by sharpening market framing
      on both sides                                       §12, decision 1
P0-2  Rewrite Austin direct-answer blocks (11 pages) to the DFW
      conditional model                                   §7.1
P0-3  Fix the DSCR primary-vs-investment framing          /dscr-investor-loans/
P0-4  Canonical company-claim strings sitewide            §6.1
P0-5  Resolve the Yelp rating claim                       §6.2, decision 2
P0-6  Give /apply/ an editorial inbound link, or noindex it
P0-7  Build /texas/ as a neutral statewide hub            the missing spine
```

**P1 — the guidance layer. This is the AI-retrieval work.** Eight neutral pages,
each answering a currently-missing query, none capturing a lead directly:

```text
/guides/   and its seven comparison and documentation guides (listed in §9)
```

**P2 — market depth.**

```text
/texas/austin/                                          decision 7
Austin and DFW market-scenario expansions on the existing program pages
/guides/variable-income-mortgage-guidance/              absorbs K-1
/guides/mortgage-options-when-tax-returns-understate-income/
```

**Do not build:** everything listed as not proposed in §9, and all `/florida/*`
until decision 5 is answered.

**Total: 11 new pages** — one statewide hub, eight guides, and two P2 guides —
plus rewrites to existing pages. Not the ~40 the template implies, and not one
new page inside either commercial cluster.

---

# 11. Page blueprints for P0 and P1

Two representative blueprints in full. The remaining guides follow the same
model.

## 11.1 `/guides/bank-statement-vs-dscr/`

```text
Page type            Comparison guide, market-neutral
Primary question     What is the difference between Bank Statement and DSCR?
Search intent        Informational, decision-stage, pre-application
Priority             P1
Index                index, follow — unique intent, no existing page
Lead capture         NONE. This page carries no form and no market tag.
Market applicability Both. Routed by the visitor's CTA choice.
```

**Direct answer beneath H1 (draft, 74 words, for your approval):**

> Bank Statement and DSCR approaches answer different questions. A Bank Statement
> review looks at a borrower's own deposit activity and is generally used where
> the borrower occupies the property. A DSCR review focuses on the rental income
> a property is expected to produce and is used for investment property, not a
> primary residence. Which may apply depends on the borrower, the property, the
> lender and the program, and a full scenario review is needed before identifying
> a path.

```text
Must explain         who each approach is for; the occupancy distinction; what
                     documents each review generally considers
Must NOT claim       eligibility, rates, LTV, FICO, reserves, DSCR thresholds,
                     that either is "easier", that DSCR suits a primary residence
Required qualifier   conditional-availability sentence, visible, not a footnote
Links in             both market clusters' bank-statement and DSCR pages, /guides/
Links out            /guides/, and the two market CTAs below
CTA                  TWO, clearly labelled, no form on the page:
                       "Start a Dallas–Fort Worth scenario review"
                          -> /texas/dallas-fort-worth/bank-statement-mortgages/
                       "Start an Austin scenario review"
                          -> /bank-statement-loans/
                     Each destination already carries its own questionnaire, its
                     own crm tag and its own contact address, so the lead is
                     created on the correct side.
Author/reviewer      Eric, ONLY if he materially reviews it
Schema               FAQPage, only for questions visibly answered on the page
```

**Why no form.** A form here would have to tag one market or the other, and would
misroute roughly half the traffic it captured. Two labelled CTAs let the visitor
declare the market themselves, at the moment they are ready to convert.

## 11.2 `/texas/` — neutral statewide hub (P0-7)

```text
Page type            Pillar hub / market spine, market-neutral
Primary question     Who helps self-employed and investor borrowers in Texas?
Priority             P0 — the missing link between topic and market
Index                index, follow
Lead capture         NONE. Two CTAs, as above.
```

**Direct answer beneath H1 (draft, 61 words, for your approval):**

> Leahy Lending works with self-employed borrowers, business owners, investors
> and high-balance borrowers throughout Texas, including Austin and
> Dallas–Fort Worth. Which documentation and financing approaches may be
> relevant depends on the borrower, the property, the lender and the program. A
> scenario review is the step that identifies which paths may fit a particular
> situation.

```text
Must explain         statewide service; the two market applications beneath it
Must NOT claim       a branch, office or location in any named city
Required             the §3 market-clarification framework, verbatim
Links in             homepage, both market clusters, /guides/
Links out            /texas/dallas-fort-worth/, the Austin cluster, /guides/
```

**Why P0:** `Texas statewide` currently appears on **one page**. The site has
topic pages and market pages with nothing joining them, so "…in Texas" queries
have nowhere to resolve. This page also gives `/texas/dallas-fort-worth/` a
parent other than the homepage.

---

# 12. Market-page strategy

**The two clusters stay as they are.** Both keep their full page sets, forms and
tags. The separation is commercial and this plan does not touch it.

**Austin.** Eight indexable program pages, correctly tagged `austin`, all routing
to ClientCare. Their weakness is copy quality, not placement: one of eleven opens
with conditional language. P0-2 fixes that. A dedicated `/texas/austin/` market
application is P2 and depends on decision 7 — Austin traffic is already captured
by the root-level cluster, so this is an upside play rather than a gap.

**Dallas–Fort Worth.** Nine indexable pages, conditional direct answers, FAQ
schema, market-specific framing, correctly tagged `dfw`, routing to Eric. **This
family passes your §F test as built.** The market home stays `noindex, follow`
per Handoff B. No change recommended.

**Texas-wide.** Missing. P0-7, neutral.

**Florida.** **Do not build.** No approved market list, no visible content, and
the only Florida signal is an `areaServed` schema array. Blocked on decision 5.

**The six near-duplicate pairs — revised treatment.** The earlier draft proposed
making the Austin side informational and the DFW side transactional. That is
withdrawn: it would have routed informational traffic — which is most traffic —
to the wrong side of the business.

The correct treatment given §2.1 is to **keep both sides commercial and pull them
apart by market framing**:

```text
Each side keeps its questionnaire, its tag and its contact address.
Each side's copy is rewritten to address its own market's borrower —
  local property types, local scenarios, local purchase and refinance context.
Neither side becomes a "topic page" that the other links to for information.
Shared, genuinely market-neutral explanation moves OUT of both and into
  /guides/, which is where the overlap was coming from in the first place.
```

That last line is the mechanism: much of the 53–67% overlap is generic
explanation that is identical because the underlying facts are identical. Moving
that explanation to a neutral guide and linking to it from both sides reduces the
duplication **and** creates the comparison content that is currently missing.
One change, two problems.

---

# 13. Proposed internal-link graph

```text
/  ──►  both clusters  +  /texas/  +  /guides/

/texas/  ──►  /texas/dallas-fort-worth/, the Austin cluster, /guides/

Austin cluster page  ──►  its DFW counterpart is NOT linked
                     ──►  the relevant /guides/ pages
                     ──►  its own questionnaire

DFW cluster page     ──►  its Austin counterpart is NOT linked
                     ──►  the relevant /guides/ pages
                     ──►  its own questionnaire

/guides/<comparison> ──►  both subject pages IN BOTH CLUSTERS
                     ──►  /guides/ hub
                     ──►  two market CTAs
```

**Why the clusters do not cross-link.** A link from an Austin page to its DFW
twin invites a visitor who is already on the correct side to move to the wrong
one. The clusters meet only at `/texas/` and `/guides/`, where the visitor is
given an explicit market choice.

**Rules:** descriptive anchors only; no new sitewide footer links; Eric's profile
linked only from pages he actually reviewed — today, none.

**Fix first (evidence in §7.2–7.3):** `/apply/` has zero inbound links of any
kind; six indexable pages have zero editorial inbound links.

---

# 14. Required source and application dependencies

**None for the content work.** This is a change from every prior handoff: the
React dependency is gone. All six former SPA routes became static HTML on
24 September, so every page is an ordinary file edit.

Remaining dependencies are **informational, not technical**:

```text
Approved Florida market list                      blocks all /florida/*
Author/reviewer confirmation from Eric            blocks Handoff B task 5
Resource copy + review dates                      blocks Handoff B task 6
Yelp rating source, or a decision to remove       blocks P0-5
A content workflow that can carry real review
dates and attribution                             blocks trust signals at scale
```

---

# 15. Content and compliance review flags

**Confirmed from staging, requires a decision:**

```text
1  Unapproved Yelp rating on 19 indexable pages                      §6.2
2  Schema areaServed asserts 14 states; content supports none        §6.3
3  /dscr-investor-loans/ never states investment-property-only       §8.4
4  Austin direct-answer blocks are promissory, not conditional       §7.1
5  Approved claim strings absent; three variants in use              §6.1
6  Six indexable near-duplicate pairs                                §8.1
```

**Already approved by you, no action:** `No Tax Returns Required`, the Michael R.
testimonial and its `$1.4M`, `WE SAY YES WHEN OTHERS SAY NO`, `14 STATES
LICENSED`, and the three company proof claims.

**Language rules applied throughout this plan:** no approval, eligibility, rate,
APR, payment, closing-date, savings, loan-amount, LTV, FICO or reserve claim
appears in any draft copy above. No Ratio is never described as "no income
verification". DSCR is never described as primary-residence financing. Super
Jumbo is never labelled NQM. 1099 is treated as an income type.

---

# 16. Measurement and AI-discovery test plan

**No implementation guarantees a ranking, an AI Overview, a ChatGPT answer, a
Perplexity citation, or a lead.** This plan measures; it does not promise.

**Search Console query groups:** self-employed qualification · bank statement
documentation · comparison/versus · DSCR and investor · super jumbo ·
Austin-modified · DFW-modified · Texas-modified · brand.

**Technical monitoring:** indexed count vs sitemap count; canonical selection per
near-duplicate pair; click depth ≤ 3 for every indexable page; editorial inbound
links ≥ 1 for every indexable page; rendered-content check that each new page
serves its direct answer in raw HTML; entity-string consistency count for the
three company claims.

**Conversion events (privacy-safe):** scenario-review starts, completed forms,
booked consultations, applications, funded-loan attribution. **No borrower
financial data in analytics** — the existing 9-dimension allow-list already
enforces this and should be extended to any new event.

**Fixed AI-discovery prompt set**, run monthly, recording prompt, date,
system/model, whether Leahy appeared, cited URLs, competitors named, notes. A
single run is one sample of one model at one moment and must not be reported as
the model's index.

```text
Broad             Who are the best mortgage lenders for self-employed borrowers in Texas?
Self-employed     My tax returns show low income because of write-offs. What mortgage
                  options should I look at?
Bank Statement    Can I use bank statements instead of tax returns for a mortgage?
                  Should I use 12 or 24 months of bank statements?
Comparison        What is the difference between a bank statement mortgage and a DSCR loan?
                  Bank statement vs asset utilization mortgage — which is which?
Investor / DSCR   Is a DSCR loan for a primary residence or an investment property?
Super Jumbo       How can a business owner finance a $3M home?
Austin            Who helps self-employed borrowers get a mortgage in Austin?
DFW               Who helps self-employed borrowers get a mortgage in Dallas–Fort Worth?
Texas-wide        Which Texas lenders work with complex-income borrowers?
Florida           [hold until an approved market list exists]
```

**Baseline before implementing anything**, so change is attributable.

---

# 17. Implementation phases, sequencing and acceptance criteria

```text
Gate 0   This plan approved, and the §18 decisions answered.
Phase 1  P0 consolidation and lift.
         Accept when: no indexable near-duplicate pair above ~50% remains
         unresolved; all 11 Austin pages open with a conditional direct answer;
         the DSCR occupancy distinction is stated; the three company claim
         strings are canonical sitewide; /apply/ is linked or noindexed;
         /texas/ exists and links both markets.
Gate 1   Eric reviews Phase 1 copy before any of it is published.
Phase 2  P1 comparison layer — eight pages.
         Accept when: each of the nine MISSING queries in §5 has a page whose
         H1 or an H2 asks that question and whose visible copy answers it
         conditionally; each carries FAQ schema matching visible text; each has
         at least one editorial inbound link.
Gate 2   Eric reviews. Baseline AI-discovery run recorded.
Phase 3  P2 market and depth — four pages.
Gate 3   30/60/90-day measurement against the Phase-0 baseline.
```

**Nothing publishes without the gate above it.**

---

# 18. Open questions requiring Eric's decision

Only genuine decisions. Everything answerable by inspection has been inspected.

```text
1  The six indexable near-duplicate pairs (§8.1, §12). The proposal is to keep
   both sides commercial and move the shared generic explanation out to
   /guides/. Confirm, or state a different treatment.

2  The market-neutral guidance layer (§2.1, §9 tier 2). Confirm that a page
   which informs but captures no lead, and offers a labelled CTA into each
   market, is acceptable — or say that every indexable page must belong to one
   commercial side, in which case the comparison content can only be built on
   one side and the other concedes those queries.

3  The Yelp rating on 19 indexable pages (§6.2) — substantiate or remove?

4  The areaServed schema listing 14 states with no supporting content (§6.3) —
   reduce to Texas, or add content?

5  Should the approved claim strings be enforced verbatim sitewide (§6.1), or
   are the current variants acceptable?

6  Which approved Florida markets, if any? Nothing is built until this is
   answered.

7  Which content may carry your author/reviewer attribution? Today: none.

8  Should /texas/austin/ be built as a market application (P2), given that
   Austin traffic is already captured by the root-level cluster?

9  Is /apply/ intended to be indexable? It is orphaned and in the sitemap.

10 STRUCTURAL, and the one worth considering beyond this plan: should lead
   routing move from URL path to a market the borrower declares on the form?
   Today the path decides, which is why the guidance layer has to carry no
   form. Routing on a declared market would decouple "where content ranks"
   from "who receives the lead" and remove the constraint permanently. It is a
   CRM workflow change, owned by Jake, and nothing in this plan assumes it.
```

**Not asked, because the build answered them:** which routes are static versus
application-owned (all static as of 24 September); which pages are new versus
legacy (§3); which proposed pages already exist under another URL (§9); which
market pages have unique value (§12).

**Not documented, and not invented:** Leahy Lending has no documented internal
content-review workflow in this repository. A proposed one is offered in §17 as a
recommendation only.

---

# 19. Appendix: route inventory and path-specific evidence

Full machine-readable inventory: 32 routes with word count, robots value,
canonical, sitemap membership, heading counts, FAQ-schema presence and schema
types, produced by the audit scripts and reproducible against the upload set.

**Finding status key, applied throughout:**

```text
Confirmed from staging          §3, §4, §5, §6.1, §6.3, §6.4, §6.5, §7, §8
Likely but needs verification   competitor query-to-page relationships (§5 is
                                Leahy-side evidence only; no competitor site
                                was inspected and none is claimed)
Blocked by missing source       none — the React dependency is resolved
Requires business decision      §6.2 Yelp, §8.1 duplication, §12 Florida,
                                §18 all
Not authorized for implementation   every recommendation in this document
```

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

This is an audit and a proposal. Nothing here has been implemented, and a passing
build is not compliance clearance or production approval. No claim is made that
any recommendation will produce a ranking, an AI citation, or a lead.
