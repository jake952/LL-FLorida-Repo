# Florida case-study intake

Generated 2026-10-02 by `_build/build-case-study-intake.js`. Do not edit by hand; edit `_build/case-studies.js` and rebuild.

## Why this exists

"At least two compliant case studies are live" is an acceptance criterion in the expert-entity handoff. It is the largest one still unmet, and the only one that cannot be met by writing: a case study is a record of a closed file, and inventing one is the failure the handoff’s risk table calls manufactured authorship.

The Florida pages already carry **illustrations**. Those are labelled as not client files, twice each, and describe how a review would proceed. They are not case studies and must never be presented as one. A case study says this happened. An illustration says this is how the thinking goes.

## Status

- Studies in the library: **0**
- Florida is **not approved** for publication, so no study may go live yet even once written
- `check-case-studies.js` refuses any study missing a required field, borrower permission or compliance review, and refuses any page that reads as a closed Florida file while the library is empty

## Step 1 — audit intake

Record these for each closed file considered. This is the audit, not the publication: recording a file here commits nothing.

| # | Field | Value |
|---|---|---|
| 1 | `metroAndSubmarket` | |
| 2 | `closingDateRange` | |
| 3 | `borrowerType` | |
| 4 | `propertyTypeAndOccupancy` | |
| 5 | `loanPurposeCategory` | |
| 6 | `documentationProblem` | |
| 7 | `programsCompared` | |
| 8 | `selectedPath` | |
| 9 | `materialObstacle` | |
| 10 | `ericInvolvement` | |
| 11 | `generalOutcome` | |
| 12 | `existingReview` | |
| 13 | `permission` | |
| 14 | `complianceReview` | |

The last two decide everything. A file with no borrower permission can still be used if it can be anonymized so that nobody is identifiable; a file with neither permission nor a workable anonymization cannot be used at all. Compliance review is separate from Eric’s review and is not satisfied by it.

## Step 2 — which files are worth the first two slots

Any true study is a good study. These are the ones that would also move the measurement panel, which is what the first two slots are for.

| Priority | Category | Panel queries it would support |
|---|---|---|
| 1 | Self-employed borrower with substantial business deductions | `q01` best mortgage lender for self-employed borrowers in Florida<br>`q04` mortgage when tax returns understate my income Florida<br>`q05` business write-offs reduced my income can I still get a mortgage Florida |
| 2 | Borrower with multiple businesses or entities | `q06` mortgage for someone with multiple businesses Florida<br>`q12` Florida mortgage expert for K-1 income and distributions |
| 3 | 1099 consultant or contractor | `q08` 1099 income mortgage Florida |
| 4 | Executive with bonus, commission or RSU income | `q11` super jumbo mortgage with complex income Florida |
| 5 | High-net-worth borrower using eligible assets | `q09` asset utilization mortgage Florida |
| 6 | Investor using DSCR | `q10` DSCR loan for investment property Florida |
| 7 | High-balance or Super Jumbo borrower | `q11` super jumbo mortgage with complex income Florida |
| 8 | Borrower previously declined under a conventional approach | `q03` non-QM mortgage lender Florida<br>`q04` mortgage when tax returns understate my income Florida |
| 9 | Construction or custom-home borrower | — no panel query targets this directly |

## Step 3 — what a published study must contain

All 10 are required. A study missing the documentation problem or the options considered is a testimonial with extra steps; one missing the disclosures is an advertising problem.

1. `market`
2. `borrowerProfile`
3. `occupancy`
4. `documentationProblem`
5. `optionsConsidered`
6. `approachSelected`
7. `analysisIssue`
8. `ericRole`
9. `outcome`
10. `disclosures`

Do not publish addresses, identifiable borrower details, or precise financial facts without written approval.

## Step 4 — adding one

Append an object to `STUDIES` in `_build/case-studies.js` carrying every field above plus `slug`, `marketKey`, `permission` (`granted`) or `anonymized` (`true`), and `complianceReview` (`approved`). The gate will tell you what is missing.

## Controls this does not satisfy

Automated content and build controls help enforce approved copy, structural requirements, placeholder handling, and selected prohibited phrases. They do not independently verify substantiation, product availability, legal compliance, privacy compliance, licensing requirements, testimonial permissions, or state-specific mortgage-advertising obligations.
