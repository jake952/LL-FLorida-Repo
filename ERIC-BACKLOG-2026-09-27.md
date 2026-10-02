# Technical Backlog and Conversion-Test Record

**Date:** 27 September 2026
**Scope:** Eric §6 (separate non-blocking tickets) and §3 (conversion-model record)
**Status:** OPEN · none included in the asset-versioning deployment

---

## Part A — §3 record correction: the conversion models are a controlled test

**This corrects the framing in my 27 September live-state handoff.**

That handoff recorded the Austin/DFW split under "Owner decisions — SETTLED",
which was accurate about Jake's authority to proceed but wrong about the
**status** of the architecture. Eric §3 is explicit: this is a controlled
comparison, **not an indefinitely settled architecture**. The record is corrected
here, and this document supersedes that section.

### Models under test

```text
Austin:  program pages -> /contact/ -> short consultation form -> ClientCare
DFW:     market/program pages -> scenario questionnaire -> DFW / Eric routing
```

Both remain live **temporarily**, for measurement.

### Authorization status

| | |
|---|---|
| Both models live | Authorized, temporary |
| Change to Austin form depth | **Not authorized** |
| Change to the Austin short-contact model while adding context fields | **Not authorized** (Eric §2) |
| Future model decision | To be made **from measurement, not assumption** |

### Comparison plan — sequencing

Eric §3 requires the 30–45 day plan to be prepared **after** two prerequisites
are live:

```text
1. asset-versioning deployment           (Eric §1)  -- built, awaiting upload
2. Austin attribution-field parity       (Eric §2)  -- not started, correctly
                                                       sequenced after item 1
```

The plan is therefore **not yet due**. Metrics to be measured, recorded now so
instrumentation needs can be assessed alongside the §2 work:

```text
CTA clicks
Form starts
Form completion rate
Qualified conversations
Applications
Funded-loan attribution
Lead response time
Scenario completeness / lead quality
Austin versus DFW source and market attribution
```

**Instrumentation note, raised early because it affects §2 scope:** the last item
— Austin versus DFW source and market attribution — is not measurable today on
the Austin side. `spa-lead-forms.js` captures none of `source_url`,
`entry_page_title`, `guide_title` or `selected_market`. The §2 work is therefore
a prerequisite for the comparison, not merely adjacent to it. Several other
metrics (CTA clicks, form starts, completion rate) will need analytics events
that should be confirmed present before the measurement window opens.

No work on the plan will begin until both prerequisites are live.

---

## Part B — §6 technical backlog

Six separate, non-blocking tickets. **None is included in the asset-versioning
upload**, and that exclusion was verified: every built page was compared against
production with version stamps normalised away, and 33 of 33 were byte-identical.

---

### TECH-001 — `www` to apex host consolidation

**Status:** Open · non-blocking
**Finding:** `https://www.leahylending.com/` does not redirect to the apex host.
**Impact:** Two hostnames can serve the same content; duplicate-host signals.
**Not yet determined:** whether DNS and certificate coverage for `www` is in
place, which affects how the redirect must be implemented.

---

### TECH-002 — `/index.html` duplicate handling

**Status:** Open · non-blocking
**Finding:** `/index.html` is served alongside `/` without a redirect.
**Cause:** SiteGround NGINX Direct Delivery serves on-disk files, bypassing
Apache and therefore bypassing `.htaccess` rules. Confirmed by
`X-Proxy-Cache-Info: DT:1` on affected responses.
**Impact:** Every page is reachable at two URLs. Canonical tags mitigate but do
not eliminate this.
**Constraint to note for whoever takes this:** an `.htaccess` redirect will not
work for the same reason it could not fix the asset caching. The fix has to come
from host configuration or from the Direct Delivery setting itself.

---

### TECH-003 — Two-hop `/loan-officers/` redirect

**Status:** Open · non-blocking
**Finding:**

```text
/loan-officers/     301 -> /about     301 -> /about/
/leadership-team/   301 -> /about     301 -> /about/
```

**Impact:** Two hops where one would do. Minor crawl inefficiency.
**Fix is trivial** — point the first rule at `/about/` directly. Held back only
because it sits in the same `.htaccess` block as the profile-route rules, which
are frozen pending Eric's §4 decision.

---

### TECH-004 — Sitemap: 22 URLs versus 23 indexable pages

**Status:** Open · non-blocking · **more significant than originally filed**
**Finding:** the single unlisted indexable page is:

```text
/texas/dallas-fort-worth/loan-officers/eric-bennett/
```

It carries `index, follow`, a self-referential canonical, Person schema with NMLS
identifier 288376, and 13 internal links — and is not advertised to Google.

**Cause:** the sitemap builder excludes the DFW block from automatic listing,
derived from an earlier always-noindex policy for that prefix. The profile
inherited that exclusion after becoming indexable.

**Why this is not a counting discrepancy:** it is the author-entity page the
E-E-A-T and GEO work depends on.

**Blocked by:** Eric §4. Listing the page under a route that may change would be
worse than not listing it. Full detail in
`ERIC-PROFILE-ROUTE-DECISION-2026-09-27.md`.

---

### TECH-005 — DFW About page carries an Austin H1

**Status:** Open · non-blocking
**Finding:** the DFW About page H1 reads "Austin's Trusted Lender".
**Impact:** Incorrect market claim on a DFW page. Cosmetic and factual; not a
functional or compliance defect.
**Note:** the replacement wording is a copy decision. No H1 will be authored
without approval, per the standing rule that only approved organization data is
used.

---

### TECH-006 — Post-deploy Search Console export after re-crawl

**Status:** Open · scheduled, not yet actionable
**Baseline:** `GSC-BASELINE-PRE-DEPLOY-2026-09-25.md`
**Blocked by:** Google must re-crawl before an export means anything. The sitemap
was last read 22 September, before the 27 September deploy.

**Carried note on the baseline's 31 soft 404s:** these are **legacy URLs from the
previous WordPress site**, not defects in the current build. An earlier reading
of them as an empty-shell problem was incorrect and was withdrawn.

---

## Additional item found during verification

### TECH-007 — Intermediate path segment returns 403

**Status:** Open · non-blocking · not in Eric's §6 list; found 27 September

```text
/texas/dallas-fort-worth/loan-officers/     HTTP 403
a genuinely absent path on the same host    HTTP 404
```

A crawler walking up the canonical profile URL receives "forbidden" rather than
"not found". This is the server's default for a directory with no `index.html`,
not a deliberate choice.

**Blocked by:** Eric §4, which asks how this should be handled — a 404, a 301 to
the DFW market page, or a real section index.

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
