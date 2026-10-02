# Lead routing — GoHighLevel build sheet

Covers **two markets**: Dallas–Fort Worth and Austin. Austin joined on
7 September 2026 when six of its product pages gained the same questionnaires.
Everything below applies to both unless a section says otherwise.

**Written 3 September 2026.**

Every DFW form tags its leads `dfw`, and nothing in GoHighLevel consumes that
tag yet. Until something does, a DFW lead lands in the same undifferentiated
inbox as an Austin one and nobody is assigned to it.

This has to be built inside the GoHighLevel account, so it is not something the
site can do for itself. Everything below is verified from the actual request
payloads — captured with the network stubbed so nothing reached the CRM — rather
than assumed, so it can be built without re-deriving anything.

---

## Amendment — 17 September 2026

Everything here was read off the built pages and the live endpoint, not
inferred. Where it disagrees with a section below, this amendment is current.

### The inventory is 22 forms, not 14

| | Scenario review | Calculator | Contact | Total |
|---|---|---|---|---|
| Dallas–Fort Worth | 11 | 1 | 1 | **13** |
| Austin | 8 | 1 | 0 | **9** |

The two non-scenario DFW forms:

| Page | `source` | tags | submitter |
|---|---|---|---|
| contact | `Website Contact Form` | `website-lead`, `dfw` | its own inline handler |
| mortgage-payment-amortization-calculator | `Scenario Review — dfw_mortgage_payment_calculator` | `dfw`, `calculator` | scenario-stepper.js |

The contact page does **not** load scenario-stepper.js, does not send
`program_interest`, and ignores `data-form-mode` — it posts regardless.

### `program_interest` — the RSU conflict, RESOLVED 18 September 2026

Both RSU pages now post **`rsu_bonus_commission`**, as both tag and
`program_interest`. One value, both markets.

| Page | Was | Now |
|---|---|---|
| Austin `/bonus-commission-rsu-income-mortgage/` | `rsu_bonus_commission` | unchanged |
| DFW `/rsu-bonus-commission-income/` | `complex_compensation` | `rsu_bonus_commission` |

Owner decision, Jake Bennett: the DFW page adopts the value Austin already
posts. **This supersedes section 11 of the RSU handoff**, which specified
`complex_compensation`. A CRM value rather than visible copy, but a reversal of
a written instruction and recorded as one.

`campaign_theme` keeps `complex_compensation_income` on the DFW page. It
describes the campaign, not the routing key, and nothing filters on it.

Its `source` also changed with the slug, from `dfw_rsu_bonus_commission_mortgages`
to `dfw_rsu_bonus_commission_income`.

Seven values were being posted that no list here or in `landing-manifest.json`
named, so provisioning from either would have missed them: `general`, `no_ratio`,
`super_jumbo`, `home_loan_options`, `dscr`, `complex_compensation` and
`not_sure`. All are registered now.

### Six contact-form fields were declared in only one of two places

`full_name`, `what_is_your_primary_source_of_income`, `property_state`,
`est_loan_amt`, `loan_type` and `tell_us_about_your_situation` were listed at
`routes[].fields` in the manifest but not in `crm_custom_fields_required`, which
this document points at as the full list. Provisioning from that list alone would
have created every scenario field and none of the contact ones, and GoHighLevel
would have dropped those six answers silently. They are in both places now,
bringing that list to 64.

`full_name` deserves a second look: `crm_native_contact_fields` is `firstName`,
`email`, `phone`, so the contact form sends the whole name as a **custom** field
rather than into the contact record’s own name.

### The market home was not submitting at all

Its `<body>` carried no `data-form-mode`. scenario-stepper.js defaults to
`dry-run` when that attribute is absent, so every visitor who completed all nine
steps of the hero questionnaire was told *“Submission is not enabled in this
environment”* and no lead was sent. Fixed, and a gate now fails the build if any
stepper page is not `live`. The one pass that read the attribute had been
collecting it without checking it, and was not registered in the build at all.

### Calculator pages gained an optional loan-type question

Added 18 September 2026 by owner direction: *"what loan type are you interested
in discussing"*, on both calculator pages, optional.

It reuses **`loan_type`** — the contact page's key — with an **identical set of
nine values**. That is deliberate and it is the whole point: no new GoHighLevel
field to provision, no second vocabulary for one question, and any workflow
already filtering `loan_type` by exact value keeps working unchanged.

A blank value means the visitor skipped the question. `Not Sure — Need Guidance`
is a different answer and means they chose it.

| Posts `loan_type` | Required? |
|---|---|
| `/texas/dallas-fort-worth/contact/` | no |
| `/texas/dallas-fort-worth/mortgage-payment-amortization-calculator/` | no |
| `/mortgage-payment-amortization-calculator/` (Austin) | no |

