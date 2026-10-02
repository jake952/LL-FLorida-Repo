# Closing Handoff — All Items Resolved or Assigned

**Date:** 27 September 2026
**To:** Eric Bennett
**From:** Jake Bennett / build
**Re:** Final disposition of your 27 September directives
**Supersedes:** ERIC-STATUS-AND-SECTION-2-2026-09-27.md

---

## Disposition summary

| Item | Disposition |
|---|---|
| §1 Asset URL versioning | Built and verified · **scope changed by owner decision — see below** |
| §2 Austin context fields | **Closed by owner decision. Will not be built.** |
| §3 Conversion-model test | Recorded · one metric affected by the §2 decision |
| §4 Profile canonical route | **Decided by owner: `/loan-officers/eric-bennett/`** · your pending decision is superseded |
| §5 Privacy / CCPA | PRIV-001 open · awaiting privacy/compliance owner |
| §6 Technical backlog | Two closed, one unblocked, four open |
| §7 Synthetic test records | Complete · evidence logged, records cleared |

Two of your directives were overridden by owner decision. Both are marked
plainly below rather than folded into a status line.

---

## §1 — Asset versioning: the upload is no longer isolated

**This changes what you authorized, and you should know before it ships.**

Your §1 required the deployment be "limited to asset-reference version stamping."
When that verification was completed, it held: 33 of 33 pages were byte-identical
to production once stamps were normalised away.

**That is no longer true.** The owner's §4 decision (below) moved Eric's profile
page, which repointed one link on 14 pages, added a page, removed a page, and
added a sitemap entry. The upload now carries two changes.

The scope was re-measured rather than estimated. Exact contents:

```text
CHANGE 1 — version stamping only ............... 18 pages
CHANGE 2 — stamping + profile link repointed ... 14 pages (1 link each)
NEW — not currently served ...................... 1 page
UNEXPLAINED ..................................... 0
```

Pages carrying the profile-link change:

```text
/                                        /texas/dallas-fort-worth/about/
/about/                                  /texas/dallas-fort-worth/asset-utilization-mortgages/
/bank-statement-loans/                   /texas/dallas-fort-worth/bank-statement-mortgages/
/self-employed-mortgage-loans/           /texas/dallas-fort-worth/construction-loans/
/texas/dallas-fort-worth/1099-mortgages/ /texas/dallas-fort-worth/dscr-investor-loans/
                                         /texas/dallas-fort-worth/no-ratio-mortgages/
                                         /texas/dallas-fort-worth/rsu-bonus-commission-income/
                                         /texas/dallas-fort-worth/self-employed-mortgages/
                                         /texas/dallas-fort-worth/super-jumbo-mortgages/
```

Files and sitemap:

```text
ADDED    /loan-officers/eric-bennett/index.html
REMOVED  /texas/dallas-fort-worth/loan-officers/eric-bennett/index.html
SITEMAP  22 -> 23 URLs; added /loan-officers/eric-bennett/
HTACCESS profile redirect rules reversed (detail in §4)
```

**Zero unexplained differences.** Every change is attributable to one of the two
authorized changes. Separating them into two uploads is possible but would
require rebuilding with the profile change reverted, uploading, then re-applying
it — two deploy cycles to isolate a change that is already fully enumerated
above. Recommendation is to ship them together, with this record as the scope
document. **Your call if you want them separated.**

### Versioning verification (unchanged)

```text
version stamps ............................ 237 references, 22 assets
asset file bytes vs live .................. 22 / 22 identical
robots.txt ................................ unchanged
```

Content-derived stamps (SHA-1 of file bytes, 8 chars), so a future edit busts the
URL by itself. The gate distinguishes *unstamped* from *stale*, and all three
states were negative-tested before it was trusted.

Returning-visitor mechanism confirmed on production: documents send no
`Cache-Control`, only `ETag` and `Last-Modified`, while assets send
`max-age=31536000`. A stale validator returns 200 with fresh HTML; a current one
returns 304 with zero bytes. Returning visitors therefore receive the new stamped
URLs and must fetch assets their browser has never seen.

**Status: awaiting upload.** Live pages still reference unstamped assets.

---

## §2 — Austin context fields: CLOSED by owner decision

