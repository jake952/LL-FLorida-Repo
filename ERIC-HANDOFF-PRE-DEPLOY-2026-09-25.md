# Handoff: Pre-Deployment Status and Two Decisions

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 25 September 2026
**Re:** Since your copy approval — what is done, what the baseline found, what I need from you

**Nothing has been published.** P0 is complete in staging and waiting on
deployment. Build: 63 steps green, 33 pages, 1,810 internal links resolving,
23 indexable / 10 held back, 51 of 51 P0 checks passing.

---

# 1. Your approved copy is applied

All seven strings from your §1 verified present in rendered staging HTML, and
both wordings you rejected verified absent.

```text
/bank-statement-loans/   When Tax Returns Do Not Reflect Your Business
                         May be reviewed using bank statements when tax returns
                         do not fully reflect current business cash flow
/  (homepage)            For borrowers whose tax returns do not fully reflect
                         current business cash flow
                         A review of 12–24 months of bank statements may be worth
                         considering when tax returns do not fully reflect current
                         business cash flow.
                         Depending on the situation, a review may consider bank
                         statements, a CPA-prepared profit and loss statement, or
                         an asset-based approach.
                         Bank statements, P&L, or asset-based review
/apply/                  Documentation approaches beyond tax returns for
                         self-employed borrowers

REMOVED, as you directed
  "Reviewed on bank statements rather than tax returns"
  "may be an option when tax returns…"
```