The DFW calculator build fails if the two option sets diverge, or if the field
is ever marked required.

### Deployment: the endpoint has a CORS allowlist

Verified against the live endpoint on 17 September 2026:

| Origin | Result |
|---|---|
| `https://leahylending.com` | allowed |
| `https://staging.leahylending.com` | allowed |
| `https://sub.leahylending.com` | refused |
| `https://leahylending.com.evil.test` | refused |
| `http://localhost:4173` | refused |

A real allowlist rather than a wildcard or a suffix match, which is good. It also
means **every form fails in the browser if these pages are served from any other
origin.** If DFW staging goes up on a host that is not one of the two above, that
host has to be added at the endpoint before any form works.

### What is still unverified

No test lead has been sent to the live CRM. Every check above stops at the
network boundary — payloads were captured with `fetch` stubbed. Whether
GoHighLevel accepts a payload and routes it has not been tested, and
`crm_routing_status` in the manifest still reads **NOT BUILT**.

---

## 1. What arrives

All twenty-two forms POST to the same place as the existing Austin contact form (13 Dallas–Fort Worth, 9 Austin — see the amendment of 17 September 2026, which supersedes the counts and the DFW table in this section):

```
POST https://ll-crm-integration2.vercel.app/api/contact
locationId: cs0p69rxtaRrojb7LE51
```

There are two shapes, and they need different handling.

### Scenario review — 20 pages (11 DFW, 9 Austin)

The eleven DFW pages are listed below, read off the built pages on 17 September
2026. The Austin pages send the same questionnaire with Austin identity —
see section 1c.

> Four pages joined this table after it was first written: the DFW market home,
> asset-utilization-mortgages, no-ratio-mortgages and super-jumbo-mortgages. The
> RSU row also changed slug, source, tag and `program_interest`.

| Page | `source` | tags | `program_interest` |
|---|---|---|---|
| (market home) | `Scenario Review — dfw_homepage` | `dfw`, `general` | `general` |
| bank-statement-mortgages | `Scenario Review — dfw_bank_statement_mortgages` | `dfw`, `bank_statement` | `bank_statement` |
| 1099-mortgages | `Scenario Review — dfw_1099_mortgages` | `dfw`, `1099` | `1099` |
| self-employed-mortgages | `Scenario Review — dfw_self_employed_mortgages` | `dfw`, `self_employed_general` | `self_employed_general` |
| asset-utilization-mortgages | `Scenario Review — dfw_asset_utilization_mortgages` | `dfw`, `asset_utilization` | `asset_utilization` |
| no-ratio-mortgages | `Scenario Review — dfw_no_ratio_mortgages` | `dfw`, `no_ratio` | `no_ratio` |
| super-jumbo-mortgages | `Scenario Review — dfw_super_jumbo_mortgages` | `dfw`, `super_jumbo` | `super_jumbo` |
| dscr-investor-loans | `Scenario Review — dfw_dscr_investor_loans` | `dfw`, `dscr` | `dscr` |
| construction-loans | `Scenario Review — dfw_construction_loans` | `dfw`, `construction` | `construction` |
| rsu-bonus-commission-income | `Scenario Review — dfw_rsu_bonus_commission_income` | `dfw`, `complex_compensation` | `complex_compensation` |
| home-loans | `Scenario Review — dfw_home_loans` | `dfw`, `home_loan_options` | `home_loan_options` |

Nine steps, 49 custom fields, full attribution and A2P consent evidence.

### Per-page questionnaire fields

The DSCR, construction and RSU pages were running the template’s SELF-EMPLOYMENT
questionnaire — “How long have you been self-employed?” with bank-statement and
tax-return documentation options. Wrong questions for those products, and the
documentation list had no rental, project or equity-compensation option at all.
Replaced 6 September 2026.

`home-loans` had no form at all — it is a clone of Austin’s page, which carries
one “Schedule Consultation” link and nothing else. After the consolidation it
became the destination for six products, so all six relied on a second click. It
now carries the questionnaire in its hero, and its five program cards point at
that form rather than at the pages that were folded into it. Its step 2,
`home_loan_path`, is the only place a visitor can say which of the six they came
for — route on that field, not on `source`, to tell them apart.

**Seven new custom fields are needed in GoHighLevel.** Two existing fields are
reused and will start receiving values they have not seen before, so any
workflow filtering on them by exact value needs checking.

