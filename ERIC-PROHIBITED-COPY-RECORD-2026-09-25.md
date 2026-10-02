# Prohibited Copy — Correction, and the Before/After Record

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 25 September 2026
**Re:** Your §1 replacement wording — applied, plus a correction to the count I gave you

**Implemented in staging. Not published.** Build is green at 63 steps, 33 pages,
1,810 internal links resolving, 51 of 51 P0 checks passing.

---

# 1. Correction

**I told you there were six occurrences on four pages. There were fourteen, on
six pages — including the homepage.**

The number came from `sync-austin-openings.js`, which inventories only the seven
pages that pass owns. I reported its output as a site-wide figure. It never
looked at the homepage, `/apply/`, or any DFW page, so it could not have found
what was there.

You issued replacement wording on the strength of that count. Here is what a
full sweep of every shipped page actually found.

```text
PAGE                                               VISIBLE OCCURRENCES
/                          (homepage, INDEXABLE)   4   <- never scanned before
/self-employed-mortgage-loans/        INDEXABLE    5
/bank-statement-loans/                INDEXABLE    2
/how-self-employed-borrowers-qualify/ INDEXABLE    1
/apply/                               noindex      1   <- never scanned before
                                                  --
                                                   13 replacements, 14 occurrences
```

Two things in that list matter more than the count.

**The homepage carried a hero-level claim.** Directly beneath "We Say Yes When
Others Say No" sat the line **"No Tax Returns Required"** — the barred phrase, in
the most prominent position on the most important page on the site.

**`/self-employed-mortgage-loans/` described No Ratio exactly the way your rules
prohibit by name.** The card was labelled "No Income Docs" and read *"No income
verification required. Qualify based on your assets, credit score, and down
payment — not your tax returns or income documentation."* That is the specific
description you have twice instructed us not to make.

---

# 2. Two matches that are NOT violations

Both contain a barred string inside a sentence that negates it. These are the
correction you mandated, not a breach of it, and they are left exactly as they
are:

```text
/texas/
  "No Ratio — an approach in which a debt-to-income ratio is not calculated in
   the usual way. It is not the same as no income verification, and it does not
   mean a borrower's finances go unreviewed."

/texas/dallas-fort-worth/no-ratio-mortgages/
  "Does No Ratio mean no documentation at all? No. A No Ratio review sets aside
   the personal income and debt-to-income calculation, not the rest of the file."
```

The gate that enforces this understands the difference, so a future pass cannot
"fix" the correction by deleting it.

---

# 3. Before / after — pages you addressed

Applied from your §1 concepts, rewritten to fit each sentence rather than swapped
mechanically, per your instruction.

## `/bank-statement-loans/`

```text
BEFORE  (H2)  No Tax Returns. No Problem.
AFTER   (H2)  When Tax Returns Do Not Reflect Your Business

BEFORE  (spec bullet)  No tax returns required
AFTER   (spec bullet)  Reviewed on bank statements rather than tax returns
```

The H2 was not in the list I gave you — it makes the same claim in different
words and was found by the full sweep. Flagged for your confirmation.

## `/self-employed-mortgage-loans/`

```text
BEFORE  Qualify using 12–24 months of personal or business bank statements — no
        tax returns required. Perfect for business owners who maximize deductions.
AFTER   A review of 12–24 months of personal or business bank statements may be
        worth exploring when tax returns do not fully reflect current business
        cash flow. It may be worth reviewing for business owners whose
        documentation does not fit a standard mortgage review.

BEFORE  (card label)  No Income Docs
AFTER   (card label)  Asset-Based Review

BEFORE  No income verification required. Qualify based on your assets, credit
        score, and down payment — not your tax returns or income documentation.
AFTER   A No Ratio review sets aside the personal income and debt-to-income
        calculation, not the rest of the file. Credit, assets, down payment,
        property type and loan purpose still apply.

BEFORE  (spec bullet, x2)  No tax returns required
AFTER   (spec bullet, x2)  Reviewed on bank statements or a CPA-prepared P&L

BEFORE  (spec bullet)  No income verification
AFTER   (spec bullet)  Debt-to-income ratio not calculated in the usual way
```

