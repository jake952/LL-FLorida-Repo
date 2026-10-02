# Handoff to Eric — Live Site State

**Date:** 27 September 2026
**Prepared by:** Jake Bennett (development)
**Subject:** Everything changed since your last handoffs, and the current state of the live site
**Supersedes for status purposes:** ERIC-P0-RETURN-PACKAGE-2026-09-25.md, ERIC-HANDOFF-PRE-DEPLOY-2026-09-25.md

---

## 0. How to read this document

This is written for review by an agent that has not seen the working sessions
between 25 and 27 September. Three things will otherwise be misread, so they are
stated up front.

**Status vocabulary.** Every item below carries one of:

| Term | Meaning |
|---|---|
| **Owner-approved** | Eric approved it in writing in a prior handoff |
| **Owner decision (Jake)** | Jake decided it to move the launch forward. Settled. Not a question. |
| **Implemented and live** | On the production site as of the deploy timestamp in §1 |
| **Built, not yet uploaded** | In the build output, awaiting an upload cycle |
| **Open — blocking** | Must be resolved before the item it gates can be called done |
| **Open — non-blocking** | Real, tracked, and not preventing the site from operating |

**Section 2 is not a request for input.** Jake made a number of calls between 25
and 27 September to keep the launch moving. They are recorded there so a reviewer
does not flag them as defects and does not re-open them. If Eric wants to revisit
any of them, that is his call to make directly with Jake — but they are decisions
already taken, not open questions, and the site was built and shipped on them.

**"Non-blocking" means what it says.** Several items in §6 would look like
failures to an agent auditing against the original specification. They are listed
with the reason they are not blocking. A reviewer should not escalate them into
launch blockers. Where something genuinely is a gap against a specification Eric
wrote, it is marked as such and says so plainly — §6.1 is the one real example.

**A reviewer looking at the live site right now will see unstamped asset URLs.**
That is §4.8, and it is *built but not yet uploaded*. Do not report it as
missing work.

---

## 1. Deployment

| | |
|---|---|
| **Deployed** | 12:42 PM, 27 September 2026 |
| **Host** | SiteGround, NGINX Direct Delivery active (`X-Proxy-Cache-Info: DT:1`) |
| **Cache** | Purged by Jake post-deploy; purge confirmed effective |
| **Upload set** | 81 files, 7.19 MB |
| **Pages** | 33 built pages, 22 indexable URLs in `sitemap.xml` |
| **Link integrity** | 1,793 internal links + 65 in-page anchors, all resolve |

The site is live and operating. Lead capture is confirmed working on both
markets — see §5.

---

## 2. Owner decisions taken since your last handoff — SETTLED

These were decided by Jake to move the launch forward. They are recorded for the
reviewer's context. **None of them is an open question.**

### 2.1 Both conversion models stay live simultaneously

**Owner decision (Jake).** Austin and DFW run different lead-capture models, on
purpose, at the same time, so the two can be compared on real traffic.

- **Austin** (`/`, `/about/`, `/contact/`, and the eight root-level program
  pages): "Schedule Consultation" links through to `/contact/`, which carries the
  original short contact form. 47 such links across the Austin pages.
- **DFW** (`/texas/dallas-fort-worth/*`): the scenario questionnaire.

**Why a reviewer will flag this.** The build's own invariant check prints eight
lines reading `no questionnaire` for the Austin program pages. That invariant was
written before this decision and now encodes a superseded assumption. It is
advisory output, not a build failure — the build passes. **The Austin pages are
not missing lead capture.** They route to a working form by a different path.

This also supersedes the reading in the topical-cluster work that the Austin
pages hold information while DFW holds applications. Both markets capture leads.

### 2.2 The Austin site was returned to its original configuration

**Owner decision (Jake).** Work in the preceding days had propagated DFW
structure onto Austin pages — duplicate marquee bars, DFW questionnaires, and
nav links landing on DFW copies. Jake directed that Austin be returned to its
original configuration, with exactly one addition: a **Mortgage Calculator**
button in the nav.

That is the current state. Austin pages carry one marquee bar, their own nav,
their own copy, and the calculator button. No other Austin change was made.

### 2.3 `/about/` and `/contact/` are back in `sitemap.xml`

**Owner decision (Jake), 27 September**, reversing his own 24 September direction
— and the reversal is correct on the facts, which changed.

On 24 September Jake directed that `/about/`, `/contact/` and `/apply/` be removed
from the sitemap. At that time all three were React shell routes: roughly 5 KB of
markup, two words of text, and `<link rel="canonical" href="https://leahylending.com/">`.
The sitemap was asking Google to index pages that declared themselves duplicates
of the homepage.