| Page | Field | Status | Values |
|---|---|---|---|
| `dscr-investor-loans` | `rental_strategy` | **new values** | `long_term_rental` `short_term_rental` `long_or_short_term` `multi_unit` `not_sure` `other` |
| `dscr-investor-loans` | `expected_rental_income` | **new** | `yes` `no` `not_sure` |
| `dscr-investor-loans` | `documentation_path` | reused | `dscr_rental_income_review` `bank_statements` `self_employed_or_1099` `asset_utilization` `no_ratio` `super_jumbo` `not_sure` |
| `dscr-investor-loans` | `transaction_goal` | reused | `purchase` `refinance` `cash_out_refinance` `future_investment_property` `exploring` |
| `dscr-investor-loans`, `self-employed-mortgages`, `(market home)` | `super_jumbo_loan_range` | reused | `up_to_1m` `1m_to_2_5m` `2_5m_to_5m` `5m_to_10m` `more_than_10m` `not_sure` |
| `construction-loans` | `project_type` | **new** | `custom_home_on_owned_lot` `custom_home_lot_not_purchased` `teardown_and_rebuild` `major_renovation_or_addition` `still_exploring` |
| `construction-loans` | `project_stage` | **new** | `builder_selected` `interviewing_builders` `plans_complete` `plans_in_progress` `not_started` |
| `construction-loans` | `documentation_path` | reused | `builder_contract_and_plans` `plans_and_budget` `preliminary_estimates` `none_yet` `not_sure` |
| `rsu-bonus-commission-income` | `compensation_profile` | **new** | `base_salary_and_rsus` `base_salary_and_bonus` `base_salary_and_commission` `salary_bonus_commission_equity` `variable_from_multiple_sources` `other` |
| `rsu-bonus-commission-income` | `variable_compensation_history` | **new** | `two_years_or_more_current_structure` `one_to_two_years_current_structure` `less_than_one_year_current_structure` `prior_or_related_history` `not_sure` |
| `rsu-bonus-commission-income` | `documentation_path` | reused | `rsu_vesting_or_stock_award` `bonus_or_commission_history` `pay_statements_and_employer_docs` `tax_returns_or_income_records` `not_sure` |
| `home-loans` | `home_loan_path` | **new** | `buy_before_selling` `bridge_financing` `build_or_renovate` `larger_loan_amount` `second_home` `seller_financing` `not_sure` |
| `home-loans` | `current_home_status` | **new** | `own_and_keeping` `own_and_selling` `own_undecided` `do_not_own` `not_sure` |
| `home-loans` | `documentation_path` | reused | `w2s_and_paystubs` `tax_returns` `bank_statements` `1099_forms` `not_sure` |

| `self-employed-mortgages` | `documentation_path` | reused | `tax_returns` `bank_statements` `1099_forms` `profit_and_loss_statement` `asset_utilization` `no_ratio` `super_jumbo` `not_sure` |
| `self-employed-mortgages`, `(market home)` | `super_jumbo_loan_range` | **new** | `up_to_1m` `1m_to_2_5m` `2_5m_to_5m` `5m_to_10m` `more_than_10m` `not_sure` |

New fields to create: `rental_strategy`, `project_type`, `project_stage`, `compensation_profile`, `variable_compensation_history`, `home_loan_path`, `current_home_status`, `super_jumbo_loan_range`, `expected_rental_income`.

Pending CRM-owner confirmation (existing field, not posted by any DFW page, not to be retired through the site build): `investor_experience`. See §2.11 below.

**Changed 15 September 2026, DSCR handoff §10.** The DSCR page moved to
`/dscr-investor-loans/` and its questionnaire was reconfigured for investor
intent. Four things there need attention before provisioning:

- `investor_experience` is **not currently posted by any DFW page** — the DSCR
  handoff §10 reconfigured that questionnaire and did not ask for it.

  **Status: Pending CRM-owner confirmation. Do not delete, retire, or repurpose
  this field.** Eric’s 15 September 2026 response §2.11 directs that CRM schema
  changes are not finalized through the site build. The field remains in the
  §5.1 launch-dependency list, and the CRM owner must confirm the following
  before anything is changed on the CRM side:

  | Confirmation required | Status |
  |---|---|
  | Field existence | Pending CRM-owner confirmation |
  | Field type | Pending CRM-owner confirmation |
  | Allowed values | Pending CRM-owner confirmation |
  | Workflow dependencies | Pending CRM-owner confirmation |
  | Historical-reporting impact | Pending CRM-owner confirmation |
  | Migration or backward-compatibility treatment | Pending CRM-owner confirmation |

  The site build’s only claim here is the narrow, verifiable one: no DFW page
  posts this key. What that should mean for the CRM record is the CRM owner’s
  decision, not this build’s.
