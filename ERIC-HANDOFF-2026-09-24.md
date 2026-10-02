# Response to the AI-Friendly Topical Cluster Audit Handoff

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 24 September 2026
**Re:** Your handoff of 24 September — audit complete, plan delivered

---

## Deliverable

```text
Leahy Lending Staging Topical Authority and AI Retrieval Plan
ERIC-TOPICAL-AUTHORITY-PLAN-2026-09-24.md
```

All nineteen sections in the structure you specified. Every finding cites a
route, states the observed behavior, why it matters, the recommended treatment
and its dependency, and carries one of your five status labels.

**Nothing has been implemented.** No page added, deleted, rewritten, redirected,
re-indexed or re-schema'd on the strength of this audit. No sitemap, robots or
conversion-routing change. The build is unchanged at 56 green steps, 32 pages,
1,760 internal links resolving.

---

# 1. Your section 12 questions, answered by inspection

You asked that these be inspected rather than returned to you. Nine of eleven
were answerable from the build.

**1. Scope.** One static build and the upload set it produces — 32 pages, 121
files. No second staging domain or repository exists in the project.

**2. New architecture versus legacy.** The nine DFW program pages and your
profile page are the new generation. The eight root-level Austin program pages
are captured output from the prior site. `/`, `/about`, `/contact`, `/apply`,
`/privacy`, `/terms` were converted to static HTML on 24 September — their
delivery is new, their **content is legacy**.

**3. Static versus application source.** **All 32 routes are static files.** The
React dependency that every prior handoff carried is gone; the compiled bundle no
longer serves any route. Every recommendation in the plan is an ordinary file
edit.

**4. Conversion-path ownership and correctness.** This turned out to be the most
consequential finding in the audit, and it governs the whole architecture.
Routing is **by URL path**:

```text
/*                            data-crm-tags="austin"   contact: ClientCare@
/texas/dallas-fort-worth/*    data-crm-tags="dfw"      contact: Eric@
```

The page a visitor lands on decides who receives the lead. Both clusters route
correctly today. There is **no Texas-wide or Florida conversion path**, because
neither page family exists. An earlier draft of the plan proposed a shared
educational layer at root level; it would have tagged every visitor `austin`,
including DFW-intent searchers, and was withdrawn. Section 2.1 of the plan states
the constraint in full.

**5. Proposed pages already existing elsewhere.** Six of your template's URLs
have an existing equivalent under a different slug — `/self-employed-mortgages/`,
`/bank-statement-mortgages/`, `/dscr-mortgages/`, `/super-jumbo-mortgages/`,
`.../how-self-employed-borrowers-qualify/` and `/1099-income-mortgage-options/`.
The plan does not create duplicates of them.

**6. Market-page value.** The nine DFW pages pass your section F test as built:
conditional direct answers, FAQ schema, market-specific framing. The Austin pages
do not — one of eleven opens with conditional language. Detail in plan section 12.

**7. Florida.** Cannot be answered by inspection. **Decision required.**

**8. Eric attribution.** **Zero of 32 pages** carry author or reviewer
attribution, correctly, because you have not confirmed what you authored or
reviewed. **Decision required.**

**9. Company-claim sources.** Not documented in the project. The claims are
present and approved by you; the supporting records are not in this repository.

**10. State legal and licensing disclosures.** Not documented in the project.
Every page carries the company NMLS and the standard licensing block; there is no
per-state or per-page-type disclosure matrix. Not invented.

**11. Content-management workflow.** **No documented internal workflow exists** in
this repository for genuine review dates or controlled attribution. 7 of 32 pages
carry any review or modified date. A proposed workflow appears in plan section 17
and is labelled a recommendation, not a Leahy Lending policy.

---

# 2. What the audit found

Four headlines. Evidence and treatment are in the plan.

**Nine of your nineteen borrower queries have no answer anywhere on the site.**
Every comparison question — Bank Statement against conventional, Asset
Utilization, No Ratio and DSCR — returns nothing. `K-1` appears zero times. This
is the largest gap and it maps almost one-to-one onto the P1 build list.

**The DFW pages are the model; the Austin pages are the legacy.** All nine
indexable DFW program pages open with a conditional direct answer beneath the H1.
One of eleven Austin pages does. The architecture you describe already exists in
miniature, on the older half of the site.

**Six Austin/DFW pairs are 53–67% identical, both halves indexable and
self-canonical.** You held `home-loans` out of the index at 84%.

**Florida exists only in structured data.** An `areaServed` array asserts 14
states across 23 pages. No visible page discusses Florida — the pattern your own
instruction bars.

## 2.1 On whether the dual structure is itself the obstacle

It is a headwind, not the wall, and the distinction changes the sequencing.

Splitting six topics across two URLs halves the authority on each and means
neither page reads as the definitive source for either the generic or the
market-qualified query. That cost is real.

But the nine missing answers are missing on **both** sides. A single unified site
would have the same gap. The structure costs concentration on the ten queries
partly answered; it costs nothing on the nine not answered at all.

So the plan fixes content before structure. Moving the shared generic explanation
out of both clusters into a market-neutral guidance layer drops the pair
similarity toward the range where both can rank independently **and** creates the
missing comparison content — one change, two problems. The commercial split is
treated as fixed throughout.

---

# 3. Decisions required

Ten in plan section 18. The three that gate the most work:

```text
A  The market-neutral guidance layer. Confirm that an indexable page which
   informs but captures no lead, and offers a labelled CTA into each market's
   own scenario review, is acceptable. If instead every indexable page must
   belong to one commercial side, the comparison content can only be built on
   one side and the other concedes those queries.

B  The six near-duplicate pairs. The proposal keeps both sides commercial and
   moves the shared explanation out to the guidance layer. Confirm, or state a
   different treatment.

C  Florida. No approved market list exists, so nothing is proposed or built.
```

The remaining seven: the Yelp rating currently on 19 indexable pages; the
`areaServed` schema; whether the approved claim strings should be enforced
verbatim, since `Serving Texas clients since 2002.` appears on no page in that
exact form; author attribution; an Austin market page; `/apply/` indexability;
and — structurally — whether lead routing should move from URL path to a market
the borrower declares on the form.

---

# 4. Against your acceptance criteria

```text
[x] Uses staging evidence, not generic SEO advice
[x] Distinguishes confirmed facts from assumptions and unknowns
[x] Treats DFW as a service market, not a branch or entity
[x] Retains the approved company claims without relabeling them unsupported
[x] Keeps company claims separate from your personal credential
[x] Built around borrower questions, not page count
[x] No thin city-swapped pages, no false office representation
[x] Conditional mortgage language throughout; no rate, APR, payment, LTV,
    FICO, reserve or eligibility claim in any draft copy
[x] Separates Bank Statement, Asset Utilization, No Ratio, DSCR and Super Jumbo
[x] States what to retain, rewrite, merge, hold noindex, and not build
[x] P0/P1/P2 sequence — 11 new pages, not the ~40 the template implies
[x] No-code plan with dependencies and approval gates
[x] Repeatable, privacy-safe measurement plan
[x] Only genuine decisions returned to you
```

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not compliance clearance and not production approval. No claim
is made that any recommendation in the attached plan will produce a ranking, an
AI citation, or a lead.
