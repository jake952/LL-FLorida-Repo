# Response to the FMO Media Search and AI Visibility Audit

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 25 September 2026
**Re:** FMO Media audit of 23 September — what it changes, what it conflicts with, and the proposed plan

**No implementation is proposed in this document.** It asks for decisions. The
P0 work remains implemented in staging and unpublished.

---

# 1. What FMO measured, and what was not in it

```text
Audit date          23 September 2026
AI tracking         a single day, 22 September 2026
Traffic figures     third-party estimates, not Search Console
Site measured       leahylending.com as it stands in PRODUCTION
```

That last line matters more than anything else in the document. FMO measured the
live site. The live site contains **none** of the P0 work, and — separately —
has never received the `.htaccess` file that the whole route structure depends
on. Every legacy 301 currently 404s, and `/index.html` still serves a duplicate
of the homepage.

So the audit is an accurate photograph of a site we already knew was
underperforming, taken before any of the corrections were applied.

---

# 2. What the audit gets right

Three findings, and they are fair.

```text
1  100% of Google visits are branded. People searching "leahy lending" or
   "ryan leahy" find us. Nobody arrives from a search for a loan type.

2  Zero AI citations in September. Earlier in 2026 assistants WERE using some
   of our pages as sources. By September they had stopped.

3  A direct Austin competitor with a similar loan menu grew its Google
   footprint fourfold while ours shrank.
```

**Finding 2 is the important one, and FMO reports it without explaining it.**

We already identified a mechanism that produces exactly that result. The React
routes served an empty shell carrying the homepage canonical. To any crawler
that does not run JavaScript — which includes most AI retrieval — every product
page looked like a contentless duplicate of the homepage. A page with no readable
content cannot be quoted, and a page that cannot be quoted stops being cited.

FMO's own section 6 says the same thing from the outside: *"Your best pages are
not built to be quoted."* They diagnosed the symptom correctly. The cause was
structural, and it is already fixed in staging.

---

# 3. FMO's three causes, mapped to actual status

FMO section 6 names three causes. Two of them are build problems that are
already addressed. One is not, and that distinction should drive the spend.

```text
FMO CAUSE                          STATUS

1. "Homepage says lender, not      Implemented in staging.
   which loans."                   Conditional direct answers now sit under the
                                   H1 on every Austin program page, on the DFW
                                   pages already, and on the new /texas/ hub.

3. "Best pages are not built to    Implemented in staging.
   be quoted."                     FAQ answers are present in the raw HTML
                                   rather than drawn by JavaScript; FAQPage
                                   schema matches visible Q&A; every changed
                                   page serves its answer without JavaScript.

2. "Few outside sources vouch      NOT ADDRESSED, and not addressable by us.
   for you."                       No build change creates independent mentions
                                   on sites assistants read.
```

**That is the whole strategic read.** Of the three causes FMO identified, the two
that live on our own site are built and waiting on approval to publish. The
third is genuinely outside what a build can do, and it is the only one that makes
a real case for an outside agency.

---

# 4. The conflict that needs your ruling

**FMO's highest-value opportunities are queries we are prohibited from answering
in the words that rank.**

Their evidence table leads with:

```text
"mortgage lenders that do not require tax returns"
"no doc mortgage loans georgia"
```

Your standing prohibitions bar, unless approved in writing:

```text
No income required          No documentation required
No tax returns required     Qualify on gross deposits
```

and your content rules state that No Ratio is not "no income verification."

So the demand FMO measured is real, and the phrasing that captures it is barred.

## 4.1 Proposed resolution — answer the question, not the claim

A borrower typing "lenders that don't require tax returns" is not asking for a
guarantee. They are describing a situation: their returns do not reflect what
their business earns. That situation can be answered fully and compliantly, and
the approved copy already does it:

```text
BARRED CLAIM           "No tax returns required."

APPROVED ANSWER        "Bank Statement mortgage options may be worth reviewing
                       for self-employed borrowers whose tax returns do not
                       fully reflect current business cash flow."
                       — your wording, now live in staging on
                       /bank-statement-loans/
```

The second sentence answers the borrower's actual question, is quotable by an
assistant, and makes no prohibited claim. **Our position is that we compete for
this demand on the conditional phrasing and do not chase the barred phrasing at
any ranking cost.**

This needs to be stated to FMO in writing before they produce a single word,
because an agency paid on question coverage will feel constant pull toward the
phrasing that ranks, and that phrasing is the prohibited one.

## 4.2 The blocker this makes urgent

Six occurrences of barred phrases remain in body copy on four **indexable**
pages, outside the opening blocks you approved:

```text
/bank-statement-loans/                             x1  "no tax returns required"
/self-employed-mortgage-loans/                     x3  "no tax returns required"
/self-employed-mortgage-loans/                     x1  "perfect for business owners"
/bonus-commission-rsu-income-mortgage/             x1  "we count what others won't"
/how-self-employed-borrowers-qualify-for-mortgage/ x1  "no tax returns required"
```

These were reported, not rewritten, because no approved replacement wording
exists and inventing public copy for indexable pages is not a build decision.
**This is the one item blocking publication.** Decision 1.

---

# 5. The geographic conflict

FMO's question list spans:

```text
Houston · McAllen · Corpus Christi · Midland · Lubbock · Fort Worth · Dallas
Nashville · Fresno · Louisiana · Georgia
```

Against your standing rules: Florida is deferred entirely, `areaServed` was
reduced to Texas only at your instruction, and inventing service areas is barred.

A meaningful share of FMO's "opportunity" is therefore off the table as written.
Texas metros outside Austin and DFW may be legitimate — we are licensed statewide
— but that is a business decision about where leads would route, not a content
decision. Decision 3.

---

# 6. Where I would question their data

Not to dismiss the audit, but these should be asked before money moves.

```text
ONE DAY OF AI TRACKING   "Zero citations" and "named once" come from a single
                         snapshot, 22 September. AI answers vary by session and
                         personalization. Directional, not solid. Ask for
                         several weeks.

ESTIMATED TRAFFIC        The 100%-branded figure comes from a third-party
                         estimate, not Search Console. We have GSC access. Our
                         own data settles this in minutes, at no cost, and is
                         authoritative.

UNEVIDENCED LINK CLAIM   "A recent wave of low-quality links pointing at your
                         site" is asserted with no data attached. That is either
                         a real problem we need to see, or sales pressure. Ask
                         for the list.
```

To their credit, they flag the Seer click-through figure as a correlation rather
than a proven cause, which is more care than these documents usually show.

---

# 7. Proposed plan

Four phases. The first two cost nothing beyond work already done.

## Phase A — publish what is built (this week)

```text
Dependency   your replacement wording for the six occurrences in 4.2
Then         upload the P0 build, including the .htaccess that has never
             reached production
Effect       every product page becomes readable without JavaScript, carries a
             conditional direct answer, and serves FAQ content in raw HTML;
             legacy 301s stop 404ing; the duplicate homepage URL stops
             resolving
Status       built and verified in staging; awaiting your approval to publish
```

## Phase B — measure from our own data (2 to 4 weeks after Phase A)

```text
Establish a baseline from Search Console, not third-party estimates:
  branded vs non-branded impressions and clicks
  which pages earn impressions for loan-type queries
  crawl and indexation of the newly readable pages
Re-run the AI citation check over several weeks, not one day.
```

This is the number that tells us how much of FMO's gap was structural and how
much is genuinely an authority problem. **Buying a retainer before this
measurement means paying an agency to fix things that may already be fixed.**

## Phase C — the /guides/ layer (already blueprinted, pending your approval)

FMO's workstream 05 is "articles built for AI." That is the `/guides/` layer you
already approved in principle. Six guides are blueprinted and carry all nine of
the borrower questions that currently have no answer anywhere on the site:

```text
/guides/bank-statement-vs-conventional/
/guides/asset-utilization-explained/
/guides/no-ratio-explained/
/guides/dscr-for-investment-property/
/guides/1099-and-contract-income/
/guides/documenting-self-employed-income/
```

Rules already set by you and unchanged: no lead-capture form, no automatic market
tag, no default market ownership, no implied office or branch, two labelled
market-choice CTAs only.

**One dependency is now resolved.** The Austin universal intake that these CTAs
require did not exist when you deferred this. `/contact/` now carries the general
ten-step scenario review, tagged austin, routing to ClientCare, with the same
submitted field shape as the DFW intake. The guides are no longer blocked on it.

## Phase D — scope outside help against what is left

Only after Phase B. The honest case for an agency is narrow and specific:

```text
GENUINELY NEEDS OUTSIDE HELP
  independent mentions and placements on lending, real-estate and Texas
  sources that assistants already read (FMO cause 2)

DOES NOT NEED AN AGENCY
  technical site sweep        — done, and it found two things FMO's did not:
                                /texas/ would have returned 404 in production,
                                and the .htaccess has never been deployed
  page optimization           — built and verified in staging
  keyword and AI monitoring   — worth buying, but cheaply and separately
```

**Recommendation: do not sign either package as scoped.** Both bundle six
workstreams, and we have already built two of them. If we engage FMO, engage them
for authority building and monitoring, priced accordingly, after Phase B tells us
what the residual gap actually is.

---

# 8. If FMO is engaged, the guardrails come first

Their smaller package is 13 articles plus 3 to 5 third-party placements per
month; the larger roughly doubles it. That is a large volume of public
mortgage-advertising copy produced outside our approval chain, in a regulated
vertical, under the company NMLS.

Non-negotiable terms, proposed:

```text
1  Every article, placement and byline is approved by you before publication.
   No exceptions, no retroactive review.
2  The prohibited-phrase list is contractual, not advisory.
3  Geographic scope is limited to markets you name in writing.
4  No content is attributed to Leahy Lending or to you personally without your
   review — "Written by Leahy Lending" remains prohibited, and no author or
   reviewer attribution is applied retroactively.
5  Placements that make rate, APR, payment, approval or eligibility claims are
   rejected regardless of performance.
6  Written confirmation of who carries compliance responsibility for
   third-party placements.
```

If approving that volume is more review load than you can carry, the honest
answer is a smaller package or a slower cadence — not a looser gate. The controls
we spent this month building stop meaning anything the moment content ships
around them.

---

# 9. Decisions required

```text
1  REPLACEMENT WORDING for the six barred-phrase occurrences in 4.2.
   Blocks publication of everything. Most urgent item on this list.

2  CONFIRM THE POSITION IN 4.1 — we compete for the "no tax returns" demand
   on conditional phrasing and do not chase the barred phrasing at any
   ranking cost.

3  GEOGRAPHIC SCOPE — which Texas metros beyond Austin and DFW, if any, are in
   scope, and how leads from them route. Nashville, Fresno, Louisiana and
   Georgia are assumed out unless you say otherwise.

4  PHASE A APPROVAL — publish the P0 build once item 1 is resolved.

5  PHASE C APPROVAL — the six guide blueprints, now that the Austin universal
   intake dependency is resolved.

6  FMO ENGAGEMENT — whether to proceed at all, and if so whether to accept the
   narrowed scope in Phase D and the guardrails in section 8.

7  THE GOHIGHLEVEL CUSTOM FIELDS (source_url, entry_page_title, guide_title,
   selected_market) still need creating, or the CRM drops them silently.
   Unrelated to FMO, still outstanding.
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
Media will produce a ranking, an AI citation, or a lead. The FMO audit's findings
are theirs; the measurements in it were taken against the production site on
22 and 23 September 2026 and predate all P0 work.