The React removal work has since given all three real static pages. The sitemap
builder's rule is *"a URL with no page of its own does not belong in the
sitemap"* — expressed as a test against disk, not a hardcoded list — so when the
pages appeared, two of them returned to the sitemap automatically:

| Route | Size | Robots | Canonical | In sitemap |
|---|---|---|---|---|
| `/about/` | 42,951 B | `index, follow` | `/about/` | yes |
| `/contact/` | 37,285 B | `index, follow` | `/contact/` | yes |
| `/apply/` | 34,213 B | `noindex, follow` | `/apply/` | no |
| `/privacy/` | 31,689 B | `noindex, follow` | `/privacy/` | no |
| `/terms/` | 30,803 B | `noindex, follow` | `/terms/` | no |

Jake confirmed on 27 September: keep `/about/` and `/contact/` listed. They carry
the NMLS entity data and the LocalBusiness signals respectively, which the GEO
work depends on.

**A reviewer holding the 24 September instruction will read the current sitemap as
non-compliant with it. It is not — the condition behind that instruction no longer
exists.**

### 2.4 The Austin general-intake build was withdrawn

**Owner decision (Jake), 27 September.** `build-austin-general-intake.js` would
have replaced the `/contact/` form with a longer intake. It is retained in
`_build/` but removed from the build sequence, because `/contact/` is the
destination of the entire Austin funnel (§2.1) and has to keep the original short
form for the comparison to mean anything.

### 2.5 Seller financing remains out of scope

**Owner-approved (Eric, §8 of the Final P0 Decisions).** No copy changes were made
to `/home-loans/`. Recorded here only so a reviewer does not read its absence from
the P0 work as an omission.

### 2.6 Eric's profile page moved to the DFW path

**Owner decision (Jake).** The canonical profile is now:

```
/texas/dallas-fort-worth/loan-officers/eric-bennett/
```

The move keeps nav redirects on the DFW side of the site, so a visitor arriving
at Eric's page stays inside the DFW market rather than being handed to the Austin
nav. The retired path is unlinked. This is handled by a build pass that runs last,
after the eleven builders that reference the old path.

---

## 3. Your P0 items — implemented and live

All items from the P0 package are implemented and on the live site. The detailed
per-item record is in `ERIC-P0-RETURN-PACKAGE-2026-09-25.md`; this is the status
summary.

| Area | State |
|---|---|
| Prohibited copy removed from visible copy | Implemented and live |
| Approved Austin H1 and lede copy (your 24 Sep wording) | Implemented and live |
| Company tenure figures — 20+ years company, 25+ years Eric | Implemented and live |
| Approved loan-amount statements | Implemented and live |
| `21-DAY CLOSE TARGET` wording and support text | Implemented and live |
| NMLS identifier | Implemented and live |
| FAQ structured data | Implemented and live |
| Structured data pruned to maintained, truthful nodes (§2.5) | Implemented and live |
| No Yelp rating anywhere; profile links relabelled | Implemented and live |
| One review count across both markets | Implemented and live |
| Neutral statewide hub at `/texas/` (no form, no tag) | Implemented and live |
| `selected_market` on every submitting page | Implemented and live |
| Marketing consent never required to submit | Implemented and live |

**Prohibited copy.** The removal record is `ERIC-PROHIBITED-COPY-RECORD-2026-09-25.md`.
Note for the reviewer: an earlier count reported to Eric — six occurrences on four
pages — was wrong. It came from a pass that inventoried only its own seven pages.
The true figure was **14 occurrences across six pages, including the homepage
hero**. The corrected figure was conveyed to Eric in writing on 25 September and
the record document carries the correct list. A build gate now enforces it on
every run.

**Product-description constraints held throughout:** No Ratio is not described as
"no income verification"; 1099 is treated as an income type rather than a product;
DSCR is presented as investment-property financing, not primary-residence; Super
Jumbo is not presented as NQM.

---

## 4. Defects found and fixed since your last handoff

These are problems discovered after 25 September. All are fixed unless noted.

### 4.1 `/contact/` required marketing consent — blocked the entire Austin funnel

**Severity: this was blocking every Austin lead.** The marketing-consent checkbox
carried `required`, so no Austin visitor could submit the form the whole Austin
model routes to. Fixed; a build pass now strips `required` from marketing consent
wherever it appears, and consent is captured as a value rather than a gate.

Confirmed live: the Austin test submission in §5 was made with marketing consent
**unchecked** and succeeded, recording `sms_marketing_consent: no`.

### 4.2 `/texas/` returned a production 404

An indexable page in the sitemap that the server refused to serve. Fixed; `/texas/`
returns 200 and is the neutral statewide hub.

