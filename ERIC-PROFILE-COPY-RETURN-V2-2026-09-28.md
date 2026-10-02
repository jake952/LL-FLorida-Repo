# Return Package — Eric Bennett Profile, Exact Approved Copy Correction

**Date:** 28 September 2026
**Responding to:** "Eric Bennett Profile — Exact Approved Copy Correction Handoff", 28 September 2026
**Supersedes:** ERIC-PROFILE-COPY-RETURN-2026-09-28.md
**Route:** `/loan-officers/eric-bennett/`
**Status:** STAGING ONLY — no production deployment. Awaiting explicit Eric approval.

---

## What changed against the previous return package

The earlier handoff of the same date **required** a supporting descriptor beneath
the name. This handoff states that phrase was never approved, bars **both**
variants across every zone, and forbids substituting any replacement.

That descriptor has been **removed completely**. Nothing replaced it — the public
title now follows the name directly. Every other correction carries forward
unchanged.

```text
"Mortgage Guidance" occurrences anywhere in the profile: 0
```

---

## 1. Exact raw HTML — hero

```html
<section class="lo-hero" aria-labelledby="page-title">
    <div class="lo-wrap lo-hero-grid">
      <div class="lo-portrait">
        <img src="/assets/img/team-eric-bennett.png" alt="Eric Bennett, Executive Vice President and Mortgage Loan Originator at Leahy Lending"
             width="420" height="420" loading="eager" decoding="async">
      </div>
      <div class="lo-intro">
        <h1 id="page-title">Eric Bennett</h1>
        <p class="lo-title">Executive Vice President &amp; Mortgage Loan Originator</p>
        <p class="lo-nmls">NMLS #288376</p>
        <p class="lo-credential">25+ Years of Mortgage Experience</p>
        <p class="lo-entity">Eric Bennett is Executive Vice President &amp; Mortgage Loan Originator at Leahy Lending, a DBA of Kyber Mortgage Corporation.</p>
        <p class="lo-market">Eric works with Dallas–Fort Worth and Austin borrowers, clients throughout Texas, and borrowers in approved Florida markets.</p>
        <div class="lo-ctas">
          <a class="lo-cta-primary" href="#scenario-review"
             data-track="eric_profile_cta_click" data-cta-location="profile_hero"
             data-module-location="profile_hero">START A DFW SCENARIO REVIEW →</a>
          <a class="lo-cta-secondary" href="/texas/dallas-fort-worth/contact/"
             data-track="eric_profile_cta_click" data-cta-location="profile_hero_contact"
             data-module-location="profile_hero">CONTACT ERIC →</a>
        </div>
      </div>
    </div>
  </section>
```

`&amp;` is the HTML entity for `&`; it renders as `Executive Vice President &
Mortgage Loan Originator`. No element sits between the H1 and the public title.

---

## 2. Exact raw HTML — complete About Eric

```html
<section class="lo-bio" aria-labelledby="bio-heading">
    <div class="lo-wrap lo-bio-grid">
      <div class="lo-bio-copy">
        <h2 id="bio-heading">About Eric</h2>

<p>Eric Bennett is Executive Vice President &amp; Mortgage Loan Originator at Leahy Lending, a DBA of Kyber Mortgage Corporation. He entered the mortgage industry in 2000 and brings more than 25 years of experience across retail, wholesale, and consumer-direct lending.</p>
<p>Based in Highland Village, Texas, Eric works with borrowers in Dallas–Fort Worth, Austin, throughout Texas, and in approved Florida markets.</p>
<p>Eric works with borrowers whose financial profiles or property goals may call for a more detailed mortgage conversation than a standard transaction. His focus includes self-employed and complex-income scenarios; Bank Statement, Asset Utilization, and No Ratio mortgage options; 1099, bonus, commission, RSU, and other variable-income documentation; Super Jumbo and high-balance purchase or refinance scenarios; and approved real-estate investor financing paths.</p>
<p>Eric works with Dallas–Fort Worth and Austin borrowers, clients throughout Texas, and borrowers in approved Florida markets. His approach is to help borrowers and referral partners understand the documentation, property, income, asset, credit, and loan-structure questions that may matter in a scenario—then identify mortgage paths that may be relevant based on the full picture.</p>
<p>Over the course of his career, Eric has worked in origination, sales, operations, management, production leadership, and mortgage technology and workflow development. That background helps him communicate complex mortgage topics in a direct, practical way and collaborate effectively with borrowers, real-estate professionals, financial advisors, CPAs, attorneys, insurance professionals, and other referral partners.</p>
<p>Eric is also a real-estate investor and brings an owner’s perspective to conversations involving investment property, real-estate strategy, and higher-value financing decisions. He does not treat any single documentation path or financing structure as a universal answer; each scenario requires review of the borrower, property, lender, program, and applicable requirements.</p>
<p>Before entering the mortgage industry, Eric served in the U.S. Army. That experience continues to shape his direct, service-oriented approach to working with borrowers, referral partners, and teams. He is a husband and father of four, and he and his wife enjoy family time, technology and nerd culture—especially superheroes and Star Wars—and exploring fine bourbon together.</p>
```

