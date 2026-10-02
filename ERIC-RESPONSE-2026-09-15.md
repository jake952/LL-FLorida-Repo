Response to Consolidated Handoff — DFW Staging Build

**To:** Jake Bennett and Claude Code implementation workflow  
**From:** Eric Bennett  
**Date:** September 15, 2026  
**Subject:** Owner decisions, corrections, and next-step direction

Thank you. The consolidated format is useful, especially the separation between decisions needed, unapproved judgment calls, incomplete work, external dependencies, and verification limits.

All decisions explicitly made by Eric Bennett in the original handoffs, follow-up directions, and this response are **owner-approved for implementation**. They do not need to be reframed as pending owner approval. Automated controls are implementation safeguards only; they do not replace product, legal, privacy, licensing, or compliance review.

Nothing moves from staging/noindex to production/indexable status until the remaining launch controls are resolved through the appropriate process.

---

# 1. Owner Decisions

## 1.1 Super Jumbo wording — one approved standard

Use the following wording everywhere it appears in public-facing DFW content:

```text
Available Super Jumbo mortgage programs up to $5 million.

Case-by-case financing paths up to $20 million may be available.
```

This replaces every other variation listed in Section 1.1 of the consolidated handoff, including versions that use:

```text
may support loan amounts
customized financing paths
customised financing paths
larger requests
larger loan amounts
through lender relationships and individual review
Leahy Lending offers
```

Apply this exact approved copy across all relevant DFW locations, including:

```text
Homepage
1099 Program Highlights
RSU related cards
Self-Employed Hub cards and prose
Self-Employed Hub FAQ
Super Jumbo page
Asset Utilization high-balance bridge
Bank Statement high-balance bridge
Any related cards
Forms and routing copy where loan-amount language is visible
SEO copy and metadata where this claim is used
Structured data only where truthful, visible, and otherwise appropriate
```

Do not describe any alternate wording as “verbatim.”

The supporting qualifier remains approved where the Super Jumbo amount statements appear:

```text
Loan amount, documentation, property type, credit, assets, down payment,
pricing, and other requirements vary by borrower, lender, and program.
```

## 1.2 Footer wording

Do not make further global footer-copy changes at this time.

Retain the currently shipping Hub footer wording in staging only, but keep the footer claims in `PUBLIC-CLAIMS.md` and maintain the production-review flag for the following until substantiated and approved for public launch:

```text
25+ Years in Business
Any statement of years in business or “Since 2002”
Any superlative such as “premier mortgage lender”
Any “we say yes when others say no” language
```

Do not restore the RSU footer wording. Do not use “Since 2002” in place of “25+ Years in Business” without further owner direction and evidence.

## 1.3 Tenure statement

No public tenure statement is approved for production at this time.

Keep the existing staging-only footer treatment if needed for layout continuity, but retain noindex and the public-claim flag. Before production launch, provide the exact source documentation and entity attribution necessary to substantiate one final tenure statement.

Until then, do not add or repeat either:

```text
25+ Years in Business
Since 2002
```

in new page copy, metadata, schema, ads, cards, or forms.

## 1.4 Superlative footer claim

No superlative claim is approved for production at this time.

Do not add, restore, or expand language such as:

```text
The premier mortgage lender
Best
Leading
Top
Unmatched
We say yes when others say no
```

The footer remains a global-content review item. Keep it tracked separately from the DFW page implementation work.

## 1.5 H1 and title-tag styling

Use the following final styling for consistency:

```text
Asset Utilization
H1: Asset Utilization Mortgages in Dallas–Fort Worth
Title tag: Asset Utilization Mortgages in Dallas–Fort Worth | Leahy Lending

Bank Statement
H1: Bank Statement Mortgages in Dallas–Fort Worth
Title tag: Bank Statement Mortgages in Dallas–Fort Worth | Leahy Lending
```

Use “Mortgages,” not “Mortgage Options,” for these two pages in the visible H1 and title tag.

Do not make unrelated title-tag changes without documenting them in the staging change log.

## 1.6 Breadcrumbs and BreadcrumbList schema

Do not add invisible BreadcrumbList schema.

Leave BreadcrumbList schema out while visible breadcrumbs are absent from the shared template. Do not add a visible breadcrumb bar sitewide as part of this work.

