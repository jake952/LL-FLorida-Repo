# Copy restrictions — where they come from and what they say

**Written 3 September 2026.** This file did not exist before, and that was the
gap: every rule below arrived as a **handoff from Eric pasted into a chat**
session and was never saved to the repo, so `grep` found nothing here and the
only durable copy was a session transcript. The handoffs themselves are now in
`.claude/eric-handoffs/`.

| File | Arrived as | Covers |
|---|---|---|
| `00-project-brief.md` | the original project brief | the landing-page program |
| `01-bank-statement.md` | "new handoff from Eric" | `/texas/dallas-fort-worth/bank-statement-mortgages/` |
| `02-1099-create.md` | "create that page using this handoff" | `/texas/dallas-fort-worth/1099-mortgages/` (build) |
| `03-self-employed.md` | "update the self employed mortgage landing page with this handoff" | `/texas/dallas-fort-worth/self-employed-mortgages/` |
| `04-1099-update.md` | "update the 1099 mortgage landing page with this handoff" | the 1099 page (revision) |

None of this comes from a general compliance policy and none of it is
inferred. Every quotation below is Eric’s wording, cited to file and line.

---

## 1. The prohibited-claims list

Stated four times, and **the wording differs each time**. That difference
matters, so all four are reproduced rather than merged into one list.

`01-bank-statement.md:826`
> - [ ] No “no tax returns required,” “gross deposits,” “no ratio,” or “guaranteed approval” claims.

`03-self-employed.md:24`
> - Do not state “no tax returns required,” “qualify on gross deposits,” “guaranteed approval,” “ideal for,” or similar universal-product claims.

`03-self-employed.md:1105`
> - [ ] No unsupported “no tax returns required,” “gross deposits,” “no ratio,” or “guaranteed approval” claims.

(The word *unsupported* is Eric’s, not emphasis added.)

`04-1099-update.md:57-68` — a section headed simply **Do not use**

```text
All 1099 income types accepted
Guaranteed approval
No income documentation
No tax returns required
Qualify on gross income
Close in a specified number of days
Rate, APR, payment, or fee claims without separately approved advertising disclosures
```

**Read the qualifier.** Two of the four say *unsupported* claims, and one says
*or similar universal-product claims*. These are not blacklisted strings — they
are prohibited **promises**. That distinction decides how much of the main
site’s copy can be adapted, and it is the thing I got wrong when I described
this as a flat conflict.

## 2. Categorical claim bans

`01-bank-statement.md:825`
> - [ ] No approval, rate, payment, closing-time, credit-score, down-payment, loan-limit, reserve, or eligibility promises.

`03-self-employed.md:1104`
> - [ ] No approval, rate, payment, close-time, credit-score, maximum-loan, minimum-down-payment, reserve, or eligibility promises.

`02-1099-create.md:1056`
> - [ ] No unapproved program claims, rates, terms, payment amounts, approval promises, or deadline claims are introduced.

`04-1099-update.md:930`
> - [ ] No rates, APR, payment, fees, or other advertising trigger terms are added without separate approval and disclosures.

## 3. Do not invent business facts

`04-1099-update.md:887`
> Use only approved organization data. Do not invent business locations, NMLS IDs, licenses, ratings, service areas, or office hours.

The same rule appears at `01-bank-statement.md:809`, `02-1099-create.md:971`
and `03-self-employed.md:1064`. `03-self-employed.md:1137` extends it to schema:

> - [ ] No schema contains unsupported ratings, service areas, licenses, or financial claims.

## 4. The form must not collect sensitive data

`04-1099-update.md:935`
> - [ ] Form does not request sensitive documents, account numbers, or identifying financial data.

`02-1099-create.md:460`
> - Never send sensitive document uploads through this form.

`02-1099-create.md:437`
> - Include only legal/consent language supplied by the approved CRM/compliance implementation. Do not invent TCPA, SMS, or consent text.