- `rental_strategy` keeps its name but **every one of its values changed**.
- `expected_rental_income` is new.
- `transaction_goal` gains one page-specific value, `future_investment_property`,
  alongside the four shared ones. It is the only page that sends it.

**`program_interest` for this page changed from `dscr_investor` to `dscr`**, per
§10 of that handoff. Any workflow routing on `dscr_investor` must be repointed or
it will stop matching. `landing_page` changed from `dfw_dscr_investor_mortgages`
to `dfw_dscr_investor_loans` at the same time.

**`super_jumbo_loan_range` was missing from every list until 15 September 2026.**
It has been on the market home's form since the homepage handoff added its
conditional step 4a, and the Self-Employed Hub handoff §5 now puts the same
question on the hub. It was in neither this document nor
`crm_custom_fields_required`, so GoHighLevel would have dropped every answer
to it without an error on either side. The check that should have caught it
walked only the DFW subdirectories and never opened the market home; that is
fixed, and the field is registered.

**`documentation_path` gains two values on the hub** — `no_ratio` and
`super_jumbo`. Any GoHighLevel workflow filtering that field by exact value
needs to account for them.

**Changed 15 September 2026, RSU handoff section 11.** The RSU page moved to
`/rsu-bonus-commission-income/` and its step 2 and step 4 became
`compensation_profile` and `variable_compensation_history`. The old
`variable_income_history` is no longer posted by any form and should not be
created; `income_profile` is no longer posted by this page, though the
self-employed and 1099 pages still send it and it stays.

These are new names rather than reuses on purpose. Filling
`self_employment_history` with a W-2 employee's compensation history, or
`income_profile` with a compensation shape, would corrupt those fields for the
pages that use them properly — and a workflow filtering on them by exact value
would start matching leads it was never meant to match.

All seven are now in `crm_custom_fields_required` in `landing-manifest.json`,
which brings that list to 56. They were missing from it until 6 September:
the prose named them but the machine-readable list this document points at as
"the full list" did not, so provisioning from the manifest would have created
49 of 56 and every answer to these questions would have been accepted by the
endpoint and dropped silently by GoHighLevel.

#### The other three scenario pages, for completeness

These were not changed on 6 September, but the table above is not the whole
inventory without them. Their steps 2-4:

| Page | Field | Values |
|---|---|---|
| `bank-statement-mortgages` | `income_profile` | `business_owner` `paid_primarily_1099` `w2_plus_business_or_side_income` `contract_consulting_or_freelance` `other` |
| `bank-statement-mortgages` | `self_employment_history` | `two_years_or_more` `one_to_two_years` `less_than_one_year` `prior_related_experience` `not_sure` |
| `bank-statement-mortgages` | `documentation_path` | `personal_bank_statements` `business_bank_statements` `tax_returns` `1099_forms` `not_sure` |
| `1099-mortgages` | `work_profile` | `independent_contractor` `consultant_or_freelancer` `business_owner_paid_primarily_1099` `healthcare_or_travel_professional` `trade_or_skilled_services` |
| `1099-mortgages` | `1099_income_history` | `two_years_or_more` `one_to_two_years` `less_than_one_year` `prior_related_experience` `not_sure` |
| `1099-mortgages` | `documentation_path` | `1099_forms` `personal_or_business_tax_returns` `bank_statements` `multiple_income_sources` `not_sure` |
| `self-employed-mortgages` | `income_profile` | `business_owner` `paid_primarily_1099` `w2_plus_business_or_side_income` `contract_consulting_or_freelance` `substantial_assets_limited_income` `other` |
| `self-employed-mortgages` | `self_employment_history` | `two_years_or_more` `one_to_two_years` `less_than_one_year` `prior_related_experience` `not_sure` |
| `self-employed-mortgages` | `documentation_path` | `tax_returns` `bank_statements` `1099_forms` `profit_and_loss_statement` `asset_utilization` `no_ratio` `super_jumbo` `not_sure` |
| `self-employed-mortgages`, `(market home)` | `super_jumbo_loan_range` | `up_to_1m` `1m_to_2_5m` `2_5m_to_5m` `5m_to_10m` `more_than_10m` `not_sure` |
| `dscr-investor-loans` | `rental_strategy` | `long_term_rental` `short_term_rental` `long_or_short_term` `multi_unit` `not_sure` `other` |
| `dscr-investor-loans` | `expected_rental_income` | `yes` `no` `not_sure` |
| `dscr-investor-loans` | `documentation_path` | `dscr_rental_income_review` `bank_statements` `self_employed_or_1099` `asset_utilization` `no_ratio` `super_jumbo` `not_sure` |
| `dscr-investor-loans` | `transaction_goal` | `purchase` `refinance` `cash_out_refinance` `future_investment_property` `exploring` |