Seven paragraphs, in the handoff's order. Highland Village is paragraph 2; the
U.S. Army paragraph is last.

---

## 3. Current-versus-revised copy diff

Measured against the page as it stood before **any** of today's corrections.

| Element | Before | After |
|---|---|---|
| **H1** | `Eric Bennett \| Mortgage Guidance for Complex Income and High-Balance Scenarios` | `Eric Bennett` |
| **Descriptor** | *(joined to the H1)* | **removed entirely — nothing substituted** |
| **Public title** | `Executive Vice President \| Mortgage Loan Originator` | `Executive Vice President & Mortgage Loan Originator` |
| **Entity statement** | `...Executive Vice President \| Mortgage Loan Originator...` | `...Executive Vice President & Mortgage Loan Originator...` |
| **Bio ¶1** | `...entered the mortgage industry in **December 2000**...` | `...entered the mortgage industry in **2000**...` |
| **Bio ¶2** | *(absent)* | `Based in Highland Village, Texas, Eric works with borrowers in Dallas–Fort Worth, Austin, throughout Texas, and in approved Florida markets.` |
| **Bio final ¶** | `Outside of work, Eric is a husband and father of four. He and his wife enjoy family time, technology and nerd culture—especially superheroes and Star Wars—and exploring fine bourbon together.` | `Before entering the mortgage industry, Eric served in the U.S. Army. That experience continues to shape his direct, service-oriented approach to working with borrowers, referral partners, and teams. He is a husband and father of four, and he and his wife enjoy family time, technology and nerd culture—especially superheroes and Star Wars—and exploring fine bourbon together.` |
| **Person `jobTitle`** | `Executive Vice President \| Mortgage Loan Originator` | `Executive Vice President & Mortgage Loan Originator` |

---

## 4, 5, 6. Screenshots

Supplied alongside this document, captured from the staging build:

- **Desktop 1440×1000, hero** — H1, public title, NMLS, experience, entity
  statement, service-market statement, CTA area, beginning of About Eric. No
  descriptor appears between the name and the title.
- **Desktop 1440×1000, body** — complete About Eric (seven paragraphs), Areas of
  Guidance card, Mortgage Options related-link section.
- **Mobile 375×812, hero** — same hero elements.
- **Mobile 375×812, body** — About Eric including the Highland Village and U.S.
  Army paragraphs.

Only spacing was adjusted when the descriptor was removed: the H1's bottom margin
returned to its original 20px. No wording was altered to fit any layout.

---

## 7. Current and revised metadata

| | Before today | After |
|---|---|---|
| **Title tag** | `Eric Bennett \| Leahy Lending` | **unchanged** |
| **og:title** | `Eric Bennett \| Leahy Lending` | **unchanged** |
| **Canonical** | `https://leahylending.com/loan-officers/eric-bennett/` | **unchanged** |
| **Robots** | `index, follow, max-snippet:-1, max-image-preview:large` | **unchanged** |
| **Heading hierarchy** | H1 → About Eric → Areas of Guidance → Mortgage Options in Dallas–Fort Worth | **unchanged structure**, H1 text corrected |
| **Meta description** | contained `Executive Vice President \| Mortgage Loan Originator` | now `&` — **reported in §11** |
| **og:description** | contained `Executive Vice President \| Mortgage Loan Originator` | now `&` — **reported in §11** |

Neither the title tag nor og:title ever contained the barred phrase, so neither
required a change under §8.

**Person schema, after:**

```json
{
  "@context": "https://schema.org",
  "@type": "Person",
  "name": "Eric Bennett",
  "url": "https://leahylending.com/loan-officers/eric-bennett/",
  "jobTitle": "Executive Vice President & Mortgage Loan Originator",
  "worksFor": {
    "@type": "Organization",
    "name": "Leahy Lending",
    "legalName": "Kyber Mortgage Corporation dba Leahy Lending",
    "url": "https://leahylending.com/"
  },
  "identifier": { "@type": "PropertyValue", "name": "NMLS ID", "value": "288376" }
}
```

No `sameAs`, no Highland Village, no address, no ratings, no review counts, no
loan volume, no awards, no company tenure, no eligibility claims.

---

## 8. CTA destination and routing confirmation — no behavior change

```text
START A DFW SCENARIO REVIEW →   href="#scenario-review"                    unchanged
CONTACT ERIC →                  href="/texas/dallas-fort-worth/contact/"   unchanged

data-crm-tags="dfw"                      unchanged
data-market-page="dallas_fort_worth"     unchanged
data-track="eric_profile_cta_click"      unchanged
data-cta-location                        unchanged
```

Neither CTA routes to the Austin `/contact/` funnel, a generic application page,
a new route, or a non-DFW intake path. Lead ownership is unchanged: submissions
from this page tag `dfw` and route to Eric. Forms, form payloads, analytics
events and UTM/referrer handling were not touched.