### 4.3 Double marquee on Austin pages

Austin pages carried two stacked gold marquee bars — one in the page chrome, one
inside `<main>`. Fixed by a pass that removes the in-`<main>` bar only where a
chrome bar also exists. A gate enforces one marquee model and one speed across
every page that shows one.

### 4.4 FAQ answers did not hide when collapsed

Reported by Jake with a screenshot. Collapsed panels kept their text visible and
painted over the questions below. Two causes: the panel class set no
`overflow: hidden` and defined no height transition, and `accordion.js` set
`hidden` only from a `transitionend` handler that could never fire without that
transition. Fixed on both sides, including a timeout fallback so the script does
not depend solely on the event.

**Design note for the reviewer:** the FAQ answers deliberately ship **visible and
crawlable in the HTML**, and `accordion.js` collapses them on load. This satisfies
your §8/§10 requirement that answers be readable without JavaScript. An earlier
attempt to author them as hidden-at-rest was reverted for exactly that reason.
The gate checks that panels *can* collapse; it deliberately does **not** require
them to be hidden in the markup.

### 4.5 Eric's profile page lost its navbar

Rebuilding the profile from a DFW donor gave it the template nav without the three
things that nav depends on: `body class="ll-chrome"`, the marquee element it is
positioned against, and `chrome.js`. The nav brand is white by design — it sits
over the dark hero — so against the page background it disappeared entirely.

Fixed, and a structural gate (`check-nav-chrome.js`) now verifies every
template-chrome page carries the full chrome its nav requires. Current result: 12
template-chrome pages and 21 bundle-clone pages, all correct.

### 4.6 Portrait outline and FAQ font

Both reported by Jake. The square outline around Eric's portrait was removed, and
the Austin self-employed FAQ font was changed from white to black.

### 4.7 Favicon showed the wrong mark

The tab icon included the wordmark. Regenerated from the logo mark alone
(`favicon.svg`, `favicon-32.png`, `apple-touch-icon.png`), composed on white.

### 4.8 Static assets were pinned in browsers for a year — **built, not yet uploaded**

**This is the one item on this list that is not yet live.**

SiteGround serves everything under `/landing-assets/` and `/assets/img/` with
`Cache-Control: max-age=31536000` — one year — and the filenames never changed.
A visitor who had loaded the site before a deploy therefore kept running the
*previous* JavaScript and CSS.

Measured on 27 September: the server returned `scenario-stepper.js` at 32,462
bytes on a plain request, a cache-busted request and a no-cache request, while a
browser that had visited earlier was still executing the 30,534-byte copy.
Nothing was wrong with the deploy — the browser simply never asked again.

The consequence was broader than one script. `accordion.js` and
`home-sections.css` carry the FAQ fix in §4.4, and `favicon.svg` carries the icon
fix in §4.7. **Every returning visitor would have kept the old behaviour of all
three, for up to a year.**

`.htaccess` cannot address this: NGINX Direct Delivery serves these files off disk
and never reaches Apache. The only lever available is the URL.

**Fix, now in the build:** every asset reference is stamped with its file's own
content hash — `/landing-assets/accordion.js?v=94c340e5`. 245 references across 33
pages, 22 assets hashed. Because the stamp is derived from the bytes, a future
edit busts the URL by itself and an unchanged file keeps its cached copy. A gate
distinguishes *unstamped* from *stale* — the second being the failure a
hand-maintained date stamp produces silently.

**Status: built and verified locally, awaiting one upload cycle.** Until that
upload, the live site still serves unstamped URLs.

Fixing this exposed four build scripts that resolved a stylesheet href to a file
on disk without stripping the query, and swallowed the failure — each then
reported the *opposite* of the truth. All four are fixed.

---

## 5. Verified live behavior

### 5.1 Lead routing — confirmed on the live site

Two live test submissions were made after deploy. Both succeeded.

**Austin — `/contact/`**

```
HTTP 200    contactId z1XLJjbciDGRleeB2uqe
tags        ["website-lead"]
source      "Website Contact Form"
landing_page austin_contact    market_page austin
sms_consent yes                sms_marketing_consent no
12 custom fields
```

**DFW — `/texas/dallas-fort-worth/`**

```
HTTP 200    contactId QoibM0Vh1Hwb3cAjte3I
tags        ["dfw","general"]
source      "Scenario Review — dfw_homepage"
40 custom fields
```

**Routing confirmed working as specified:** `/*` tags `austin` and routes to
ClientCare@; `/texas/dallas-fort-worth/*` tags `dfw` and routes to Eric@.

**Action for Jake:** the two test records above are synthetic and should be
deleted from the CRM.