**Owner decision (Jake Bennett, 27 September 2026): the four attribution fields
are not required on the Austin side. `spa-lead-forms.js` will not be modified.
This item is closed and will not be built.**

The implementation cost was assessed before the decision and was low — the DFW
stepper already implements all four fields in a form matching your rules exactly
(`origin + pathname` with no query; H1 with `document.title` fallback;
`guide_title` blank outside `/guides/`; market derived from `market_page`), so
the work would have been a port rather than a new design. The decision was made
on business grounds, not effort.

**One factual consequence for your §3 planning**, stated so the comparison is not
designed around a measurement that will not exist:

Your §3 metric list includes *"Austin versus DFW source and market attribution."*
That metric will be available for DFW and **not** for Austin. Because every
Austin program page converts through a single destination (`/contact/`, via 47
links), Austin submissions will not record which page originated the lead — all
Austin leads will be indistinguishable by source.

The other eight §3 metrics are unaffected: CTA clicks, form starts, completion
rate, qualified conversations, applications, funded-loan attribution, lead
response time, and scenario completeness / lead quality can all still be measured
on both sides.

**No further action. Raised once, decided, closed.**

---

## §3 — Conversion-model test

Recorded as a controlled comparison, not settled architecture, per your
direction. This corrected my earlier live-state handoff, which filed it under
"settled decisions" — accurate about the owner's authority to proceed, wrong
about the architecture's status.

```text
Austin:  program pages -> /contact/ -> short consultation form -> ClientCare
DFW:     market/program pages -> scenario questionnaire -> DFW / Eric routing
```

Both live temporarily. No change to Austin form depth is authorized and none has
been made.

**Sequencing:** your §3 made the comparison plan contingent on §1 and §2 going
live. §2 is now closed, so the only remaining prerequisite is the §1 upload.
The plan becomes due once that ships, with the attribution metric scoped as
DFW-only per §2 above.

Before the measurement window opens, the analytics events behind CTA clicks, form
starts and completion rate should be confirmed present. That check has not been
done and is not yet scheduled.

---

## §4 — Profile canonical route: DECIDED by owner

**Owner decision (Jake Bennett, 27 September 2026): the canonical profile route
is `/loan-officers/eric-bennett/`. The DFW path is retired.**

You asked that no further profile-route changes be made pending your response to
the route-decision package. **That hold was overridden by the owner.** The change
is implemented and verified. Recorded plainly rather than presented as a status
update.

The decision effectively answers all three of your §4 questions:

| Your question | Resolution |
|---|---|
| Which route is canonical | `/loan-officers/eric-bennett/` — the site-level path |
| Should the profile be listed in `sitemap.xml` | Yes. Now listed; sitemap 22 → 23 |
| How should the intermediate 403 be handled | Resolved — the directory no longer exists |

### Lead routing is unaffected — verified before the change

Routing is carried by two body attributes that travel with the page:

```html
data-crm-tags="dfw"  data-market-page="dallas_fort_worth"
```

`scenario-stepper.js` derives the market from those attributes, not from
`location.pathname` — verified by inspection before the move. **Submissions from
the profile still tag `dfw` and still route to Eric.**

An earlier caution that this move would send profile leads to ClientCare was
wrong, and is corrected here.

### Implemented state

```text
canonical tag    https://leahylending.com/loan-officers/eric-bennett/
Person schema    url matches canonical; NMLS identifier 288376 retained
internal links   13 to the new route, 0 to the retired path
sitemap          listed (23 URLs)
nav / chrome     intact; verified by rendering, not only by gate
```

Redirects, all single-hop:

```apache
RewriteRule ^leadership-team/eric-bennett/?$  /loan-officers/eric-bennett/ [R=301,L]
RewriteRule ^texas/dallas-fort-worth/loan-officers/eric-bennett/?$  /loan-officers/eric-bennett/ [R=301,L]
```

The DFW path was live between 25 and 27 September and may have been crawled or
linked, so it 301s to the restored canonical rather than 404ing.

### A gate had to be corrected

`check-404-and-legacy.js` asserted that `/loan-officers/eric-bennett/` must stay
unclaimed by any rule *because the canonical lived under the DFW path*. With the
canonical restored, that assertion was inverted — it fired on the very redirect
that should exist, and no longer protected the route that genuinely needed it.

