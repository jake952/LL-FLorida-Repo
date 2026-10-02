# DFW Staging Review — Revision 4

**To:** Eric Bennett
**From:** Jake Bennett
**Date:** 17 September 2026
**Supersedes:** Revision 3 and Addendum B

**Status:** 16 DFW pages built. All `noindex`. Nothing published.

---

## What this document is

Everything below is either a change you should see, a decision only you can
make, or something we need from you before launch. Sections 3 and 4 are the
parts that need a reply.

Two labels are used throughout and the difference matters:

- **Owner-approved** — you decided it
- **Owner-directed** — Jake asked for it and it is built, but it has not been
  through product, compliance, legal or privacy

**Nine claims currently shipping are owner-directed, not owner-approved.** They
are listed in Section 3.

---

# 1. Every decision from your 15 September response

| Your decision | Status |
|---|---|
| §1.1 One approved Super Jumbo wording | Implemented — 16 pages checked, 0 withdrawn variants |
| §1.2 No further footer-copy changes | **Superseded** — see 3.1 |
| §1.3 No tenure statement in new copy | **Superseded** — see 3.1 and 3.2 |
| §1.4 No superlative claims | **Superseded** — see 3.2 |
| §1.5 H1 and title tag wording | **Wording superseded**, principle kept — see 3.3 |
| §1.6 No invisible BreadcrumbList | Implemented — removed |
| §1.7 Omitted footer links confirmed | Implemented |
| §1.8 1099 footer label | Implemented — "Mortgage Options for 1099 Income" |
| §2.1 Approved routes + 301s | Implemented, one hop, query strings preserved |
| §2.2 Hero CTA removals | Implemented, approved labels in place |
| §2.3 Analytics event renames | Implemented suite-wide |
| §2.4 FAQ payload fields | Implemented — `faq_index`, `faq_id`, `expanded_state` |
| §2.5 Structured data | Implemented — see 2.4 |
| §2.6 No byline | Implemented |
| §2.7 Market-name overrides | Implemented — 501 form labels checked, none carry a market name |
| §2.8 Reveal-animation fix | Implemented |
| §2.9 Review-factor copy | Implemented |
| §2.10 About-page tenure reverted | Implemented — H1 untouched as directed |
| §2.11 CRM changes pending | Implemented — `investor_experience` restored as pending |
| §3 Super Jumbo page structure | Implemented — one gap, see 5.1 |
| §4 Product and content rules | Enforced, with the exceptions in Section 3 |
| §6 Placeholder and indexing rules | Implemented — 0 unresolved placeholders, 0 indexable pages |
| §7 Documentation | Implemented |
| §8 Deliverables | Section 6 |

---

# 2. What changed on the pages since your last review

## 2.1 Hero headings and titles

Every program page now highlights the **program type** in gold and reads
**Loans** rather than Mortgages:

```text
Super Jumbo Loans in Dallas–Fort Worth          (gold: Super Jumbo)
Bank Statement Loans in Dallas–Fort Worth       (gold: Bank Statement)
Asset Utilization Loans in Dallas–Fort Worth    (gold: Asset Utilization)
1099 Income Loans in Dallas–Fort Worth          (gold: 1099 Income)
No Ratio Loans in Dallas–Fort Worth             (gold: No Ratio)
DSCR Investor Loans in Dallas–Fort Worth        (gold: DSCR Investor)
Self-Employed Loans in Dallas–Fort Worth        (gold: Self-Employed)
Construction Loans in Dallas–Fort Worth         (gold: Construction)
RSU, Bonus & Commission Income Loans in Dallas–Fort Worth
```

Title tags, `og:title` and the WebPage schema name now match the heading on all
nine. This changes your §1.5 wording — see 3.3.

## 2.2 Navigation

The Self-Employed dropdown now reads:

```text
Self-Employed Hub
Bank Statement
1099 Income
No Ratio
Asset Utilization
Bonus / RSU Income
```

Super Jumbo has been removed from the dropdown; it has had its own top-level
tab since 15 September, and appearing in both implied two destinations. The
"Loans", "Mortgage", "Documentation" and "Options" suffixes are gone — the
group heading above already says Loans. The 1099 entry avoids "1099 mortgage",
per that handoff.

## 2.3 The gold marquee bar