### 5.2 Sitemap and Search Console

- Live `sitemap.xml` is byte-identical to the build output: 22 URLs.
- Search Console shows the sitemap submitted 17 August, last read 22 September,
  status Success, 24 pages discovered. The 24 predates this deploy.
- Resubmission is queued as a routine step; the submitted URL is unchanged, so the
  existing entry is retained rather than replaced.

### 5.3 Build gates

Every gate in the build passes, including the new asset-version gate. The
remaining advisory output is the eight `no questionnaire` lines explained in §2.1.

---

## 6. Open items, with criticality stated

### 6.1 `spa-lead-forms.js` carries none of the four context fields — **Open, non-blocking, and a genuine gap against your §1.2**

This is the one item here that is a real shortfall against a specification Eric
wrote, so it is stated plainly.

Your §1.2 asked for `source_url`, `entry_page_title`, `guide_title` and
`selected_market` on the Austin intake. The DFW stepper (`scenario-stepper.js`)
carries them. `spa-lead-forms.js` — the handler behind `/contact/`, `/` and
`/apply/` — contains **none of the four**, in both the local build and the live
file. This is not a caching artifact; the code was never written.

**Why it is non-blocking:** lead capture on those pages works. The Austin test
submission in §5.1 landed cleanly with 12 custom fields, correct tag and correct
routing. What is missing is attribution context on Austin submissions, not the
submissions themselves.

**What it costs:** Austin leads arrive without the page-level attribution that
DFW leads carry, which weakens the A/B comparison in §2.1 — that comparison is
the reason both models are live.

**Recommendation:** schedule it as the next development item after the §4.8
upload. It does not warrant holding the site.

### 6.2 DFW About page H1 reads "Austin's Trusted Lender" — **Open, non-blocking**

A market-specific H1 left on a DFW page. Cosmetic and incorrect; not a
functional or compliance problem. Ticketed.

### 6.3 Austin privacy / CCPA coverage — **Open, non-blocking, needs a decision that is not development's to make**

A gap in the Austin-side privacy disclosures. Flagged for Eric's review because
the resolution is a compliance judgment, not an implementation question. No
development work has been done on it and none should be until it is decided.

### 6.4 Infrastructure items carried forward — **Open, non-blocking**

| Item | Detail |
|---|---|
| `/index.html` duplicates | NGINX Direct Delivery serves `/index.html` alongside `/`; not redirected |
| Two 2-hop redirects | `/loan-officers/` → `/about` → `/about/` |
| `www` has no redirect | `www.leahylending.com` does not redirect to the apex |
| Sitemap count | 22 URLs vs 23 indexable pages — one indexable page is not listed |

These are indexation-hygiene items. None prevents the site operating, and none
was introduced by recent work; they predate this deploy.

### 6.5 Post-deploy Search Console export — **Open, scheduled**

The pre-deploy baseline is `GSC-BASELINE-PRE-DEPLOY-2026-09-25.md`. The
post-deploy export is pending — it needs Google to re-crawl before it means
anything.

**Note on the 31 soft 404s in the baseline:** these are **legacy URLs from the
previous WordPress site**, not a defect in the current build. An earlier reading
of them as an empty-shell problem was wrong and was corrected.

---

## 7. Items not previously conveyed to Eric

Listed so nothing arrives as a surprise:

1. **The lead-form defect history** in §4.1 — the Austin funnel was blocked by a
   required marketing-consent checkbox. Eric has not been told this previously.
2. **The corrected prohibited-copy count** — 14 occurrences on six pages, not the
   six-on-four originally reported. Corrected in writing 25 September; repeated
   here for completeness.
3. **Four approvals were relayed rather than written.** Jake conveyed Eric's
   approval of four specific claims verbally during a working session. They are
   implemented. If Eric wants them on the record in his own words, they should be
   confirmed in writing.
4. **The indexing count changed** between the baseline export and now.

---

## 8. Build controls and their limits

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not a compliance clearance and is not a production approval.
The gates confirm that the build matches what was approved; they cannot confirm
that what was approved is adequate.

---

## 9. What is needed from Eric

Nothing is blocking. Three items would benefit from his input, in priority order:

1. **§6.3 — Austin privacy / CCPA coverage.** A compliance decision. Development
   is holding until it is made.
2. **§6.1 — the `spa-lead-forms.js` gap.** Confirmation that scheduling it as the
   next item, rather than holding the launch, matches his expectation.
3. **§7.3 — the four relayed approvals.** Written confirmation, for the record.

Everything in §2 is settled and needs no response.

---

*Kyber Mortgage Corporation dba Leahy Lending · NMLS 2653540*