## 5. No automated decisions

`04-1099-update.md:941`
> - [ ] No form response triggers an automatic decline, eligibility result, or discouragement.

`03-self-employed.md:968`
> - Do not use self-employment history, available funds, equity, or other form fields as an automatic decline or eligibility decision.

## 6. Analytics and attribution

`02-1099-create.md:895`
> - Never include PII in analytics event labels, URLs, browser console logging, or client-side error reporting.

`02-1099-create.md:890`
> **Rule:** Never overwrite the visitor’s self-reported `discovery_source` with analytics attribution.

## 7. Local-language rule

`04-1099-update.md:30`
> Do not use **DFW** or **Dallas–Fort Worth** in routine CTA labels, form headings, helper text, generic section headlines, or closing CTA language.

Market language belongs in the URL, title tag, meta description, H1, one
natural hero mention, and one approved service-area statement. The preferred
CTA is `START A SCENARIO REVIEW` (`01-bank-statement.md:39`).

## 8. CTA hierarchy

`04-1099-update.md:911`
> - Do not use a “Start Application” CTA as the primary interaction on this page; use the scenario-review form.

---

# 9. What Eric already told us to write instead

This is the part that was missed. **Eric did not only ban phrases — he supplied
approved replacements.** `04-1099-update.md:957` carries a
"Production-to-new-page changes" table mapping the live site’s copy to
compliant copy, row by row:

| Existing production element | New page treatment |
|---|---|
| `Without requiring full tax returns` | `1099 income may be reviewed without full tax-return documentation` |
| `We average your 1099 earnings over 1–2 years` | `One or two years of 1099 income history may be considered` |
| `All 1099 income types accepted` | `Multiple 1099 income sources may be considered` |
| `$500K to $20M` | Approved Program Highlight, paired with required qualifier |
| `20% or more down payment` | Approved Program Highlight, paired with required qualifier and disclosure review |
| `Competitive rates via lender volume` | `Competitive pricing through Leahy Lending’s lender relationships` |
| `Who This Program Serves` | Program Highlights plus professional examples |
| `Start Application` | `Start a Scenario Review` |