Barred phrases in visible copy across every shipped page: **zero**. The only
remaining match anywhere is the mandated negation on `/texas/` ("It is not the
same as no income verification"), which the gate recognises and protects.

Seller financing untouched. Both `/home-loans/` pages still read "Home Loan
Solutions" with all four references intact.

---

# 2. CRM fields created; routing verified; retention still unproven

Jake created all four fields in the `Page / campaign context` folder alongside
`landing_page`, `market_page` and `program_interest`.

**Market routing verified** — the two intakes are cleanly separated:

```text
                     AUSTIN /contact/           DFW /texas/dallas-fort-worth/
  tags               ["austin","general"]       ["dfw","general"]
  selected_market    austin                     dfw
  market_page        austin                     dallas_fort_worth
  landing_page       austin_contact             dfw_homepage
  source             Scenario Review – Austin   Scenario Review — dfw_homepage
  source_url         /contact/                  /texas/dallas-fort-worth/
  entry_page_title   (page H1, captured)        (page H1, captured)
  guide_title        empty                      empty
  custom fields      38                         38   ← identical shape
```

Neither payload carries the other market's identity.

**Retention is not yet proven, and cannot be from staging.** A submission from
the local origin is refused by the integration's CORS policy — correct behavior,
and production will pass because the origin will be `leahylending.com`. No record
was written. Per your §4, both tests run from the production origin once live.
That closes as deployment step 4.

---

# 3. Search Console baseline — captured before deployment, per your §3

Full detail in `GSC-BASELINE-PRE-DEPLOY-2026-09-25.md`. Four findings bear on
decisions you have already made.

## 3.1 FMO's central claim is wrong in the specific, right in substance

They state 100% of Google visits are branded, and that searches for a lender, a
loan type or a city produce none. First-party data:

```text
                QUERIES   CLICKS           IMPRESSIONS
  branded            23   76  (95.0%)      423  ( 5.7%)
  non-branded       475    4  ( 5.0%)    6,968  (94.3%)
```

Two of those four non-branded clicks are a lender search and a city search — the
exact category they said produced none. At four clicks per quarter the
substantive point stands, but the figure they built the pitch on does not survive
contact with your own data.

**The inverse split is the finding they missed.** Branded queries are 5.7% of
impressions and 95% of clicks. Non-branded are 94.3% of impressions and 5% of
clicks. The site is shown roughly 7,000 times a quarter for non-branded searches
and almost never clicked. That is a different problem from invisibility, and it
sits squarely on what the listing says once it appears — which is what the direct
answers and FAQ markup in P0 address.

## 3.2 Every product group you named is at zero clicks

```text
  self-employed        15 queries    0 clicks      67 impressions
  Bank Statement        1 query      0 clicks       1 impression
  Asset Utilization     4 queries    0 clicks      48 impressions
  No Ratio              4 queries    0 clicks       7 impressions
  DSCR                  0 queries    0 clicks       0 impressions
  investor              3 queries    0 clicks      16 impressions
  Super Jumbo           7 queries    0 clicks     122 impressions
```

DSCR returns no query at all. Bank Statement has one impression in three months.
Austin shows 1,619 impressions, but 700 come from `turnkey lender austin` at
average position 45 — a competitor's brand name, not demand for Leahy Lending.

## 3.3 The site currently earns no rich results

The Search Appearance export is empty — no FAQ results, no sitelinks, nothing.
Useful as a clean binary: once the FAQ markup in P0 is live, that field becoming
non-empty is unambiguous evidence the structured data is being read.

## 3.4 One anomaly I will not guess at

Several head terms show average position ~1 with 100–200 impressions and zero
clicks — `mortgage lenders near me`, `home lenders near me`, `portfolio loan`.
That is not normal organic behavior, and with Search Appearance empty there is no
recorded result type explaining it. Possible causes include map-pack or Business
Profile impressions being attributed here. It needs one session in the Search
Console interface filtering by search appearance **before anyone, including an
agency, builds an argument on those numbers.**

---

# 4. Decisions I need from you

## 4.1 `www` duplicate host — live now, not fixed by P0

Both hosts serve 200 with no redirect between them. Verified against production
today:

```text
  https://leahylending.com/              200
  https://www.leahylending.com/          200    ← same content, no redirect
  https://www.leahylending.com/contact   200
  https://leahylending.com/contact/      200
```

Google has indexed both, and the split is material:

```text
  https://leahylending.com          168 clicks    9,874 impressions
  https://www.leahylending.com        3 clicks    1,711 impressions   (~15%)

  /contact under two addresses
    https://www.leahylending.com/contact     2 clicks    525 impressions
    https://leahylending.com/contact/        3 clicks    239 impressions
```

The `www` copy of `/contact` earns more than twice the impressions of the
canonical one.

Every canonical tag in the P0 build declares the non-www form, which is a strong
signal. But **there is no `www` → non-www 301 in `.htaccess`**, so after
deployment those addresses still return 200.

**I have not added one.** Your direction is that P0 creates or alters no
redirects, and this would be a new rule affecting every URL on the site.

```text
OPTION A  Add the www -> non-www 301 to the P0 deployment. One rule, standard,
          well understood. Consolidates ~15% of impressions onto the canonical
          host immediately. Deviates from "no redirect changes in P0".

OPTION B  Deploy P0 as approved and let the canonical tags do the work. Slower
          and less certain — a canonical is a hint, a 301 is not — but it holds
          your rule exactly and the www URLs are not broken.

OPTION C  Deploy P0 as approved, then handle www as its own small change with
          its own verification, after Phase B baseline capture.

My recommendation is C. It keeps P0 exactly as you approved it, and it gives the
redirect its own before/after measurement rather than mixing it into a release
that already changes a great deal.
```

Related and noted, no change made: the "Force HTTPS" block in `.htaccess` is
commented out with a note to enable it after SSL activation. SSL is plainly
active and `http://` already redirects to `https://`, so that block appears
redundant rather than pending.

## 4.2 Two bullets using the construction you corrected

You replaced "Reviewed on bank statements rather than tax returns" on
`/bank-statement-loans/`, on the grounds that it should not imply tax returns are
never reviewed. Two bullets on `/self-employed-mortgage-loans/` use the same
opening construction:

```text
  Reviewed on bank statements or a CPA-prepared P&L        (appears twice)
```

They do not carry the specific defect you named — there is no "rather than tax
returns" — and they were inside the block you approved. But it is the same
assertive "Reviewed on…" that you softened to "May be reviewed using…".

I have left them exactly as approved rather than rewrite approved copy on my own
judgment. Confirm whether you want the same treatment applied.

---

# 5. What happens next, without needing you again

```text
On your answer to 4.1 and 4.2, and your authorization to publish:

  1  Jake uploads the full 81-file web root including .htaccess, atomically
  2  Exact deploy timestamp recorded as the Phase B boundary
  3  I verify all 28 legacy 301s live, /index.html and the directory duplicates
     returning one-hop 301s, and status/canonical/robots/raw HTML on all 33 routes
  4  I run the Austin and DFW intake tests from the production origin with
     synthetic data; Jake confirms in GoHighLevel that every field is retained
     and neither submission cross-routes
  5  I assemble your §6 production return package, including the two separate
     tickets you asked for — the DFW About-page H1 and the Austin privacy/CCPA
     link review
  6  Phase B baseline re-runs at 2, 4, 8 and 12 weeks from the same script, so
     every comparison is like for like
```

P1 guides remain unstarted and unauthorized pending Phase B and your separate
approval.

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not compliance clearance and not production approval. The
Search Console figures are first-party measurement, not a forecast; no claim is
made that publishing P0 will change any of them. No production deployment has
been made and none is authorized.