The No Ratio replacement deliberately mirrors the wording already approved and
live on `/texas/dallas-fort-worth/no-ratio-mortgages/`, so both markets describe
No Ratio the same way.

Your instruction not to repeat one sentence three times is honored: the three
"no tax returns required" instances were three different elements — a card
description and two spec bullets — and each took wording appropriate to its
element.

## `/how-self-employed-borrowers-qualify-for-mortgage/`

```text
BEFORE  Use 12–24 months of bank deposits to demonstrate income. No tax returns
        required. Best for business owners with strong cash flow.
AFTER   Use 12–24 months of bank deposits to demonstrate income. Some mortgage
        approaches may use documentation beyond a standard tax-return review,
        depending on the borrower, property, lender, and program.
```

Your §1 wording, verbatim.

---

# 4. Before / after — NEW SURFACES, pending your confirmation

Your response did not cover these because my count did not surface them. The
wording below is built from the same approved concepts, but **it is public copy
on pages you have not reviewed for this purpose.** Nothing publishes until you
confirm or replace it.

## `/` homepage

```text
BEFORE  (hero, under "We Say Yes When Others Say No")
        No Tax Returns Required
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
```

## `/apply/` (noindex, follow)

```text
BEFORE  No tax returns required for self-employed
AFTER   Documentation approaches beyond tax returns for self-employed borrowers
```

## 4.1 One wording change caught only by reading the rendered page

The hero replacement went through two versions. The first read "Documentation
Beyond Tax Returns", which is clean on its own. In the extracted text stream it
sits immediately after the line above it and reads:

```text
"We Say Yes When Others Say No Documentation Beyond Tax Returns"
```

Visually they are two separate elements and a person sees two lines. A crawler
and an AI assistant read the concatenated text, and that reads as a "no
documentation" claim. The wording was changed to the version above, which cannot
collide. **Worth noting because it is a failure mode no phrase-level check
catches** — every individual string was clean.

---

# 5. Internal review comments removed from the served HTML

The pages carried 24 HTML comments of this form:

```html
<!-- REVIEW: Eric: "no tax returns required" is barred (04-1099-update.md:57) -->
```

They were shipping to production on nine pages. They are invisible to a reader
but they are in the served source, they quote the barred phrase verbatim, and
they expose internal review chatter publicly. All 24 are removed, and the gate
fails the build if one returns.

They also caused a real defect: several sat **inside** the sentences being
replaced, splitting them, so the first run of the replacement pass silently
matched nothing on the long sentences while reporting success on the short ones.
Comments are now stripped before any text edit.

---

# 6. Verification

```text
Barred phrases in visible copy, every shipped page ......... 0
  (the two mandated negations in §2 excluded by design)
Internal REVIEW comments in served HTML .................... 0
Build ...................................................... 63 steps, all green
Pages / links .............................................. 33 / 1,810 + 65 anchors
Indexing ................................................... 23 indexable, 10 held back
P0 verification checks ..................................... 51 of 51 pass
Seller financing ........................................... untouched; /home-loans/
                                                              H1 still "Home Loan
                                                              Solutions"; no page
                                                              under §2 was edited
```

None of the edited pages contains seller-financing language, so your §2 exclusion
was not engaged by any of this work.

---

# 7. What I need from you

```text
1  CONFIRM OR REPLACE the five NEW SURFACE replacements in §4 — four on the
   homepage, one on /apply/. These are the only items where I have written
   public copy for pages your response did not cover.

2  CONFIRM the /bank-statement-loans/ H2 replacement in §3 — "No Tax Returns.
   No Problem." was not in the list I gave you.

3  NOTE the corrected scope in §1. If the count changes what you want done,
   say so before anything publishes.
```

Still outstanding from your §4 and §7, unchanged by this work: the GoHighLevel
custom fields must exist before intake test submissions, and legacy redirect and
`/index.html` verification can only be done after deployment.

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not compliance clearance and not production approval. The
replacement wording in §4 has not been reviewed by you and is implemented in
staging only. No production deployment has been made and none is authorized.