Restored, and now on **all 16 DFW pages**, carrying the DFW number
`(214) 531-6416`. It reads:

```text
WE SAY YES WHEN OTHERS SAY NO · LEAHY LENDING SAYS YES · SINCE 2002 ·
(214) 531-6416 · DALLAS–FORT WORTH'S TRUSTED MORTGAGE SPECIALIST ·
OVER $1 BILLION IN LOANS FUNDED
```

**Four of those six strings are on your exclusion lists.** See 3.2.

## 2.4 Homepage hero panel

The seven-item options list was replaced by the badge from the Austin hero:
**"We Say Yes When Others Say No / No Tax Returns Required"**. A five-star row
and a customer testimonial were added, and the bottom bar rebuilt to match
Austin. The stat tiles now read:

```text
25+ Years of Experience    $1B+ In Loans Funded
258 Five-Star Reviews      14 States Licensed
```

The two bracketed placeholders are gone — figures supplied 15 September.

## 2.5 Structured data

`Service`, `Audience`, `BreadcrumbList` and its list items were removed. The
`Service` node had been asserting the same `serviceType` — "Bank statement
mortgage documentation review" — on six different products, which was untrue on
all six. Kept: `WebPage`, `FinancialService` with the real Austin address, and
`FAQPage` only where every question and answer is visible on the page.

## 2.6 Layout

Card rows are laid out by how many cards they hold: four across in one row,
five across on the homepage's Alternative Documentation group, three per row
for six. The Alternative Documentation and High-Balance groups are 25% wider
than the body text where the screen allows it. Hero headings had a line-spacing
fault that overlapped descenders on wide screens; fixed.

---

# 3. Decisions we need from you

Each of these is shipping in staging now and has not been reviewed. Nothing
here is published.

## 3.1 Tenure wording

The footer and homepage tile now read **"25+ Years of Experience"**, replacing
"25+ Years in Business". The reason: 2002 to 2026 is 24 years, so the old
wording contradicted the founding date stated elsewhere on the site.