**`documentation_path` is the field to watch.** One field receives seven
different option sets depending on which page the visitor was on — 26 distinct
values in total, with almost no overlap between a construction answer and a
DSCR one. It is a free-text-ish audit field, not a routing field: route on
`program_interest`, and read `documentation_path` alongside `landing_page` or
it means nothing.

**Every page asks the same six shared questions**, which is intended:
`transaction_goal`, `purchase_funds_readiness`, `property_equity_estimate`,
`investment_property_use`, `timeline`, plus the contact step. Only steps 2-4
differ by product.

Reused fields with new values: `documentation_path`, `income_profile`.

`self_employment_history` no longer arrives from these three pages. It is still
sent by `dfw_self_employed_mortgages` and `dfw_bank_statement_mortgages`, so do
not retire the field.

`dfw_1099_mortgages` does **not** send it — that page has always asked
`1099_income_history` instead, and `work_profile` in place of `income_profile`.
An earlier version of this section named the wrong two fields for that page.

Each page also carries a reassurance note that fires on the answer most likely to
feel disqualifying — a first investment property, an early-stage build, a short
variable-compensation history. Those are display-only and send nothing to the CRM,
but they are the mechanism that keeps an honest answer from reading as a
rejection, so they should not be removed without a replacement.


### The DFW calculator

`/texas/dallas-fort-worth/mortgage-payment-amortization-calculator/` is a copy of
the Austin calculator with DFW links and identity. It sends `data-crm-tags="dfw,calculator"`
and `data-landing-page="dfw_mortgage_payment_calculator"`, so calculator leads
from the DFW market are separable from Austin ones for the first time — previously
both markets shared one page tagged only `calculator`.

The calculator itself is untouched: same inputs, same maths, same disclosures.
Verified against the Austin page — identical field ids, identical behavior.

---

### Retired page sources — do not build workflows for these

Seven program pages were consolidated onto the two hubs on 4 September, to
match how the Austin site handles the same products. **These `source` strings
will never arrive**, because the pages are now 301 redirects:

| Retired page source | now redirects to |
|---|---|
| `Scenario Review — dfw_profit_and_loss_mortgages` | `self-employed-mortgages` |
| `Scenario Review — dfw_asset_utilization_mortgages` | `self-employed-mortgages` |
| `Scenario Review — dfw_bridge_loans` | `home-loans` |
| `Scenario Review — dfw_buy_before_you_sell` | `home-loans` |
| `Scenario Review — dfw_spec_construction_loans` | `home-loans` |
| `Scenario Review — dfw_asset_only_mortgages` | `self-employed-mortgages` |
| `Scenario Review — dfw_seller_financing_more` | `home-loans` |

The borrower intent those pages captured is **not lost** — it now arrives as
questionnaire field values on the hub forms rather than as a per-page
`program_interest`. On `dfw_self_employed_mortgages` the relevant values are
`profit_and_loss_statement`, `asset_utilization` and
`substantial_assets_limited_income`.

So segment those leads on the field value, not on `source`. A workflow keyed to
one of the retired `source` strings will silently never fire.

### Contact — 1 page

| Page | `source` | tags |
|---|---|---|
| contact | `Website Contact Form` | `website-lead`, `dfw` |

Ten fields. **`source` is byte-identical to the Austin contact form on purpose**,
so whatever workflow already handles contact-form leads keeps firing for it. The
`dfw` tag is what makes it separately routable. Do not filter DFW contact leads
on `source` — filter on the tag.

### No form

The DFW homepage (`/texas/dallas-fort-worth/`) has no form. It is a discovery
page that routes to the thirteen program pages, so it produces no leads
directly.

---

## 1b. Telling the three lead types apart

Three things on the DFW suite create a GoHighLevel contact. They are not
equally well identified, and one of them currently matches no workflow branch.

| | Scenario questionnaire | Calculator | Contact form |
|---|---|---|---|
| Pages | 13 (7 DFW, 6 Austin) | 1 | 1 |
| Submitted by | `scenario-stepper.js` | `scenario-stepper.js` | inline handler on the page |
| `source` | `Scenario Review — <landing_page>` | `Scenario Review — dfw_mortgage_payment_calculator` | `Website Contact Form` |
| Tags | `dfw` + the program | `dfw`, `calculator` | `website-lead`, `dfw` |
| `form_type` | `scenario_review` | `calculator_scenario_review` | `contact_form` |
| `program_interest` | the product | *empty* | *not sent* |
| A2P consent evidence | 5 fields | 5 fields | 5 fields |
| Identity fields | all 7 | all 7 | 6 of 7 (no `program_interest`) |
| Questions | 9 steps, 8 required | 1 step, contact details only | 5 fields |