If visible breadcrumbs are proposed later, bring a separate template/design recommendation for approval before implementation.

## 1.7 Omitted footer links

Confirm the omissions.

Do not add duplicate footer links for Profit & Loss or Bridge / Investor Financing while the destinations remain consolidated into existing pages:

```text
Profit & Loss Mortgage Options
Bridge / Investor Financing
```

Do not render dead links. Do not create duplicate footer entries that point to a destination already represented in the list.

## 1.8 1099 footer label

Use this final footer label:

```text
Mortgage Options for 1099 Income
```

Use it consistently in the footer program list and related navigation where that specific label is needed.

---

# 2. Approval of Prior Staging Changes

The following changes described in Section 2 of the consolidated handoff are approved for staging implementation, subject to the guardrails below.

## 2.1 Route changes

Approve these routes and their one-hop redirects, with query strings and UTMs preserved:

```text
/texas/dallas-fort-worth/rsu-bonus-commission-income/
/texas/dallas-fort-worth/dscr-investor-loans/
```

Keep the prior routes as 301 redirects to the approved routes:

```text
/texas/dallas-fort-worth/rsu-bonus-commission-mortgages/
/texas/dallas-fort-worth/dscr-investor-mortgages/
```

Continue to ensure canonical URLs, `og:url`, sitemap entries, internal links, and title tags use the approved canonical routes.

## 2.2 Bank Statement and Asset Utilization hero CTAs

The decision to remove a hero CTA that jumps to a form already visible in the hero is approved.

The required primary CTA may appear once below the high-balance bridge, using the approved DFW labels:

```text
DISCUSS YOUR DFW BANK STATEMENT SCENARIO →
DISCUSS YOUR DFW ASSET UTILIZATION SCENARIO →
```

Do not add a redundant hero anchor solely to satisfy an earlier handoff string requirement. Update the relevant handoff/gate record to reflect this approved UX decision.

## 2.3 Analytics event names

Approve the suite-wide analytics naming correction:

```text
scenario_form_start          -> hero_form_start
scenario_form_step_complete  -> hero_form_step_complete
```

Maintain the existing shared submit, success, and error events unless a separate instrumentation plan changes them:

```text
scenario_form_submit
scenario_form_success
scenario_form_error
```

Update the analytics inventory, GA4 configuration, dashboards, documentation, and any downstream routing/reporting that reference the old event names.

## 2.4 FAQ analytics payload

Approve removal of FAQ question text from analytics payloads.

Use only the minimum useful properties:

```text
faq_index
faq_id
expanded_state
```

## 2.5 WebPage structured data

Approve the addition of the `WebPage` node where it is generated from each page’s actual visible name, description, and canonical URL.

Using `FinancialService` as a more specific organizational type is acceptable where the data accurately represents the entity. Do not emit `Organization`, `FinancialService`, `Service`, `Audience`, `City`, `State`, `PostalAddress`, FAQPage, or any other schema simply because a template supports it; emit only maintained and truthful data.

## 2.6 No byline

Approve the decision not to add `Written by Leahy Lending`.

Do not add publisher or author bylines unless Eric directs it and it is consistent sitewide.

## 2.7 Market-name overrides

Approve the limited page-specific DFW overrides described in Section 2.7.

Use DFW/Dallas–Fort Worth framing where the approved handoffs explicitly require it, including the Super Jumbo, Asset Utilization, Bank Statement, and other designated DFW product pages.

Do not insert market names into form labels unless explicitly directed. Keep form labels functional and neutral.

## 2.8 Reveal-animation fix

Approve the responsive reveal-animation fix that removes horizontal scrolling below 860px.

Continue to verify no horizontal scroll at the required responsive widths.

## 2.9 Enumerated-review-factor copy

Approve adding the missing review factors to the Asset Utilization and Bank Statement pages, provided the language remains conditional and does not state or imply approval, guaranteed eligibility, or automatic qualifying-income treatment.

## 2.10 About-page tenure change

Revert the About-page change from `Since 2002` to `25+ Years in Business`.

Reason: no public tenure statement is approved for production at this time, and the About page is outside the DFW staging handoff scope. Restore the exact pre-existing live-clone content for now and keep the global tenure claim tracked in `PUBLIC-CLAIMS.md` for evidence and approval.

Do not modify the About-page H1 in this workstream.