It now asserts the invariant that holds under either arrangement: whichever URL
serves the page must not be matched by a RewriteRule, or the page is redirected
away from itself. Negative-tested by adding a shadowing rule and confirming
failure.

---

## §5 — Privacy / CCPA

**PRIV-001 open.** Awaiting the responsible Leahy/Kyber privacy and compliance
owner. Full detail: `ERIC-PRIVACY-REVIEW-TICKET-2026-09-27.md`.

No policy language, rights-process language, CCPA section, or page anchor was
authored, per your instruction. The ticket inventories wording currently visible
on the live site, quoted as published, and proposes no remedies.

Principal finding: **`/apply/` collects full name, email address and telephone
number and loads the lead-submission handler, with no consent checkbox of any
kind** — not even the "By submitting this form you agree to our Privacy Policy
and Terms & Conditions" line that `/contact/` and the DFW page carry.

Also identified: a "do not sell" statement with no supporting rights process; no
retention wording; no GLBA reference; a consent-withdrawal destination that
differs by market while the policy names one; and `/privacy/` carrying `noindex`.

A correction is recorded in the ticket: an initial scan suggested Austin lacked
the transactional consent DFW has. That was an artifact of the Austin markup,
whose inputs carry no `name` attributes. Verified directly — `/contact/` has both
consents, one required and one optional. **There is no Austin/DFW consent
asymmetry.**

**This is the only item requiring a decision outside development.**

---

## §6 — Technical backlog

| Ticket | Item | Status |
|---|---|---|
| TECH-001 | `www` to apex consolidation | Open |
| TECH-002 | `/index.html` duplicate handling | Open |
| TECH-003 | Two-hop `/loan-officers/` redirect | **Unblocked**, not yet done |
| TECH-004 | Sitemap 22 vs 23 | **CLOSED** |
| TECH-005 | DFW About page Austin H1 | Open |
| TECH-006 | Post-deploy Search Console export | Open, scheduled |
| TECH-007 | Intermediate 403 | **CLOSED** |

**TECH-004 and TECH-007 closed as consequences of the §4 decision**, not by
separate work. The unlisted page was the profile itself; outside the DFW block
the sitemap builder lists it automatically. The 403 was an empty directory that
no longer exists.

**TECH-003 is now unblocked** — it was held only because it sits in the same
`.htaccess` block as the frozen profile rules. It is a one-line change
(`/loan-officers/` and `/leadership-team/` currently 301 to `/about`, which then
301s to `/about/`). **Not done, because it is outside the authorized upload
scope.** Say the word and it ships with the next cycle.

**TECH-002 constraint worth carrying forward:** an `.htaccess` redirect cannot
fix it. SiteGround's NGINX Direct Delivery serves on-disk files without reaching
Apache — the same reason the asset caching could not be fixed from `.htaccess`.
It requires host configuration.

**TECH-006 carried note:** the 31 soft 404s in the pre-deploy baseline are legacy
URLs from the previous WordPress site, not defects in the current build. An
earlier reading of them as an empty-shell problem was incorrect and withdrawn.

---

## §7 — Synthetic test records: complete

Evidence preserved in `ERIC-QA-LOG-2026-09-27.md` — record IDs, tags, routing
outcomes, field counts and test conditions.

```text
z1XLJjbciDGRleeB2uqe   Austin   /contact/                  -> ClientCare
QoibM0Vh1Hwb3cAjte3I   DFW      /texas/dallas-fort-worth/  -> Eric
```

Both cleared for deletion. Your standing instruction that **no borrower data may
be used in future testing** is recorded as policy and governs the §1
post-deployment verification.

---

## Remaining actions

**Development, on the next upload:**

1. Ship the combined upload (§1 stamping + §4 route change), unless you want them
   separated.
2. Post-deployment verification against your §1 checklist, including confirming
   `/loan-officers/eric-bennett/` returns 200 rather than the 301 it returns
   today.

**Owner (Jake):** delete the two synthetic records.

**You (Eric):** route PRIV-001 to the privacy/compliance owner. Optionally:
confirm whether the combined upload is acceptable, and whether TECH-003 may ship
with it.

Nothing else is open.

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