### The identifiers, most to least useful

**`source`** is the only field that is distinct for all nine and always
populated. Nine values, one per page. If you build one report, build it on this.

**Tags** separate the three *types* but not the pages within a type. Every DFW
lead carries `dfw`. A scenario lead adds its `program_interest` as a second tag
(`construction`, `dscr_investor`, `1099`, `bank_statement`,
`self_employed_general`, `rsu_bonus_commission`, `home_loan_options`), so the
seven questionnaire pages are separable by tag. The calculator adds
`calculator`. The contact form adds `website-lead`.

**Identity custom fields** — `landing_page`, `landing_page_id`,
`landing_page_route`, `campaign_theme`, `market_page`, `form_type`,
`program_interest` — are sent by the stepper on all eight pages that use it,
each distinct per page. The contact form now sends six of the seven; it has no
`program_interest` because a contact-form visitor never names a product.

**Fixed 6 September 2026.** Until then the contact form sent none of them, and
because its `source` string is byte-identical to the Austin form's, the single
`dfw` tag was the *only* thing distinguishing a DFW contact lead from an Austin
one. One tag failing to apply and the lead was indistinguishable. Nothing that
was already being sent changed, so workflows matching on the old source string
or the original five fields are unaffected.

### A2P consent was being collected and discarded

Worth recording because it is the kind of thing that only surfaces in an audit.

The contact page carries two **required** consent checkboxes, and the handler
blocks submission until both are ticked. Neither value was in the payload: the
`customFields` array was a hardcoded five entries. So the site required every
visitor to consent to SMS contact and kept no record that they had. The
endpoint also stamps `sms_consent_ip` server-side only for payloads carrying
`sms_consent`, so no consenting IP was recorded either.

It now sends the same five the scenario form sends: `sms_consent`,
`sms_marketing_consent`, `sms_consent_timestamp` (ISO-8601, stamped only when
consent was given), `sms_consent_url`, and `sms_consent_text` — the disclosure
read back out of the DOM at submit time rather than duplicated in code, so what
is stored is verbatim what rendered. No consent language was written or
altered; the approved text is transmitted, not restated.

All sixteen fields the contact form now sends already exist in
`crm_custom_fields_required`, so **no new GoHighLevel fields need creating** for
either fix.

### The calculator used to match no branch

Recorded because it explains why step 2 looks the way it does.

The calculator page sets no `data-program-interest`, so the stepper sends it
as an empty string, and the page carries no `website-lead` tag. Under the
original two branch conditions a DFW calculator lead therefore fired the `dfw`
trigger, entered the workflow, matched neither branch, and stopped: no owner,
no opportunity, no notification — the contact sitting in GoHighLevel with its
calculator figures attached and nobody told.

Step 2 now has a Branch C for it, and all three branches key on `form_type`.
The alternative — giving the calculator page a `data-program-interest` — was
rejected: any real value misreports what the visitor asked for, since they ran
a payment calculation rather than choosing a product, and `not_sure` was the
one value the old Branch A explicitly excluded, so it would not have worked
anyway.

A calculator lead also carries twelve `calc_*` custom fields holding the exact
figures the visitor saw — price, loan amount, LTV, term, rate assumption,
principal and interest, total monthly, total interest, extra principal, and a
`calc_snapshot_json` of the whole thing. All twelve are already declared in the
manifest. Put `calc_total_monthly` and `calc_loan_amount` in the notification:
a loan officer opening that lead should not have to ask what the visitor was
looking at.

## 1c. Austin — six product pages

Added 7 September 2026. Each of these six sends **the same questionnaire as its
DFW twin** — the form is lifted from the DFW page at build time rather than
maintained twice, so the two markets ask identical questions by construction.
Nothing in the questions or the answer values differs by market.

| Austin page | DFW twin | `program_interest` |
|---|---|---|
| `/bank-statement-loans` | bank-statement-mortgages | `bank_statement` |
| `/1099-mortgage-loans` | 1099-mortgages | `1099` |
| `/self-employed-mortgage-loans` | self-employed-mortgages | `self_employed_general` |
| `/dscr-investor-loans` | dscr-investor-loans | `dscr` |
| `/construction-loans` | construction-loans | `construction` |
| `/bonus-commission-rsu-income-mortgage` | rsu-bonus-commission-mortgages | `rsu_bonus_commission` |

### What is different about an Austin lead

Only the identity. Every questionnaire field, and every value those fields can
take, is already in `crm_custom_fields_required` because they are the DFW
fields — **no new custom fields are needed for Austin.**

