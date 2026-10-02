# Deployment / QA Log — Production Lead-Routing Verification

**Date:** 27 September 2026
**Scope:** Eric §7 — test evidence preserved prior to synthetic record deletion
**Status:** EVIDENCE PRESERVED · records cleared for deletion

---

## Purpose

Eric §7 requires the test evidence and record IDs to be preserved in the
deployment/QA log before the synthetic CRM records are deleted. This document is
that record. **Once this is filed, Jake may delete the two records.**

---

## Test conditions

| | |
|---|---|
| Deploy timestamp | 12:42 PM, 27 September 2026 |
| Environment | Production (`leahylending.com`) |
| Cache state | Purged post-deploy by Jake |
| Method | Live form submission through the rendered page, as a visitor |
| Data used | **Synthetic only. No borrower data was used.** |

---

## Test 1 — Austin market, short consultation form

**Route:** `/contact/`

```text
Result ................. HTTP 200
CRM record ID .......... z1XLJjbciDGRleeB2uqe
Tags ................... ["website-lead"]
Source ................. "Website Contact Form"
landing_page ........... austin_contact
market_page ............ austin
sms_consent ............ yes
sms_marketing_consent .. no
Custom fields .......... 12
```

**Routing outcome:** ClientCare — correct for the Austin market.

**Deliberate test condition:** the submission was made with **marketing consent
unchecked**, to confirm the earlier defect was resolved. That checkbox previously
carried `required`, which blocked every Austin submission — the entire Austin
funnel routes through this form. The submission succeeded and recorded
`sms_marketing_consent: no`, confirming marketing consent is captured as a value
and is not a gate.

**Not captured:** `source_url`, `entry_page_title`, `guide_title`,
`selected_market`. This is the `spa-lead-forms.js` gap, approved by Eric §2 as
the next development item. It is a missing-code gap, not a caching artifact.

---

## Test 2 — DFW market, scenario questionnaire

**Route:** `/texas/dallas-fort-worth/`

```text
Result ................. HTTP 200
CRM record ID .......... QoibM0Vh1Hwb3cAjte3I
Tags ................... ["dfw","general"]
Source ................. "Scenario Review — dfw_homepage"
Custom fields .......... 40
selected_market ........ present (hidden input)
```

**Routing outcome:** Eric — correct for the DFW market.

**Partial capture at time of test:** only `selected_market` of the four context
fields was recorded. This was traced to a browser cache holding a superseded
`scenario-stepper.js` (30,534 bytes) while the server returned the current file
(32,462 bytes, containing the field) on plain, cache-busted and no-cache
requests. The server was correct; the browser had not re-requested. This is the
condition the asset-versioning deployment addresses, and a re-test is included in
that deployment's post-upload verification.

---

## Routing rule confirmed

```text
/*                              -> tag austin   -> ClientCare@LeahyLending.com
/texas/dallas-fort-worth/*      -> tag dfw      -> Eric@LeahyLending.com
```

Both branches verified against production. Market separation is working as
specified.

---

## Records cleared for deletion

| ID | Market | Route |
|---|---|---|
| `z1XLJjbciDGRleeB2uqe` | Austin | `/contact/` |
| `QoibM0Vh1Hwb3cAjte3I` | DFW | `/texas/dallas-fort-worth/` |

Both are synthetic. Evidence above is sufficient to reconstruct the test without
the records.

**Action for Jake:** delete both.

---

## Standing test policy — Eric §7

**No borrower data may be used in future testing.** All future production
verification will use synthetic values only, record IDs will be logged here
before deletion, and records will be deleted after each verification round.

Applies to the asset-versioning post-deployment verification and to the Austin
attribution-field staging tests required by Eric §2.

---

## Build controls and their limits

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not a compliance clearance and is not a production approval.

---

*Kyber Mortgage Corporation dba Leahy Lending · NMLS 2653540*
