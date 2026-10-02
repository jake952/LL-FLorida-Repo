# Austin / DFW Comparison — Locked Definition and Measurement Window

**Date:** 30 September 2026
**To:** Eric Bennett
**From:** Jake Bennett / build
**Re:** Your 30 September measurement direction, implemented
**Supersedes:** ERIC-MEASUREMENT-PLAN-2026-09-28.md

---

## 1. The definition, locked

Recorded verbatim from your 30 September handoff. **Fixed before the window
opens and not to be changed after comparative results are reviewed.**

> **Qualified conversation:**
> A completed live phone, video, or substantive two-way text/email interaction
> between a Leahy Lending representative and a lead within 14 calendar days of
> submission, in which the lead confirms a real mortgage-related need and
> provides enough information to identify:
>
> 1. Intended transaction type.
> 2. Intended property market or property location.
> 3. Timing.
> 4. A real next step or a documented reason that no next step is appropriate.

**Transaction type may include:** Purchase · Refinance · Cash-out ·
Investment-property financing · Construction · Still exploring

**A qualifying next step may include:** Scenario review · Document request ·
Prequalification discussion · Application · Follow-up appointment · Referral
handoff · Documented reason no next step is appropriate

**Does not count:** Spam · Bot submissions · Wrong or disconnected numbers ·
Duplicate leads · Employee, vendor or test records · No-response attempts ·
One-way voicemails · Auto-replies · Generic marketing inquiries · Leads that do
not confirm a real mortgage-related need

Applied identically to Austin and DFW.

---

## 2. Funnel stages

Your nine stages, to be tracked separately per market:

```text
1. Lead submitted
2. Contact attempt made
3. Connected lead
4. Qualified conversation
5. Appointment scheduled
6. Application started
7. Application completed
8. Loan submitted
9. Loan funded
```

Stages 1 and 6 have web instrumentation. Stages 2–5 and 7–9 are CRM states and
depend on the pipeline being worked consistently — a stage that nobody marks
reads as zero rather than as unknown, which is the main risk to the comparison.

---

## 3. Metric availability — all fifteen, audited

Checked against what is actually instrumented, not assumed.

| # | Metric | Austin | DFW | Source |
|---|---|---|---|---|
| 1 | CTA clicks | yes | yes | `contact_path_click` / `data-track` |
| 2 | Form starts | yes | yes | `form_start`, `hero_form_start` |
| 3 | Form completions | yes | yes | `scenario_form_success` |
| 4 | Lead submissions | yes | yes | CRM |
| 5 | Bot/spam-filtered submissions | **new** | **new** | `spam_filtered` — see §4 |
| 6 | Contact attempts | yes | yes | CRM |
| 7 | Contact rate | yes | yes | derived from 4 and 6 |
| 8 | Connected leads | yes | yes | CRM |
| 9 | Qualified conversations | yes | yes | CRM, §1 definition |
| 10 | Appointments scheduled | yes | yes | CRM |
| 11 | Applications started | yes | yes | `application_start_click` + CRM |
| 12 | Applications completed | yes | yes | CRM |
| 13 | Loan submissions | yes | yes | CRM |
| 14 | Funded-loan attribution | market-level | page-level | CRM |
| 15 | Lead response time | yes | yes | CRM timestamps |

**All fifteen are measurable on both markets.** The Austin CTA tracking added on
30 September is what makes metric 1 comparable; before it, Austin had no click
instrumentation at all.

**To be labelled DFW-only in every report**, per your direction:

```text
step-level drop-off within the funnel   hero_form_step_complete is DFW-only
scenario completeness / lead quality    40 CRM fields vs 12
page-level source attribution           Austin records market level only
```

Austin and DFW are not represented as directly comparable on page-level source
attribution.

---

## 4. One gap your metric list exposed, now closed

Metric 5 asks for bot/spam-filtered submissions as a reported figure. The
honeypot blocked them **silently** — no event, no counter. The filter worked and
reported nothing, so the metric would have read zero in both markets regardless
of how much spam arrived.

Both handlers now fire a `spam_filtered` event carrying the filter name only —
nothing the bot submitted reaches analytics. A build gate requires it, so a
future edit cannot quietly return the metric to zero.

**This is built and not yet uploaded.** It needs one deployment before the window
opens, or metric 5 starts partway through and the two markets are counted over
different periods.

---

## 5. Window

**Boundary:** your direction is the 30 September deployment timestamp.

**One correction for the record:** asset URL versioning actually went live on the
27–28 September upload; the 30 September deployment carried the profile
correction, CTA tracking, disclosures and honeypot. The 30 September boundary is
still the right one, because the honeypot — and therefore metric 5 — landed
then.

**Recommended length: 35 days**, within your 30–45 range. Five full weekly
cycles, which matters because mortgage inquiry volume is strongly day-of-week
patterned.

**Start condition:** the `spam_filtered` deployment in §4. Opening before that
leaves one metric uninstrumented for part of the period.

**Reporting:** a short weekly readout on volume and rates; the full comparison at
close. Every metric split by market, DFW additionally split by program page,
with the DFW-only items labelled in each report rather than only in the final
one.

**Baseline:** `GSC-BASELINE-PRE-DEPLOY-2026-09-25.md`, plus a CRM extract at
window open.

---

## 6. What the comparison can and cannot settle

**Can:** which model produces more leads per visitor; which produces leads that
reach qualified conversations, appointments and applications at a higher rate;
whether the higher-information questionnaire trades volume for quality and by
how much; whether lead response time differs and whether that tracks with
outcome.

**Cannot:** which Austin content drives conversion, or whether an Austin lead's
quality varies by entry topic. Austin records market level only, by owner
decision on the attribution fields. If the result is close, that is the most
likely thing to leave the decision unresolved — recorded now so it is not
rediscovered at window close.

---

## 7. Open

```text
spam_filtered deployment              before the window opens
post-deploy Search Console export     after sufficient recrawl, ~11 October
CRM extract at window open            baseline for stages 1-9
```

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
