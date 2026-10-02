# Return Package — Eric Bennett Profile, Exact Copy Correction

**Date:** 28 September 2026
**Responding to:** "Eric Bennett Profile — Exact Copy and Hero Correction Handoff", 28 September 2026
**Route:** `/loan-officers/eric-bennett/`
**Status:** STAGING ONLY — not deployed. Awaiting Eric's approval.

---

## Summary

All five corrections in §2 are implemented. All copy is verbatim from the
handoff; nothing was reworded, reflowed, shortened or "improved". A build gate
now enforces every assertion in §9, and all 15 of its assertions were
negative-tested before being reported as passing.

**Two items are reported rather than changed**, per §8 — see §11 below.

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
        <p class="lo-descriptor">Mortgage Guidance for Complex-Income and High-Balance Scenarios</p>
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

`&amp;` is the HTML entity for `&`. It renders as `Executive Vice President &
Mortgage Loan Originator`.

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

Seven paragraphs, in the handoff's order.

---

## 3. Current-versus-revised copy diff

| Element | Before | After |
|---|---|---|
| **H1** | `Eric Bennett \| Mortgage Guidance for Complex Income and High-Balance Scenarios` | `Eric Bennett` |
| **Descriptor** | *(did not exist — was joined to the H1)* | `Mortgage Guidance for Complex-Income and High-Balance Scenarios` as its own `<p class="lo-descriptor">` |
| **Public title** | `Executive Vice President \| Mortgage Loan Originator` | `Executive Vice President & Mortgage Loan Originator` |
| **Entity statement** | `...Executive Vice President \| Mortgage Loan Originator at Leahy Lending...` | `...Executive Vice President & Mortgage Loan Originator at Leahy Lending...` |
| **Bio ¶1** | `...entered the mortgage industry in **December 2000**...` | `...entered the mortgage industry in **2000**...` |
| **Bio ¶2** | *(absent)* | `Based in Highland Village, Texas, Eric works with borrowers in Dallas–Fort Worth, Austin, throughout Texas, and in approved Florida markets.` |
| **Bio final ¶** | `Outside of work, Eric is a husband and father of four. He and his wife enjoy family time, technology and nerd culture—especially superheroes and Star Wars—and exploring fine bourbon together.` | `Before entering the mortgage industry, Eric served in the U.S. Army. That experience continues to shape his direct, service-oriented approach to working with borrowers, referral partners, and teams. He is a husband and father of four, and he and his wife enjoy family time, technology and nerd culture—especially superheroes and Star Wars—and exploring fine bourbon together.` |
| **Person `jobTitle`** | `Executive Vice President \| Mortgage Loan Originator` | `Executive Vice President & Mortgage Loan Originator` |

Note the descriptor hyphenates **Complex-Income**, where the previous joined
headline did not. That follows the handoff exactly.

---

## 4, 5, 6. Screenshots

Captured from the staging build and supplied alongside this document:

- **Desktop, 1440×1000** — hero showing H1, supporting descriptor, public title,
  NMLS and experience credentials, CTA area, and the beginning of About Eric.
- **Desktop, 1440×1000** — complete About Eric (all seven paragraphs), the Areas
  of Guidance card, and the Mortgage Options related-link section.
- **Mobile, 375×812** — hero, same elements.
- **Mobile, 375×812** — About Eric including the Highland Village and U.S. Army
  paragraphs.

The H1 renders as the name alone, with the descriptor on its own typographic
level beneath it. Only layout, typography and spacing were adjusted to
accommodate the copy; no wording was altered to fit, per §1.

---

## 7. Current and revised metadata

| | Before | After |
|---|---|---|
| **Title tag** | `Eric Bennett \| Leahy Lending` | **unchanged** |
| **Canonical** | `https://leahylending.com/loan-officers/eric-bennett/` | **unchanged** |
| **Robots** | `index, follow, max-snippet:-1, max-image-preview:large` | **unchanged** |
| **H1** | joined headline | `Eric Bennett` |
| **Heading hierarchy** | H1 → About Eric → Areas of Guidance → Mortgage Options in Dallas–Fort Worth | **unchanged structure**, H1 text corrected |
| **Meta description** | contained `Executive Vice President \| Mortgage Loan Originator` | now contains `&` — **see §11** |
| **og:description** | contained `Executive Vice President \| Mortgage Loan Originator` | now contains `&` — **see §11** |

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

No `sameAs`, no address, no Highland Village, no ratings, no awards, no tenure.

---

## 8. CTA destination and routing confirmation — no behavior change

