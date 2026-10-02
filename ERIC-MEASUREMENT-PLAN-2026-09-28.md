# Austin / DFW Conversion-Model Comparison Plan

**Date:** 28 September 2026
**Scope:** Eric §3 — 30–45 day comparison, triggered by the asset-versioning upload going live
**Status:** PLAN · instrumentation complete · one business definition outstanding

---

## Trigger condition met

Eric made this plan contingent on the asset-versioning upload being live. It went
live 27–28 September and was verified (`ERIC-QA-LOG-2026-09-28.md`). The plan is
therefore due.

---

## What is being compared

```text
Austin:  program/content pages -> Schedule Consultation -> /contact/
         -> short consultation form -> ClientCare

DFW:     market/program pages -> scenario questionnaire
         -> DFW / Eric routing
```

Per Eric: the different form depth is **the test**, not a defect. Austin is a
lower-friction short form; DFW is a higher-information questionnaire. Neither is
to be changed during the measurement window.

---

## Both instrumentation gaps are now fixed

Two defects sat on the exact path being measured. Owner direction, Jake Bennett,
28 September 2026: fix both before the window opens. **Both are implemented and
verified.** Neither touches form depth, the Austin conversion model, or the CRM
attribution fields Eric declined.

### Fixed 1 — Austin CTAs now fire a tracked event

Austin carried zero click instrumentation against DFW's 30 tracked elements, so
Eric's first metric was half unmeasurable. A click that fires no event is
indistinguishable from a click that never happened, so a comparison run on that
instrumentation would have reported Austin at zero and looked plausible.

```text
132 contact CTAs across 16 pages now fire contact_path_click
```

Verified by firing a real click in the browser, not by inspecting markup:

```text
event         contact_path_click
market        austin            (read from the page, not the visitor)
cta_location  nav               (placement, for diagnosis)
```

The payload carries no personal data. `market` comes from the page's own body
attribute, so every event is segmentable by market with no per-page wiring.

**No page-level source attribution was added.** GA4 already records the page of
every event, and Eric's direction is that Austin is measured at market/funnel
level. This adds the event name and a placement label only.

### Fixed 2 — the redirect is off the measured path

Every Austin CTA pointed at `/contact` unslashed, which 301s to `/contact/`. The
entire Austin funnel passed through a redirect the DFW path does not have —
friction on the exact route being compared, and crawl budget on every Austin
page.

```text
126 links rewritten to /contact/   unslashed links remaining: 0
```

The two models are now compared on equal footing.

### Both are enforced by a gate

`check-austin-contact-cta.js` fails the build on any unslashed `/contact` link or
any untracked contact CTA. Both halves were negative-tested — the gate was shown
failing for each condition separately before being trusted — because both
regressed silently the first time and neither is visible by looking at the site.

## Metric availability

Per Eric's instruction, anything available only on the DFW path is labeled
DFW-only, and the two markets are not treated as comparable on page-level source
attribution.

| # | Metric | Austin | DFW | Source |
|---|---|---|---|---|
| 1 | CTA clicks into each path | **yes** (fixed 28 Sep) | yes | `data-track` + GA4 |
| 2 | Austin short-form starts and completions | yes | n/a | `form_start`, `scenario_form_success` |
| 3 | DFW questionnaire starts and completions | n/a | yes | `hero_form_start`, `scenario_form_success` |
| 4 | Qualified conversations | yes | yes | CRM — needs a written definition |
| 5 | Applications | yes | yes | `application_start_click` + CRM |
| 6 | Funded-loan attribution | market-level only | page-level | CRM |
| 7 | Lead response time | yes | yes | CRM timestamps |
| 8 | Lead-contact rate | yes | yes | CRM |
| 9 | Appointment / booked-consultation rate | yes | yes | CRM |
| 10 | Fallout / drop-off rate | start vs success only | **step-level** | `hero_form_step_complete` is DFW-only |
| 11 | Scenario completeness / lead quality | 12 fields | **40 fields** | CRM payload |
| 12 | Market-level source and routing confirmation | yes | yes | CRM tags, verified |

**DFW-only, and will be labeled as such in every report:** step-level drop-off
within metric 10, and the richer half of metric 11. Metric 1 is now comparable
across both markets.

**Page-level source attribution is DFW-only by owner decision.** Austin
submissions do not record which program page sent the visitor, because the four
context fields were declined for Austin. Austin is measured at market/funnel
level, DFW at scenario/page level — exactly as Eric directed.

---

## Confirmed instrumentation

Observed firing live during the 28 September verification, not assumed from code:

```text
hero_form_start            DFW      ep.market, ep.program_interest
form_start                 both     epn.form_length, ep.first_field_name
hero_form_step_complete    DFW      step-level progress
scenario_form_submit       both
scenario_form_success      both
scenario_form_error        both
application_start_click    both
phone_click, faq_expand    both
sticky_cta_*               both
```

GA4 property: `G-2LMXT6BVCY`. No personal data appears in any payload — verified
during the test round.

---

## Proposed window and method

**Length:** 35 days, within Eric's 30–45 range. Long enough to cover five full
weekly cycles, which matters because mortgage inquiry volume is strongly
day-of-week patterned.

**Start condition:** the instrumentation fix must be deployed, and metric 4
defined. Instrumentation must not change once the window is open — changing it
mid-window makes the before and after incomparable, which is the most common way
a test like this is wasted.

**Baseline:** the 27 September pre-deploy Search Console export
(`GSC-BASELINE-PRE-DEPLOY-2026-09-25.md`) plus a CRM extract at window open.

**Reporting cadence:** a short weekly readout on volume and rates; the full
comparison at window close.

**Segmentation:** every metric split by market, with DFW additionally split by
program page. Austin cannot be split by page — stated in each report so the
asymmetry is never mistaken for a finding.

---

## What this comparison can and cannot answer

**Can answer:**

- Which model produces more leads per visitor
- Which model produces leads that convert to conversations, appointments and
  applications at a higher rate
- Whether the higher-information questionnaire filters volume in exchange for
  quality, and by how much
- Whether lead response time differs, and whether that tracks with outcome

**Cannot answer, and should not be claimed:**

- Which Austin content drives conversion. Austin leads are market-level only.
- Whether an Austin lead's quality varies by entry topic.
- Any page-level Austin-versus-DFW comparison.

If the result is close, the missing Austin page-level attribution is the most
likely thing to leave the decision unresolved. That is a known and accepted
consequence of the owner's decision, recorded here so it is not rediscovered at
window close.

---

## Remaining decision before the window opens

Only one, and it is a business definition rather than a technical one:

**Metric 4 — a written definition of "qualified conversation"**, applied
identically to both markets. The comparison is only as good as the consistency of
this definition, and it cannot be derived from the site. It needs to be agreed
before the window opens, not settled retrospectively when the numbers are in.

The two instrumentation gaps that previously appeared here are fixed and
verified; see above.

**Start condition:** the window can open as soon as the instrumentation fix is
deployed and metric 4 is defined. Instrumentation must not change once the window
is open — that is the most common way a comparison like this is wasted.

## Build controls and their limits

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not a compliance clearance and is not a production approval.

---

*Kyber Mortgage Corporation dba Leahy Lending · NMLS 2653540*
