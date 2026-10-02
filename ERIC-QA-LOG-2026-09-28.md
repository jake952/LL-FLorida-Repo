# Deployment / QA Log — Post-Deployment Verification Round 2

**Date:** 28 September 2026
**Scope:** Eric §1 post-deployment checklist, combined upload (asset versioning + profile route restoration)
**Status:** COMPLETE · records cleared for deletion

---

## Deployment verified

The combined upload authorized on 27 September is live.

```text
/loan-officers/eric-bennett/                          200   (restored canonical)
/texas/dallas-fort-worth/loan-officers/eric-bennett/  301 -> canonical
/leadership-team/eric-bennett/                        301 -> canonical (one hop)
sitemap.xml                                           23 URLs, profile listed
```

---

## Eric §1 checklist — results

### [x] All rendered asset references use content-derived version values

```text
stamped references across all live pages ... 245
unstamped references ....................... 0
distinct stamped URLs ...................... 19
```

### [x] No unstamped production asset references remain

Zero, verified by scanning every live page rather than the build output.

### [x] Each stamped URL resolves, and its stamp matches the bytes served

19 of 19. The declared hash was compared against a SHA-1 of the actual response
body, so a stamp pointing at stale content would have been caught.

### [x] Routes, canonical tags, robots, sitemap, redirects unchanged

```text
self-canonical pages ....... 33 / 33
sitemap.xml ................ matches the build exactly
robots.txt ................. matches the build exactly
redirects .................. all single-hop, canonical serves 200
```

### [x] Returning-visitor simulation

For each asset Eric named, the bare URL still resolves (nothing 404s for anyone
holding an in-flight page), the stamped URL resolves, and the served bytes hash
to exactly the stamp the page declares:

```text
accordion.js          bare 200   stamped 200   served 94c340e5   build 94c340e5
scenario-stepper.js   bare 200   stamped 200   served ee3e1462   build ee3e1462
home-sections.css     bare 200   stamped 200   served 95e1aab6   build 95e1aab6
favicon.svg           bare 200   stamped 200   served eb797a88   build eb797a88
```

Document layer, which is what carries the new URLs to a returning visitor:

```text
Cache-Control on documents ... none (revalidates)
stale validator .............. HTTP 200, 85,766 bytes of fresh HTML
current validator ............ HTTP 304, 0 bytes
```

### [x] Austin contact flow functions

**Route:** `/contact/` · submitted 28 September 2026

```text
Result ............. success state rendered
                     ("We'll Be in Touch! ... within 1 business day")
Identifier ......... QA Test Austin 0928 / qa-austin-20260928@example.com
Consents ........... transactional CHECKED, marketing CHECKED
Handler ............ spa-lead-forms.js?v=f0a85c8b
```

**Limitation, stated rather than glossed:** the CRM POST was not captured for
this submission, so no contact ID was recorded. Success is evidenced by the
confirmation state, which the handler renders only on a successful response. The
record is identifiable in the CRM by the synthetic name and email above.

This round deliberately checked **both** consents, complementing the 27 September
test which submitted with marketing consent unchecked. Between the two rounds,
both consent paths are now exercised.

### [x] DFW intake flow functions

**Route:** `/texas/dallas-fort-worth/` · submitted 28 September 2026

```text
Result ............. HTTP 200
Endpoint ........... ll-crm-integration2.vercel.app/api/contact
Response ........... {"success":true,"contactId":"xH7G9M5dlJBr8HEttL1J"}
Identifier ......... QA Test DFW 0928 / qa-dfw-20260928@example.com
Handler ............ scenario-stepper.js?v=ee3e1462
```

**This is the material confirmation.** The handler that processed this submission
is `?v=ee3e1462` — the current build containing all four context fields. On 27
September the browser was executing a superseded 30,534-byte copy that lacked
them. The version stamping resolved that: the page now references a URL the
stale cache cannot satisfy.

**For Jake to confirm in GHL on record `xH7G9M5dlJBr8HEttL1J`:** that
`source_url`, `entry_page_title`, `guide_title` and `selected_market` are
present. The correct script was demonstrably loaded and executed; the CRM record
is the authoritative check on retention, and that is your side of the
integration.

---

## Validation behavior observed

Two required fields correctly blocked submission until completed:

```text
preferred_contact_method, best_contact_time   (required selects)
discovery_source                              (required, visitor self-reported)
```

`discovery_source` is the visitor's own attribution answer. It is captured as
submitted and is never overwritten by analytics attribution, per standing policy.

The honeypot field `ll_hp` was left unchecked, as a genuine visitor would.

---

## Analytics observed during the test

Events fired to GA4 property `G-2LMXT6BVCY` during the DFW submission:

```text
hero_form_start          ep.market=dallas_fort_worth  ep.program_interest=general
form_start               epn.form_length=94  ep.first_field_name=transaction_goal
hero_form_step_complete  ep.market=dallas_fort_worth
```

**Privacy check:** the payloads carry market, program interest, field names and
form length only. No name, email, phone, or any other personal value appeared in
any analytics call, in any URL, or in console output. Consistent with the
standing rule against personal data in analytics labels, URLs, console logging
and client-side error reporting.

---

## Records cleared for deletion

| Identifier | Market | Route |
|---|---|---|
| `xH7G9M5dlJBr8HEttL1J` | DFW | `/texas/dallas-fort-worth/` |
| QA Test Austin 0928 / qa-austin-20260928@example.com | Austin | `/contact/` |

Plus the two from the 27 September round, if not already removed:

```text
z1XLJjbciDGRleeB2uqe   Austin
QoibM0Vh1Hwb3cAjte3I   DFW
```

All four are synthetic. **No borrower data was used**, per Eric §7.

**Action for Jake:** delete all four.

---

## Note for future test rounds

The Austin submission's response was not captured because request instrumentation
was added only before the DFW test. Future rounds will instrument both `fetch`
and `XMLHttpRequest` before the first submission, so every round records a
contact ID without needing a repeat submission.

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