Canonical, robots, sitemap treatment and redirects are unchanged.

---

## 9. Validation-gate output, including negative tests

Gate: `_build/check-eric-profile-copy.js`, wired into the build.

**Passing output:**

```text
[x] Eric profile: 7 approved strings verbatim, 7 bio paragraphs exact,
    one H1 "Eric Bennett", NO descriptor, ampersand title, barred phrases
    absent from every zone, Highland Village confined to the bio,
    schema and routing unchanged
```

**Negative tests — each assertion broken deliberately, gate confirmed to fail,
page restored:**

```text
[x] descriptor element reintroduced
[x] unhyphenated phrase in visible copy
[x] hyphenated phrase in visible copy
[x] phrase in the title tag
[x] phrase in the meta description
[x] phrase in Open Graph text
[x] phrase in image alt text
[x] a tagline inserted between the H1 and the title
[x] barred string returns ("December 2000")
[x] pipe returns to the public title
[x] a second H1 appears
[x] the Army paragraph goes missing
[x] the Highland Village paragraph goes missing
[x] a bio paragraph is reworded
[x] Highland Village leaks into the hero
[x] Highland Village leaks into image alt text
[x] Person jobTitle reverts to a pipe
[x] sameAs is added to Person schema
[x] canonical is changed
[x] a CTA label is changed
[x] DFW routing attribute removed
[x] a CTA is repointed at the Austin funnel

22 / 22 assertions proven to fail when violated
restored: gate green again
```

**"No descriptor beneath the H1" is asserted structurally**, not by string match:
the element immediately following the H1 inside the hero must be the public
title. Anything inserted between them fails, whatever it is called — which is why
the tagline test above is included.

**Two defects were found in the gate itself during this work and are reported
rather than glossed:**

1. The first version of a negative test used a mutation that did not match the
   real markup, so it passed while proving nothing. Corrected and re-run.
2. When updating the barred list, a plain string replacement removed the
   hyphenated phrase from the *banned* list instead of the *required* list,
   because the same string appeared in both and the first occurrence was in
   BANNED. The gate briefly demanded the phrase it is meant to forbid. Caught by
   running it, fixed by editing each list by name.

---

## 10. File-change inventory

```text
_build/build-eric-profile.js          approved copy block and hero template
_build/check-eric-profile-copy.js     the §9 validation gate
landing-assets/loan-officer.css       .lo-descriptor rule removed; H1 margin restored
loan-officers/eric-bennett/index.html the rebuilt profile page
```

Nothing else changed. Global navigation, footer, other bios, other team cards,
other routes, forms, analytics, CRM configuration, sitemap, robots and redirects
were not touched. Full build passes with all other gates green; 1,799 internal
links across the site still resolve.

---

## 11. Reported, not changed

### 11.1 Meta description and og:description

Both are generated from the entity statement, which §3 requires to use the
ampersand. Correcting the visible statement therefore corrected both:

```text
before:  Eric Bennett is Executive Vice President | Mortgage Loan Originator at Leahy Lending...
after:   Eric Bennett is Executive Vice President & Mortgage Loan Originator at Leahy Lending...
```

Reported per §8's requirement to report every profile-metadata change explicitly.
Neither ever contained the barred "Mortgage Guidance" phrase. No other part of
either tag changed.

### 11.2 Image alt text still reads "and"

```html
alt="Eric Bennett, Executive Vice President and Mortgage Loan Originator at Leahy Lending"
```

§3 bars `Executive Vice President and Mortgage Loan Originator` as a form of the
public title. The alt text contains no barred phrase and no pipe, so §8 did not
require the change and **it was not made**.

**Proposed diff, pending written approval:**

```text
alt="Eric Bennett, Executive Vice President & Mortgage Loan Originator at Leahy Lending"
```

### 11.3 The page title tag contains a vertical bar

```html
<title>Eric Bennett | Leahy Lending</title>
```

The bar separates page name from site name; it is not the public job title, which
now uses the ampersand. §8 bars modifying the page title. **Left unchanged**, and
flagged only so it is not mistaken for an overlooked instance.

### 11.4 Areas of Guidance card — verified, no unauthorized item

Contains exactly the five allowed concepts and nothing else:

```text
Self-employed and complex-income scenarios
Bank Statement, Asset Utilization, and No Ratio mortgage options
1099, bonus, commission, RSU, and other variable-income documentation
Super Jumbo and high-balance purchase or refinance scenarios
Approved real-estate investor financing paths
```

No seller financing, wraparound, creative financing, rate, APR, payment, LTV,
FICO, down-payment, reserve, or program-availability claim appears. No
substitution was required, so none was invented.

---

## Build controls and their limits

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not a compliance clearance and is not a production approval.
**No production deployment has been made or is authorized by this package.**

---

*Kyber Mortgage Corporation dba Leahy Lending · NMLS 2653540*