The pattern is consistent: a definite claim becomes a conditional one ("may be
considered", "may be reviewed"), and a figure keeps its qualifier rather than
being deleted outright.

## 9.1 "No Ratio" — already answered

`03-self-employed.md:26`
> - Use “asset-utilization review” or “asset-utilization mortgage options” for consumer-facing copy. Avoid “no ratio” on this page.

Note the scope in Eric’s own words: *on this page*. The restriction is scoped
to consumer-facing copy, the approved alternative is
**asset-utilization**, and Eric supplied it himself. A "No Ratio" program page
therefore does not need a new naming decision — it needs this label.

### OWNER DIRECTION — 14 September 2026

Eric Bennett confirmed, in his review of the DFW homepage staging build, that
the line above was **page-specific guidance for the Asset Utilization page and
not a sitewide prohibition**. That is his own characterisation of it, not an
inference drawn here.

> No Ratio is an owner-approved public Leahy Lending product name.
> Asset Utilization remains a separate owner-approved public product name.
> Guidance to avoid "No Ratio" applies only where Eric has explicitly made that
> page-specific direction.

**`No Ratio Mortgage Options` may be used publicly** — homepage, the No Ratio
page, navigation, mobile navigation, footer program list, related-program
cards, FAQ content, internal linking, CRM program-interest values, sitemap
entries and SEO metadata.

**Asset Utilization is not replaced by No Ratio on its own page** and is not to
be, unless Eric directs that change specifically.

#### Owner approval of a product LABEL is not compliance approval of a CLAIM

These remain prohibited unless Eric separately approves them in writing:

```text
No income required
No documentation required
No tax returns required
Qualify on gross deposits
Guaranteed approval
Easy approval
Approval regardless of income
```

Product-specific rates, APRs, payments, down payments, LTVs, credit-score
minimums, reserve requirements, interest-only terms, cash-out limits, occupancy
rules and lender-specific underwriting requirements all still require the
applicable product, compliance or legal review before they may appear.

What changed in the build:

| Where | Was | Now |
|---|---|---|
| `build-programs.js` `BANNED` | "no ratio" refused the build | removed |
| `CLAIM_PATTERNS` in `clone-common.js`, `build-dfw-home.js`, `build-austin-programs.js` | stamped a `<!-- REVIEW -->` marker beside every use | removed — it was marking owner-approved copy |
| `/texas/dallas-fort-worth/no-ratio-mortgages/` | did not exist | live page, `TX-DFW-NORATIO-01` |
| Home footer "No Ratio Loans" row | deleted at build time as barred | relabeled "No Ratio Mortgage Options", points at the page |

---

## 9.2 Super Jumbo — the approved wording

Owner-approved, Eric Bennett, 14 September 2026. **These two sentences, exactly:**

```text
Available Super Jumbo mortgage programs up to $5 million.

Case-by-case financing paths up to $20 million may be available.
```

They may be used together or singly. They may **not** be shortened, expanded,
resequenced or paraphrased — in particular, dropping "Available",
"Case-by-case" or "may be available" removes the conditional nature of the
statements, which is what makes them publishable.

The supporting qualifier remains approved for use near them:

```text
Loan amount, documentation, property type, credit, assets, down payment,
pricing, and other requirements vary by borrower, lender, and program.
```

The self-employed block's badge, `UP TO $5M / AVAILABLE PROGRAMS`, is
owner-approved as a badge by the homepage handoff, section 7.

**Before this direction the amount statement existed in nine paraphrases** across
the homepage, the Super Jumbo page, two card grids, a FAQ answer, two meta
descriptions and a supporting sentence, and the staging report wrongly described
them as verbatim. They are now written once in `_build/approved-copy.js`, every
page reads them from there, and `_build/check-approved-copy.js` fails the build
on any other form.

Excluded from Super Jumbo copy unless Eric directs otherwise: NQM Funding, a
$3.5 million minimum, primary-residence-only or owner-occupied-only language,
LTV percentages, credit-score thresholds, reserve requirements, interest-only
availability, cash-out limits, and any rate, APR, payment, pricing, savings or
exclusivity claim.

---

## 9.3 What the automated gates do and do not do

This statement belongs in the build, compliance and go-live documentation, and
is repeated in each:

```text
Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do
not independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.
```

A passing build is not a compliance review and must not be reported as one.

---


# 10. Why the rule exists

An earlier published generation of the site carried the phrase. In
`Downloads/leahy-lending-siteground-v2/leahy-lending/`, "no tax returns
required" appears in `index.html`, `loan-programs.html`, `refinance.html` and
`crypto-home-loans.html`. The three DFW landing pages were written without it
and verified clean. That is the standard the remaining pages have to meet.

---

# 11. Applying this to the ten remaining program pages

"Adapt the main site’s existing page copy" and these rules are **compatible**,
by section 9’s method: keep the structure and the program explanation, convert
every definite claim into a conditional one, and either drop a figure or pair
it with its qualifier. What cannot be done is transcribing the main site
verbatim — it carries rate figures, dollar caps and documentation-waiver claims
that Eric’s own checklists reject.

Two things remain genuinely open, and neither is a naming question:

1. **Dollar and down-payment figures.** Eric’s table does not delete
   `$500K to $20M` or `20% or more down payment` — it routes them to "Approved
   Program Highlight, paired with required qualifier and disclosure review."
   Someone has to say which figures are approved for each of the ten programs,
   and supply the qualifier text.
2. **Rate and pricing language.** `04-1099-update.md:930` requires "separate
   approval and disclosures" for any rate, APR, payment or fee term. Until
   those disclosures exist, the ten pages carry no pricing language at all.