```text
START A DFW SCENARIO REVIEW →   href="#scenario-review"                      unchanged
CONTACT ERIC →                  href="/texas/dallas-fort-worth/contact/"     unchanged

data-crm-tags="dfw"                        unchanged
data-market-page="dallas_fort_worth"       unchanged
data-track="eric_profile_cta_click"        unchanged
data-cta-location                          unchanged
```

Neither CTA routes to the Austin `/contact/` funnel, a generic application page,
a new route, or a non-DFW intake path. Lead ownership is unchanged: submissions
from this page tag `dfw` and route to Eric.

Sitemap treatment, robots directives, redirects and canonical are untouched.

---

## 9. Validation-gate output, including negative tests

New gate: `_build/check-eric-profile-copy.js`, wired into the build.

**Passing output:**

```text
[x] Eric profile: 8 approved strings verbatim, 7 bio paragraphs exact,
    one H1 "Eric Bennett", descriptor separate, ampersand title,
    Highland Village confined to the bio, schema and routing unchanged
```

**Negative tests — each assertion broken deliberately, gate confirmed to fail,
page restored:**

```text
[x] barred string returns ("December 2000")
[x] pipe returns to the public title
[x] descriptor joined back onto the H1
[x] a second H1 appears
[x] descriptor element removed
[x] the Army paragraph goes missing
[x] a bio paragraph is reworded
[x] Highland Village leaks into the hero
[x] Highland Village leaks into image alt text
[x] Person jobTitle reverts to a pipe
[x] sameAs is added to Person schema
[x] canonical is changed
[x] a CTA label is changed
[x] DFW routing attribute removed (lead ownership would change)
[x] a CTA is repointed at the Austin funnel

15 / 15 assertions proven to fail when violated
restored page: gate green again
```

One of these initially reported as passing while proving nothing — the mutation
did not match the real markup, so the test was vacuous. It was corrected and
re-run. Reported because a gate that has only ever been seen green is not
evidence.

---

## 10. File-change inventory

```text
_build/build-eric-profile.js          the approved copy block and hero template
_build/check-eric-profile-copy.js     NEW — the §9 validation gate
landing-assets/loan-officer.css       .lo-descriptor style; H1 margin tightened
loan-officers/eric-bennett/index.html the rebuilt profile page
```

Nothing else changed. Global navigation, footer, other bios, other team cards,
other routes, forms, analytics, CRM configuration, sitemap, robots and redirects
were not touched.

---

## 11. Reported, not changed — requires Eric's decision

Per §8, these are raised as proposed diffs rather than implemented.

### 11.1 Meta description and og:description changed as a consequence

Both are generated from the entity statement, which §3 requires to use the
ampersand. Correcting the visible statement therefore corrected both tags:

```text
before:  Eric Bennett is Executive Vice President | Mortgage Loan Originator at Leahy Lending...
after:   Eric Bennett is Executive Vice President & Mortgage Loan Originator at Leahy Lending...
```

This is the §8 case of "strictly required to remove the incorrect visible title
pipe from profile-specific metadata". Reported for the record. No other part of
either tag changed.

### 11.2 Image alt text still reads "and"

```html
alt="Eric Bennett, Executive Vice President and Mortgage Loan Originator at Leahy Lending"
```

§3 bars `Executive Vice President and Mortgage Loan Originator` as a form of the
public title. The alt text is not visible copy and contains no pipe, so it did
not meet the §8 threshold for a required change and **was not altered**.

**Proposed diff, pending approval:**

```text
alt="Eric Bennett, Executive Vice President & Mortgage Loan Originator at Leahy Lending"
```

### 11.3 The page title tag contains a vertical bar

```html
<title>Eric Bennett | Leahy Lending</title>
```

The bar here separates the page name from the site name; it is not the public
job title. §1 bars a vertical bar "in the public title", which the job title now
satisfies. **Left unchanged.** Flagged only so it is not mistaken for an
overlooked instance.

### 11.4 Areas of Guidance card — verified, no unauthorized item

The card contains exactly the five approved concepts and nothing else:

```text
Self-employed and complex-income scenarios
Bank Statement, Asset Utilization, and No Ratio mortgage options
1099, bonus, commission, RSU, and other variable-income documentation
Super Jumbo and high-balance purchase or refinance scenarios
Approved real-estate investor financing paths
```

No seller financing, wraparound, creative financing, rate, APR, payment, LTV,
FICO, down-payment, reserve, or availability claim appears. No substitution was
needed, so none was made.

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