| | DFW | Austin |
|---|---|---|
| Tag | `dfw` + the program | `austin` + the program |
| `market_page` | `dallas_fort_worth` | `austin` |
| `landing_page` | `dfw_*` | `austin_*` |
| `form_type` | `scenario_review` | `scenario_review` |
| Pageview event | `view_dfw_*` / `view_*_page` | `view_austin_*` |
| Phone on the page | (214) 531-6416 | (512) 240-2897 |
| Indexing | noindex until launch | **index,follow** — these are live, ranking pages |

The six `view_austin_*` events are declared in `landing-manifest.json`. They
were not, briefly: the pages fired them from day one while the manifest did not
declare them, which is the same silent gap that hid four DFW pageview events —
a page firing analytics the declared inventory does not know about.

### These pages are static copies of React routes

Worth knowing before anyone edits them. The Austin product pages were React
routes: the host returned the same SPA shell for all of them and the content was
drawn in the browser, so there was no file to add a form to. Each is now a
static file at the same path, which the server serves instead of the React route.

Consequence: **edits made in the React app no longer appear on these six routes.**
Copy changes have to be made in the static files, or the pages rebuilt from a
fresh capture.

## 2. Filter on the tag, audit on the field

Use the `dfw` tag as the workflow trigger — it is what the pages were built to
emit and it is simple to filter.

For reporting and any decision that has to be right, prefer the custom field
`market_page = dallas_fort_worth`. It arrives on every scenario submission and
is not something a form can be tricked into changing. `scenario-stepper.js`
says as much in its own comments: tags are assembled client-side and are
therefore spoofable, and if tag integrity ever matters the endpoint should
stamp them server-side and ignore what the browser sent.

---

## 3. Build order

### Step 1 — confirm the custom fields exist

The scenario form sends 49 custom fields; the full list is
`crm_custom_fields_required` in `landing-manifest.json`. A field GoHighLevel
does not recognize is dropped silently, so confirm before wiring anything. The
ones routing depends on:

```
market_page          landing_page        landing_page_id
campaign_theme       program_interest    form_type
landing_page_route
```

And the A2P evidence, which must be stored or the consent record is lost:

```
sms_consent          sms_consent_timestamp    sms_consent_url
sms_marketing_consent  sms_consent_text       sms_consent_ip
```

### Step 2 — one workflow, three branches

**Trigger:** Contact Tag Added → `dfw`

Use a tag trigger rather than "Contact Created": a returning visitor who
already exists as a contact will not fire a creation trigger, and that is
exactly the lead you least want to drop.

**All three branches key on `form_type`.** It is sent by every submitting page,
always populated, and takes exactly three values — one per lead type — so the
branches are mutually exclusive by construction. Nothing depends on evaluation
order. See *Why `form_type`* below for what this replaced and why.

**The trigger now fires for two markets.** Use `Contact Tag Added → dfw` **or**
`austin`; a lead carries exactly one of the two. Inside each branch, split on
`market_page` (`dallas_fort_worth` / `austin`) wherever the market changes the
answer — which in practice is owner assignment and reporting, not the branch
itself, because the questions and fields are identical across markets.

> **Not yet built in GoHighLevel.** Two things in this sheet describe workflow
> that does not exist yet: **Branch C** for calculator leads, and the **`austin`
> trigger and market split**. Until both are built, a calculator lead and every
> Austin scenario lead are created as contacts and then sit there — no owner, no
> opportunity, nobody notified. Neither is a site change; both are GoHighLevel
> configuration.

**Branch A — scenario review.** Condition: `form_type` = `scenario_review`.

1. Assign owner (see step 3)
2. Create opportunity in the DFW pipeline, stage "New scenario review"
3. Notify the assigned user — include `program_interest`, `landing_page` and
   the visitor's own `discovery_source`
4. Add tag `dfw-scenario`

**Branch B — contact form.** Condition: `form_type` = `contact_form`.

1. Assign owner (see step 3)
2. Create opportunity in the DFW pipeline, stage "New enquiry"
3. Notify the assigned user — include `loan_type` and
   `tell_us_about_your_situation`
4. Add tag `dfw-contact`

**Branch C — calculator.** Condition: `form_type` = `calculator_scenario_review`.

1. Assign owner (see step 3)
2. Create opportunity in the DFW pipeline, stage "New calculator enquiry"
3. Notify the assigned user — include `calc_total_monthly`, `calc_loan_amount`
   and `calc_term_years`, so whoever picks it up already knows what the visitor
   was looking at and does not have to ask them to repeat it
4. Add tag `dfw-calculator`

