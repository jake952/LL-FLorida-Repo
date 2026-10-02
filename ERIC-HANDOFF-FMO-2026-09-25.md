# Handoff: FMO Media Audit — Conclusions and Decisions Required

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 25 September 2026
**Re:** FMO Media "Search and AI Visibility Audit", 23 September 2026

**Nothing in this handoff has been implemented.** P0 remains implemented in
staging and unpublished. This document asks for six decisions and states what
follows from each answer.

---

# 1. What the audit is

```text
Prepared by      FMO Media
Dated            23 September 2026
AI tracking      one day — 22 September 2026
Traffic figures  third-party estimates, not Search Console
Site measured    leahylending.com in PRODUCTION
Commercial ask   $3,000/month or $5,000/month retainer
```

It is a sales document with a real audit inside it. The findings are fair. The
prescription is six bundled workstreams, and we have already built two of them.

**The site it measured contains none of the P0 work, and has never received the
`.htaccess` file the route structure depends on.** Every legacy 301 currently
404s and `/index.html` still serves a duplicate of the homepage. The audit is an
accurate photograph of a site we already knew was underperforming, taken before
any correction was applied.

---

# 2. Conclusions

**2.1 The three headline findings are accurate.** 100% of Google visits are
people searching the company or Ryan's name. Zero AI citations in September.
A direct Austin competitor with a similar loan menu grew fourfold while our
footprint shrank.

**2.2 The most important line in the document is one FMO does not explain.**
Assistants *were* using our pages as sources earlier in 2026 and stopped by
September. We already identified a mechanism that produces exactly that: the
React routes served an empty shell carrying the homepage canonical, so to any
crawler that does not run JavaScript every product page looked like a
contentless duplicate of the homepage. A page that cannot be read cannot be
quoted, and a page that cannot be quoted stops being cited.

FMO's own section 6 says the same thing from outside — *"your best pages are not
built to be quoted."* They found the symptom. The cause is structural and is
already corrected in staging.

**2.3 Of FMO's three named causes, two are already built.**

```text
FMO CAUSE                             STATUS
"Homepage says lender, not which      Implemented in staging — conditional
 loans"                               direct answers under every H1
"Best pages are not built to be       Implemented in staging — FAQ answers in
 quoted"                              raw HTML, FAQPage schema matching
                                      visible content, no JavaScript needed
"Few outside sources vouch for you"   NOT addressed, and not addressable by a
                                      build change of any kind
```

The third is the only finding that makes a genuine case for an outside agency.

**2.4 Our technical sweep found two things theirs did not.** `/texas/` would have
returned a 404 in production because of an unconditional rewrite rule, and the
`.htaccess` has never been deployed at all. Neither appears in the FMO document.

**2.5 The demand they measured is real; the phrasing that captures it is
prohibited.** Their evidence table leads with *"mortgage lenders that do not
require tax returns"* and *"no doc mortgage loans georgia"*. Section 3 below.

**2.6 Three of their numbers should be pressed before money moves.** One day of
AI tracking is directional, not solid — assistant answers vary by session.
The 100%-branded figure is a third-party estimate when we have Search Console
and can settle it ourselves at no cost. And *"a recent wave of low-quality links
pointing at your site"* is asserted with no data attached; that is either a real
problem we need to see or sales pressure. To their credit they flag their
click-through statistic as correlation rather than cause.

---

# 3. The compliance conflict

FMO's highest-value opportunities are queries we are barred from answering in
the words that rank.

```text
BARRED, unless approved by you in writing
  No income required            No documentation required
  No tax returns required       Qualify on gross deposits

Your content rules also state No Ratio is not "no income verification."
```

**Proposed position: answer the borrower's question, never make the claim.**

Someone typing "lenders that don't require tax returns" is not asking for a
guarantee. They are describing a situation — their returns do not reflect what
their business earns. That situation is fully answerable, and your own approved
copy already does it:

```text
BARRED CLAIM      "No tax returns required."

YOUR WORDING      "Bank Statement mortgage options may be worth reviewing for
                  self-employed borrowers whose tax returns do not fully
                  reflect current business cash flow."
                  — live in staging on /bank-statement-loans/
```

That sentence answers the question, is quotable by an assistant, and makes no
prohibited claim. **We propose competing for this demand on conditional phrasing
and not chasing the barred phrasing at any ranking cost** — and that this be
stated to FMO in writing before they produce a word, because an agency paid on
question coverage will feel constant pull toward the phrasing that ranks.

## 3.1 The item blocking publication

Six occurrences of barred phrases remain in body copy on four **indexable**
pages, outside the opening blocks you approved:

```text
/bank-statement-loans/                             x1  "no tax returns required"
/self-employed-mortgage-loans/                     x3  "no tax returns required"
/self-employed-mortgage-loans/                     x1  "perfect for business owners"
/bonus-commission-rsu-income-mortgage/             x1  "we count what others won't"
/how-self-employed-borrowers-qualify-for-mortgage/ x1  "no tax returns required"
```

Reported rather than rewritten, because no approved replacement wording exists
and inventing public copy for indexable pages is not a build decision. **This is
the only thing standing between the P0 build and publication.**

---

# 4. The scope conflict

FMO's question list spans Houston, McAllen, Corpus Christi, Midland, Lubbock,
Fort Worth, Dallas, Nashville, Fresno, Louisiana and Georgia.

Against your standing rules: Florida is deferred entirely, `areaServed` was
reduced to Texas only at your instruction, and inventing service areas is barred.
A meaningful share of their "opportunity" is off the table as written. Texas
metros beyond Austin and DFW may be legitimate since we are licensed statewide,
but that is a lead-routing decision, not a content decision.

---

# 5. What we propose to do

```text
PHASE A   Publish the P0 build, including the .htaccess that has never reached
          production.
          Blocked by decision 1. Nothing else.

PHASE B   Establish a baseline from Search Console — branded vs non-branded
          impressions, which pages earn loan-type impressions, crawl and
          indexation of the newly readable pages. Re-run the AI citation check
          over several weeks rather than one day.
          2 to 4 weeks after Phase A. Costs nothing.

PHASE C   The /guides/ layer you already approved in principle. Six blueprints
          carrying all nine borrower questions that currently have no answer
          anywhere on the site. Rules unchanged: no form, no automatic market
          tag, no default market ownership, no implied office or branch, two
          labelled market-choice CTAs.

PHASE D   Scope outside help against whatever gap remains after Phase B.
```

**One dependency that blocked Phase C is now resolved.** When you deferred the
guide layer, no Austin universal intake existed for its market-choice CTAs.
`/contact/` now carries the general ten-step scenario review, tagged austin,
routing to ClientCare, submitting the same field shape as the DFW intake.

**On the engagement: we recommend not signing either package as scoped.** Both
bundle six workstreams and two are already built. If FMO is engaged, engage them
for authority building and monitoring, priced accordingly, after Phase B shows
what the residual gap actually is. Buying a retainer before that measurement
means paying to fix things that may already be fixed.

---

# 6. What we will not do without your written approval

```text
Publish anything while the six barred phrases in 3.1 remain
Produce or approve content using any prohibited phrase, for any ranking gain
Target any market outside those you name in writing
Create service-area, city or state pages for markets you have not approved
Apply author or reviewer attribution to any page, retroactively or otherwise
Accept third-party placements that make rate, APR, payment, approval or
  eligibility claims
Engage FMO Media or commit to either package
```

---

# 7. Decisions required

```text
1  REPLACEMENT WORDING for the six occurrences in 3.1.
   Consequence: nothing publishes until this is answered. Most urgent item here.

2  CONFIRM THE POSITION IN SECTION 3 — compete on conditional phrasing, never
   the barred phrasing, whatever it costs in ranking.
   Consequence: this becomes a contractual term with any agency.

3  GEOGRAPHIC SCOPE — which Texas metros beyond Austin and DFW are in scope, and
   how their leads route. Nashville, Fresno, Louisiana and Georgia are assumed
   out unless you say otherwise.

4  PHASE A — approval to publish the P0 build once decision 1 is resolved.

5  PHASE C — approval of the six guide blueprints, now that the Austin intake
   dependency is resolved.

6  FMO ENGAGEMENT — proceed or not; if proceeding, whether to accept the
   narrowed scope in Phase D. If engaged, every article, placement and byline
   is approved by you before publication, the prohibited-phrase list is
   contractual, and we need written confirmation of who carries compliance
   responsibility for third-party placements. Their smaller package is 13
   articles plus 3 to 5 placements per month; the larger roughly doubles it.
   If approving that volume is more review than you can carry, the answer is a
   smaller package or a slower cadence, not a looser gate.

7  GOHIGHLEVEL CUSTOM FIELDS — source_url, entry_page_title, guide_title and
   selected_market must be created or the CRM drops them silently. Unrelated to
   FMO, still outstanding, and it blocks the Austin and DFW test submissions.
```

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not compliance clearance and not production approval. No claim
is made that publishing the P0 build, building the guide layer, or engaging FMO
Media will produce a ranking, an AI citation, or a lead. The findings in the FMO
audit are theirs; its measurements were taken against the production site on
22 and 23 September 2026 and predate all P0 work.