## 2.11 CRM-field changes

Do not finalize the retirement of `investor_experience` or the addition of values/fields solely through the site build.

Maintain the current staging mapping only if it is necessary to preserve form behavior, but treat CRM schema changes as pending CRM-owner confirmation. Do not delete, retire, or repurpose a CRM field until the CRM owner confirms:

```text
Field existence
Field type
Allowed values
Workflow dependencies
Historical-reporting impact
Migration or backward-compatibility treatment
```

The `super_jumbo_loan_range` issue is correctly identified as a launch dependency. It must exist and be tested in the CRM before a form can rely on it.

---

# 3. Super Jumbo Handoff Correction

The Super Jumbo handoff was issued in full. Use the standalone owner-approved Super Jumbo page handoff as the source of truth for items 1 through 8.

Implement the following DFW page structure:

```text
Page URL
/texas/dallas-fort-worth/super-jumbo-mortgages/

Hero
SUPER JUMBO MORTGAGES IN DALLAS–FORT WORTH

High-balance amount module
Available Super Jumbo mortgage programs up to $5 million.
Case-by-case financing paths up to $20 million may be available.

Supporting qualifier
Loan amount, documentation, property type, credit, assets, down payment,
pricing, and other requirements vary by borrower, lender, and program.

Education sections
Who This May Help
Potential Qualifying Paths
How a DFW Super Jumbo Review Works

Related DFW paths
Bank Statement Mortgages in Dallas–Fort Worth
Asset Utilization Mortgages in Dallas–Fort Worth

Primary conversion path
Secure DFW Super Jumbo scenario-review form
```

Use these related-page destinations:

```text
/texas/dallas-fort-worth/bank-statement-mortgages/
/texas/dallas-fort-worth/asset-utilization-mortgages/
```

The Super Jumbo page must remain noindex in staging until applicable product/compliance/publishing controls are complete.

## Super Jumbo analytics

Avoid double-counting page views and form events.

Use shared page/form events with page-level properties where the suite already does so, rather than firing redundant page-specific duplicates. The analytics inventory must make the mapping explicit:

```text
page_type = super_jumbo
market = dallas_fort_worth
cta_location = hero | qualifying_paths | related_options | form
```

If the two Super Jumbo-specific CTA event names are not emitted because their interactions are captured through standardized CTA events, document the exact replacement event, trigger, and required properties in the analytics inventory.

---

# 4. Product and Content Rules Still In Force

## 4.1 No Ratio

No Ratio is owner-approved as a real Leahy Lending program and an approved public product name.

It may be used on the DFW homepage, the DFW No Ratio page, navigation, mobile navigation, footer program lists, FAQs, related cards, internal links, CRM program-interest values, sitemaps, and SEO metadata.

Asset Utilization remains a distinct approved product name. Do not replace it with No Ratio on the Asset Utilization page unless specifically directed.

Continue to exclude the following absent a separate owner/product/compliance approval:

```text
No income required
No documentation required
No tax returns required
Qualify on gross deposits
Guaranteed approval
Easy approval
Approval regardless of income
Rates, APRs, payments, down payments, LTVs, score minimums, reserves,
interest-only terms, cash-out limits, occupancy rules, or lender-specific
underwriting claims
```

## 4.2 Super Jumbo

Do not add or restore:

```text
NQM Funding
$3.5 million minimum
Primary-residence-only or owner-occupied-only claims
LTV percentages
Credit-score thresholds
Reserve requirements
Interest-only availability
Cash-out limits
Rates, APRs, payments, pricing, savings, or exclusivity claims
Through lender relationships and individual review
```

## 4.3 Borrower-facing standards

Across every DFW page:

```text
Use clear, non-misleading, conditional language.
Do not promise approval, eligibility, rates, terms, savings, or closing dates.
Do not state that deposits automatically equal qualifying income.
Do not state that assets automatically become qualifying income.
Do not imply that a visitor can qualify without underwriting.
```

---

# 5. External Launch Dependencies

These are not defects that code can solve. Keep them clearly identified as launch dependencies.

## 5.1 CRM requirements

Before production launch, the CRM owner must confirm and test all required fields, allowed values, mappings, and workflows. This includes, at minimum, fields implicated by the DFW forms:

```text
compensation_profile
variable_compensation_history
expected_rental_income
super_jumbo_loan_range
rental_strategy
documentation_path
home_loan_path
current_home_status
project_type
project_stage
investor_experience
program_interest
landing_page
```

No field should silently fail. Add an integration test or monitored submission path that confirms each field reaches the CRM with the intended key and value.

## 5.2 Analytics requirements

Update all GA4 configuration, dashboards, reports, and downstream consumers for the approved event-name changes.

Analytics payloads must not include:

```text
Name
Email address
Phone number
Property address
Estimated property value
Loan amount
Income data
Asset data
Account information
Social Security numbers
Free-text notes
Sensitive-document contents
```

## 5.3 Compliance, privacy, and publishing requirements

Before a production/indexability decision, confirm the appropriate review of:

```text
Product availability and lender-specific content
Loan-amount statements and public-claim substantiation
Rates, APRs, payments, terms, and trigger terms, if later added
NMLS and Equal Housing Opportunity treatment
Licensing and service-area statements
Form consent and call/text consent, if applicable
Privacy notices and data storage/routing
Testimonials, review content, ratings, and review counts
State-specific mortgage advertising disclosures
Canonical, indexing, and production-release settings
```

---

# 6. Placeholder and Indexing Rules

Keep all staging pages `noindex`.

Use the following implementation standard:

```text
Staging
- May render unresolved content only for internal review.
- Must remain noindex.
- Must clearly distinguish unresolved placeholders from approved public copy.

Production/indexable deployment
- Must fail or block promotion if unresolved placeholders remain.
- Must not expose internal placeholder tokens to consumers.
```

Do not publish review ratings, review counts, licensed-state counts, testimonials, or any other unverified proof-point claims until they are substantiated and approved.

---

# 7. Required Documentation Updates

Please update the deliverables as follows.

## 7.1 Consolidated handoff

Revise the consolidated handoff to reflect the owner decisions in this response, especially:

```text
One approved Super Jumbo wording
Approved No Ratio program name
Approved routes and staging UX changes
No invisible BreadcrumbList schema
Confirmed omitted footer links
Final 1099 footer label
About-page tenure change reverted
CRM schema changes pending CRM-owner confirmation
Full Super Jumbo handoff available and controlling
```

## 7.2 Authority language

Use these status labels throughout documentation:

```text
Owner-approved
Implemented in staging
Pending product/compliance/legal/privacy review
Pending CRM-owner confirmation
Launch dependency
Proposed future enhancement
```

Do not characterize decisions as an individual developer’s “ruling” or “supersession.”

## 7.3 Change log

Maintain a separate staging change log for all work beyond the original handoffs. For each change, include:

```text
Change
Reason
Affected URL(s) or component(s)
Current staging status
Revert path
Owner approval status
Outstanding review or dependency
```

## 7.4 Claim inventory

Keep `PUBLIC-CLAIMS.md` current. For every visible public claim, provide:

```text
Exact wording
Page and component location
Claim type
Evidence/source location
Owner
Approval status
Production status
```

---

# 8. Delivery Requested Before Production Review

Return the following after applying this direction:

1. Revised consolidated handoff.
2. Updated public-claim inventory.
3. Updated CRM field/mapping inventory, including confirmed versus pending fields.
4. Updated analytics-event inventory showing event name, trigger, page/context properties, and restricted-data confirmation.
5. Updated route/redirect/canonical/sitemap inventory.
6. Separate staging scope-change log with revert paths.
7. Screenshots or review links for desktop, tablet, and mobile for the DFW homepage plus every new or rebuilt DFW program page.
8. A concise list of all remaining production-launch blockers, grouped by owner: product, compliance/legal, privacy, CRM, analytics, design/content, and publishing.

---

# Final Direction

Proceed with the approved DFW architecture, approved No Ratio program positioning, approved DFW routes, and the single approved Super Jumbo statement above.

Keep the build in staging/noindex. Do not publish unresolved claims, ratings, review counts, testimonials, state-license counts, unsubstantiated tenure claims, superlatives, or unreviewed form/privacy/licensing content. Automated gates should continue to enforce approved copy and structure, while the remaining external reviews and evidence requirements are resolved through the proper owners.
response-to-jake-consolidated-dfw-staging-handoff (1).md
Displaying response-to-jake-consolidated-dfw-staging-handoff (1).md.