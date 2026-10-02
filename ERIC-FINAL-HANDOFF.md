# DFW Staging — Decisions Needed Before Launch

**To:** Eric Bennett
**From:** Jake Bennett
**Date:** 18 September 2026
**Supersedes:** Revision 4 (17 September), Revision 3, and Addendum B

**Status:** 16 DFW pages built. All `noindex`. Nothing published.

---

## What this document is

The build is finished. This is the copy, claims and compliance work that is
still open, and nothing else — CRM, analytics and publishing mechanics are being
handled separately and are not asked about here.

Two labels are used throughout and the difference matters:

- **Owner-approved** — you decided it
- **Owner-directed** — Jake asked for it and it is built, but it has not been
  through product, compliance, legal or privacy

**Part 1** is the questions. **Part 2** is the standing register of claims
shipping without your approval. **Part 3** is copy that was never supplied.
**Part 4** is what changed since Revision 4, for context.

---

# Part 1 — Decisions needed

## 1.1 Section 7 of the Self-Employed Hub handoff is reversed

§7 required that the 1099 related card **not** be titled "1099 Income Loans", on
the grounds that Form 1099 is documentation rather than a single product.

The 1099 page is now headed "1099 Income Loans in Dallas–Fort Worth", and every
product across the suite is now named after the page it opens. The card follows
the page.

This is owner-directed and reverses a written instruction. It is declared on
every build rather than settled quietly.

> **Accept the reversal, or restore §7's wording?** Restoring it means the page
> heading changes too, and the naming rule gains an exception.

## 1.2 "Do Not Sell My Personal Information" points at a general rights section

Thirteen pages carry that link. It previously resolved to nothing and landed the
reader at the top of the privacy policy. It now points at **section 6, "Your
Rights and Choices"** — the nearest existing section, and where the policy's
"do not sell" statements already sit.

The policy has no dedicated CCPA/CPRA section. **No policy text was written for
this**; composing one is legal work.

> **Is section 6 the correct destination, or does the policy need a dedicated
> Do Not Sell section?** If a section is added, the link moves to it.

**The Austin pages carry the same link with the same gap**, pointing at the
Austin privacy page. That page is outside this build's scope. Flagged so it is
not missed.

## 1.3 Two compliance markers on the Home Loans page

Both are pre-existing clone copy, not written for this build, and both were
carried through untouched:

| Marker | Copy |
|---|---|
| Unsupported superlative | "One of the only lenders in Texas offering Buy Before You Sell at loan amounts up to $5 million." |
| Dollar cap needs an approved highlight and qualifier | The $5 million figure in the same card |

§4.2 bars exclusivity claims on the Super Jumbo page. This one sits on a clone
and was not modified.

> **Approve, amend, or remove?**

## 1.4 "Leahy Lending offers" scoping

The phrase is currently barred only inside a sentence that states an amount,
which leaves the Home Loans hero as it was captured.

> **Was the intent to bar the phrase outright?** If so, that hero needs new
> copy.

## 1.5 Breadcrumb schema

BreadcrumbList stays out while there are no visible breadcrumbs, because §15
permits only schema that is truthfully visible on the page.

> **Are breadcrumbs wanted?** If so, that is a template and design decision
> first, and the schema follows.

---

# Part 2 — Claims shipping without your approval

These are live on staging today. Each is owner-directed, listed in the build's
own register, and printed on every run.

| Claim | Where |
|---|---|
| "We Say Yes When Others Say No" | Every DFW page — marquee |
| "Leahy Lending Says Yes" | Every DFW page — marquee |
| "Since 2002" | Every DFW page — marquee |
| "OVER $1 BILLION IN LOANS FUNDED" | Every DFW page — marquee |
| "DALLAS–FORT WORTH'S TRUSTED MORTGAGE SPECIALIST" | Every DFW page — marquee |
| "258 Five-Star Reviews" | Market home |
| Customer testimonial referencing a $1.4M home | Market home |
| "No Tax Returns Required" | Market home |
| 1099 card titled "1099 Income Loans" | Self-Employed Hub — see 1.1 |

**The marquee is the largest exposure.** Five of the nine sit in it, on all
sixteen pages. It was removed earlier in the build and restored by owner
direction.

> **Each needs approving, amending or removing.**

## Substantiation still outstanding

| Claim | What is missing |
|---|---|
| Programs up to $5 million; case-by-case paths up to $20 million | The **wording** is owner-approved. The availability it asserts is not evidenced |
| "25+ Years of Experience" (footer, hero tile) | Not substantiated. §1.3 says no public tenure statement is approved for production without source documentation and entity attribution |
| "Austin's Trusted Lender for Over Two Decades" (About page) | Same. Three further instances on that page, all §2.10 out of scope |
| "258 five-star reviews" | No source supplied |
| "14 states licensed" | No source supplied |

## Never drafted

| Item | Note |
|---|---|
| NMLS, Equal Housing Opportunity, licensing and service-area statements | §5.3. Service-area metadata is deliberately withheld from structured data pending this |
| State-specific mortgage advertising disclosures | Not assessed anywhere in this build |
| Form consent, call/text consent, privacy notices | The forms collect contact details; the consent and notice treatment has not been reviewed |
| Product availability and lender-specific content | §5.3. Which programs are actually offered, to whom, and on what terms |

---

# Part 3 — Copy that was never supplied

**Super Jumbo handoff, items 1–6.** That handoff arrived beginning mid-item. §3
supplied the page structure, which is built. The Final Checklist's **Full
Documentation card** was never specified, and no copy was invented for it.

> **The card needs copy, or a decision to drop it.**

---

# Part 4 — What changed since Revision 4

Context only. Nothing here needs a reply except where it points at Part 1.

**Product naming is now consistent.** Every product is called what its own page
calls it — in card headings, related-path cards and hero eyebrows. Previously a
card reading "Bank Statement Mortgage Options" opened a page headed "Bank
Statement Loans in Dallas–Fort Worth". Ordinary English was left alone: "Ready
to explore your mortgage options?", "Questions About Mortgage Options", "Not
Sure Which Mortgage Path Fits?". So was anything not ours to rename — "Kyber
Mortgage Corporation" is the licensed entity, and "Complex Compensation Mortgage
Guidance" is required positioning quoted from the RSU handoff. **One consequence
is 1.1.**

**Navigation.** The Self-Employed tab now reads "Self-Employed". Only the tab —
the hub page keeps "Self-Employed Loan Options" in its heading, title, structured
data and every card that names it.

**The Do Not Sell link now reaches a section.** See 1.2.

**Home Loans.** Its hero now matches the program pages, and its five programme
cards use the same card format as the newer pages. No copy was rewritten, and
the two markers in 1.3 are untouched.

**Calculator.** An optional "loan type you would like to discuss" question was
added to both calculator forms by owner direction. It can be skipped.

**Presentation corrections.** The sticky bottom bar, the Self-Employed tab
alignment, duplicated cards on the Bank Statement page, and a row that sat
left-aligned instead of centred. No copy, claim, figure or link target changed
in any of them.

---

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.