This reverses two of your instructions — the homepage handoff §5 ("do not call
company history '25+ years of experience' if the verified claim is business
tenure") and §1.2 ("do not make further global footer-copy changes at this
time").

**Neither figure is substantiated.** Changing the wording did not resolve that.

> **Decision:** approve "25+ Years of Experience", give different wording, or
> remove the tenure claim until evidence exists.

## 3.2 Claims on the exclusion lists

These are live in staging across the pages shown:

| Claim | Where | Your rule |
|---|---|---|
| `No Tax Returns Required` | homepage hero badge | **§4.1 standing prohibited list** |
| `DALLAS–FORT WORTH'S TRUSTED MORTGAGE SPECIALIST` | marquee, all 16 pages | §1.4 superlative + DFW presence claim |
| `WE SAY YES WHEN OTHERS SAY NO` | marquee, all 16 pages | §1.4; homepage §2 CTA language |
| `LEAHY LENDING SAYS YES` | marquee, all 16 pages | homepage §4 removal list |
| `SINCE 2002` | marquee, all 16 pages | §1.3 |
| `OVER $1 BILLION IN LOANS FUNDED` | marquee, all 16 pages | unsubstantiated |
| `258 Five-Star Reviews` | homepage hero | §6 — not published until substantiated |
| Michael R. testimonial, incl. `$1.4M` | homepage hero | §6 — testimonials, and a named borrower |

Three of these are worth separating out:

**`No Tax Returns Required`** is not an unapproved phrasing of something true.
It is one of the seven claims on your §4.1 list, which exists to keep it off the
site, and it now sits in the first screenful of the DFW homepage.

**`DALLAS–FORT WORTH'S TRUSTED MORTGAGE SPECIALIST`** asserts a market
standing. Leahy Lending is an Austin company with no DFW office. The page's own
eyebrow already reads "DALLAS–FORT WORTH NON-QM MORTGAGE SPECIALISTS", which is
descriptive, looks identical in the bar, and claims nothing — the cheapest fix
in this document if you want one.

**The testimonial** names a borrower and a loan amount. Written permission from
the person quoted is a separate requirement from substantiating the outcome.

> **Decision:** approve each in writing, supply replacement wording, or we pull
> them. Removing any one of them is a single change with no side effects.

## 3.3 H1 and title tag wording

Your §1.5 set "Asset Utilization Mortgages in Dallas–Fort Worth" for both the
visible H1 and the title tag. The heading now reads "Asset Utilization Loans",
and the title tag follows it.

The wording is superseded. The principle — that a page names itself the same
way in its heading and its title — is now enforced on all nine program pages,
including `og:title` and the schema name.

> **Decision:** confirm "Loans", or we return to your §1.5 wording. These are
> the visible page names and what appears in search results.

## 3.4 Smaller items

| Item | Question |
|---|---|
| "Leahy Lending offers" | Your §1.1 lists it among withdrawn wordings. It also opens the home-loans hero in an unrelated sentence about bridge and construction lending. We enforce it only where a loan amount is stated. Confirm, or the home-loans hero needs new copy. |
| Super Jumbo H1 casing | §3 wrote the hero in capitals. We used title case, matching every sibling page and your §1.5. Confirm or we change it. |
| `Organization` / `WebSite` schema | §2.5 names `Organization` in the do-not-emit list. It survives on the calculator page, where it is the only organizational node. Remove or keep? |
| About page figures | The About page says "251+ Five-Star Reviews" and "20+ Years of Experience" while the rest of the site says 258 and 25+. §2.10 puts About out of scope, so we left it. |

---

# 4. What we need you to supply

| # | Item | Needed for |
|---|---|---|
| 1 | Evidence for the tenure claim, and the final wording | 3.1 |
| 2 | Written approval or replacement wording for each claim in 3.2 | Any production release |
| 3 | Source for **258 five-star reviews** — platform and date | §6 |
| 4 | Licensing footprint of record. The site has said 19 and 14; current pages say 14 | §6 |
| 5 | Evidence for **$1B+ in loans funded** | §6 |
| 6 | Written testimonial permission, or we remove the quote | §6 |
| 7 | Super Jumbo handoff items 1–6, or confirmation the page ships without the Full Documentation card | 5.1 |
| 8 | Confirmation on 3.3 and the four items in 3.4 | Page naming |

---

# 5. Still open

## 5.1 Super Jumbo

The standalone handoff items 1–6 have not reached us. Your §3 supplied the page
structure and it is built. The one gap is the **Full Documentation card** named
in the Final Checklist — no copy was supplied and none was invented.

## 5.2 External dependencies

**CRM.** `super_jumbo_loan_range` must exist and be tested before launch — two
DFW forms post it today, and an unregistered field is discarded without error.
`program_interest` changed from `dscr_investor` to `dscr`, so any GoHighLevel
workflow routing on the old value will stop matching. All 13 fields in your
§5.1 need a monitored submission path.

**Analytics.** GA4 configuration, dashboards and downstream consumers need
updating for `hero_form_start`, `hero_form_step_complete` and `expanded_state`.
No GA4 or GTM container is installed, so nothing is being measured today.

**Compliance, privacy, publishing.** Everything in your §5.3 remains open.

30 blockers are itemised by owner — product, compliance/legal, privacy, CRM,
analytics, design/content, publishing — in `LAUNCH-BLOCKERS.md`.

---

# 6. Attached

| Document | Contents |
|---|---|
| `PUBLIC-CLAIMS.md` | 27 claims: exact wording, location, source, status |
| `LAUNCH-BLOCKERS.md` | 30 blockers grouped by owner |
| `STAGING-CHANGE-LOG.md` | Every change with reason, revert path and approval status |
| `CRM-ROUTING.md` | Field and value inventory, confirmed vs pending |
| `ANALYTICS-EVENTS.md` | Events, triggers, properties, restricted-data confirmation |
| `ROUTES.md` | Routes, redirects, canonicals, sitemap |

**Review links** (staging, `noindex`) — under `/texas/dallas-fort-worth/`:
`index.html` · `super-jumbo-mortgages/` · `asset-utilization-mortgages/` ·
`bank-statement-mortgages/` · `self-employed-mortgages/` · `dscr-investor-loans/` ·
`rsu-bonus-commission-income/` · `1099-mortgages/` · `no-ratio-mortgages/`

---

# 7. Scope of our checks

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not a compliance review. Several of the checks above pass
only because the claims in Section 3 were deliberately allowed through pending
your decision.

Nothing moves to production until Sections 3 and 4 are answered and the items in
`LAUNCH-BLOCKERS.md` are resolved.