Hold this one to a different standard than Branch A. A completed nine-step
scenario review is a considered enquiry; a calculator lead is someone who ran a
payment and left their details. Same follow-up obligation, lower intent — worth
a separate pipeline stage so the two never get averaged together in reporting.

**Without Branch C these leads go nowhere.** The calculator page sets no
`data-program-interest`, so the stepper sends it as an empty string, and the
page carries no `website-lead` tag. A calculator lead therefore fires the `dfw`
trigger, enters the workflow, matches neither A nor B, and stops: contact
created with its figures attached, no owner, no opportunity, nobody told.

#### Why `form_type`

| Branch | `form_type` | Pages |
|---|---|---|
| A — scenario review | `scenario_review` | 7 |
| B — contact form | `contact_form` | 1 |
| C — calculator | `calculator_scenario_review` | 1 |

These conditions replaced an earlier pair that keyed Branch A on
`program_interest` being non-empty and not `not_sure`, and Branch B on the
`website-lead` tag. Both were proxies for "which form was this", and they
failed in two different ways.

**They could double-match.** `scenario-stepper.js` honors a
`?program_interest=` query parameter on **any** page that loads it, the
calculator included — and that is the exact shape of the documentation-path
links used elsewhere on the suite. A calculator URL carrying that parameter
produces a lead with a non-empty `program_interest` *and* the `calculator`
tag, satisfying the old Branch A and Branch C at once: two opportunities for
one person, from a link the site itself generates.

**And they could miss entirely.** The calculator page sets no
`data-program-interest` and carries no `website-lead` tag, so before Branch C
existed a calculator lead matched nothing at all.

`program_interest` is still the right field to route *within* Branch A — it
names the product, and step 3 uses it. It was only ever the wrong field to
identify the branch with. `form_type` answers exactly the question the branch
is asking.

**If the workflow is already built on the old conditions**, the change is two
edits: Branch A's condition becomes `form_type` = `scenario_review`, and
Branch B's becomes `form_type` = `contact_form`. Nothing else moves — the
actions inside each branch are unchanged, and `website-lead` is still sent, so
any other workflow filtering on that tag is unaffected.

### Step 3 — assignment

**Split on `market_page` first.** An Austin lead and a DFW lead are the same
shape but almost certainly not the same owner — Austin is the established book,
DFW is new. Whatever you choose below, choose it per market rather than once for
both.


This is the decision the site cannot make. Three workable options:

- **Round-robin Jake / Eric** — simplest, fine while volume is low
- **All DFW to one owner** — cleanest attribution while the market is new, and
  makes it obvious whether DFW is producing anything
- **By program** — e.g. investor and construction to one owner,
  self-employed documentation to the other, using `program_interest`

Recommendation: single owner for the first few weeks. It gives a clean read on
whether DFW converts before splitting the queue muddies the numbers.

### Step 4 — reporting

Build one report grouped by `landing_page`. That answers the question the whole
DFW build exists to answer: which pages produce leads. `program_interest` gives
the second cut, and `utm_source` / `first_touch_source` the third.

Segment by `form_type` before comparing anything. Nine-step scenario reviews,
calculator enquiries and contact-form messages are three different levels of
intent, and a page-by-page league table that mixes them will rank the
calculator far too highly on volume alone. `landing_page` and `form_type`
together are the honest cut.

**And segment by `market_page` before comparing pages across markets.** The
Austin pages are indexed and have been ranking for a long time; the DFW pages
are new and noindex until launch. Putting `/bank-statement-loans` next to
`/texas/dallas-fort-worth/bank-statement-mortgages/` in one table measures the
age and indexing of the two pages, not the product or the copy.

---

## 4. Before switching it on

- [ ] Custom fields from step 1 confirmed present in GoHighLevel
- [ ] Workflow built, both branches, **left inactive**
- [ ] One live submission from a program page — check the tag, the
      assignment, and that all 49 fields populate
- [ ] One live submission from the contact page — check `source` is still
      `Website Contact Form`, that the existing Austin workflow still fires,
      and that the `dfw` tag routes it as well
- [ ] Delete both test contacts
- [ ] Activate

Two things worth knowing while testing:

**A tag named `not_sure`.** Program pages append `program_interest` to the
tag list, so a visitor who answers "still exploring" produces a tag literally
reading `not_sure`. The contact page produces it on every lead, since nobody
picks a program there. It is honest but it is clutter in the tag list. One
line in `scenario-stepper.js` suppresses it if you would rather not have it.

**Consent is collected but not recorded on the contact form.** The Austin
contact form has both consent checkboxes and sends no consent fields; the DFW
copy matches it deliberately. The scenario form does record all six. If A2P
evidence matters for the contact form too — and for carrier audits it does —
that is a change worth making on both sides at once.
