# Eric Bennett Profile Page — Consolidated Build Spec

**Source:** Eric Bennett's Handoff B and his response of 21 September 2026
**Route:** `/loan-officers/eric-bennett/`
**Status:** not built. Everything below is what he specified, gathered in one place.

Copy marked **VERBATIM** is his exact approved wording and must not be edited,
reflowed or paraphrased. Everything else is a build decision.

---

## 1. Route and scope

```text
Canonical route        /loan-officers/eric-bennett/        approved, §6
Competing profile      /about/eric-bennett/                DO NOT BUILD
                       if that URL is ever needed, 301 it to the canonical
DFW duplicate          none                                confirmed, no DFW variant
Architecture           /loan-officers/ is a SECTION, not a one-off page.
                       "Build it as a scalable people/profile architecture so
                       additional approved loan-officer profiles can use the
                       same structure later." It may have one child initially.
Indexing               indexable. "Do not apply noindex to the canonical Eric
                       profile page once all public claims/disclosures are
                       approved for indexable production use."
Canonical tag          self-referencing
Sitemap                include once indexable
```

The route is at the web root rather than under `/texas/dallas-fort-worth/`, and
that is deliberate: it is one canonical profile serving both markets, even
though its primary CTA is DFW-specific.

---

## 2. Required page elements — Handoff B, Build task 1

```text
[ ] One H1
[ ] Approved profile copy
[ ] Approved headshot with descriptive alt text
[ ] Approved role / entity relationship
[ ] Approved DFW service-market statement
[ ] Approved areas of guidance
[ ] Approved DFW scenario-review CTA
[ ] Approved direct professional contact method
[ ] Required disclosures
[ ] Links to approved professional profiles only
```

---

## 3. The approved copy

### H1 — VERBATIM

```text
Eric Bennett | Mortgage Guidance for Complex Income and High-Balance Scenarios
```

Title case, and no CSS may uppercase it — his validation list bars all-caps
styling on hero H1s.

### Public title — VERBATIM

```text
Executive Vice President | Mortgage Loan Originator
```

### Credential line — VERBATIM

```text
Executive Vice President | Mortgage Loan Originator
NMLS #288376
25+ Years of Mortgage Experience
```

### Entity relationship statement — VERBATIM

```text
Eric Bennett is Executive Vice President | Mortgage Loan Originator at Leahy
Lending, a DBA of Kyber Mortgage Corporation.
```

### Service-market statement — VERBATIM

```text
Eric works with Dallas–Fort Worth and Austin borrowers, clients throughout
Texas, and borrowers in approved Florida markets.
```

His note on it: *"This is a service-market statement. It is not a DFW office
claim."* Nothing on the page may imply a Dallas–Fort Worth office or address.

### Full bio — VERBATIM

Six paragraphs, supplied in §7 of his response. Opens with the entity
relationship statement, states December 2000 as his industry entry and "more
than 25 years of experience across retail, wholesale, and consumer-direct
lending", then covers his focus areas, service markets, career background,
real-estate investor perspective, and a closing personal paragraph.

Held in full in his response document; it is reproduced into the page exactly,
with no re-ordering of paragraphs.

### Required profile support text — VERBATIM

```text
Mortgage options, documentation, eligibility, and terms vary by borrower,
property, lender, and program. Submitting information or discussing a scenario
does not constitute a loan application, approval, or commitment to lend.
```

### Short bio and micro bio

Supplied in §8 and §9. **Not for this page** — the short bio is for
referral-partner pages, author/reviewer blocks and longer DFW modules; the micro
bio is for compact contexts, article attribution and a limited Work With Eric
component. Recorded here so they are not mistakenly used on the profile.

---

## 4. NMLS treatment — §6

```text
Number      NMLS #288376
Placement   directly beneath the public title on the profile page
            in the profile footer / credential area
            in the short team-card credential line
            in author/reviewer attribution where space permits
```

> "Do not place the NMLS number inside a decorative graphic that cannot be read
> or copied by users and assistive technology."

So: real text, selectable, not baked into an image or a background.

---

## 5. Headshot

```text
Image     the existing approved professional headshot from the current team card
Alt text  Eric Bennett, Executive Vice President and Mortgage Loan Originator
          at Leahy Lending
```

The file is already on the site at `/assets/img/team-eric-bennett.png`.

---

## 6. The two CTAs

### Primary — VERBATIM label

```text
START A DFW SCENARIO REVIEW →
```

**Resolved.** Every page on this site carries its own questionnaire that submits
to GHL from its submit button, so the profile page gets one too and the CTA
points at it on the same page. No external form or calendar URL is required.

Eric's `[INSERT APPROVED DFW SCENARIO-REVIEW FORM OR CALENDAR URL]` placeholder
assumed an off-site destination; an on-page questionnaire satisfies the same
requirement and matches the rest of the site.

### Secondary — VERBATIM label

```text
CONTACT ERIC →
```

**Still needs a destination.** He asked for "a professional contact method
approved for the public site", and recommended a contact page or form over a
`mailto:` link unless the email address is to be published. The existing
`/contact` page is the obvious candidate and needs a yes.

---

## 7. Person schema — Handoff B task 7, his §14

Only after the page is built, and only from facts visible on it.

```text
name      Eric Bennett
url       https://leahylending.com/loan-officers/eric-bennett/
jobTitle  Executive Vice President | Mortgage Loan Originator
worksFor  Leahy Lending, a DBA of Kyber Mortgage Corporation
sameAs    approved real professional URLs only
```

**sameAs is omitted.** His instruction: *"If no approved profile URL is
supplied, omit sameAs rather than guessing."* None has been supplied, and he
added that a stale LinkedIn profile must not be added just because it exists.

**Must not appear in the schema:**

```text
DFW office address        Personal address
Ratings / reviews         Loan volume
Company tenure            Awards
Unsupported credentials   Anything not visibly stated on the page
```

> "Use schema to reflect visible facts—not to manufacture entity authority."

---

## 8. Analytics — Handoff B task 9

```text
Events        eric_profile_view
              eric_profile_cta_click
Properties    page_type, market = dallas_fort_worth, module_location,
              cta_location, program_path, content_type
```

Never sent: name, email, phone, property address, loan amount, property value,
income, assets, bank statements, tax returns, account information, SSN,
free-text scenario notes. That boundary is now enforced in code — the tracker
filters to an allow-list and a build check fails if a barred field name appears
in it — so the profile page inherits it without doing anything.

---

## 9. Claim rules that apply to this page

From his §2.3, §2.4 and the Handoff B escalation list.

```text
USE          25+ Years of Mortgage Experience        his personal credential,
                                                     dated from December 2000
DO NOT USE   25+ Years of Experience                 company tenure
             25+ Years in Business
             20+ Years Experience                    superseded
```

> "Do not place a company '25+ years' line beside Eric's personal credential on
> the same page, card, or module."

The page must also not introduce: a physical DFW address, a Google Business
Profile representation, a new NMLS or licensing statement beyond #288376, a
testimonial, a review score or count, a loan-volume claim, a company-tenure
claim, a borrower result, or any program terms, rates, APRs, payments, credit
criteria, LTVs, reserves or eligibility claims.

Also barred, from the old team-card copy he retired in §10:

```text
One of the most trusted advisors in the business
White-glove service
Creative financing
Seller financing
Wraparound mortgages
Non-QM solutions
```

> "'Real-estate investor' is the approved replacement framing for Eric's
> personal real-estate experience. Do not represent seller financing or
> wraparound mortgages as a primary Leahy Lending mortgage-product specialty in
> this profile."

---

## 10. QA his validation list requires

```text
[ ] One canonical Eric profile URL exists
[ ] No duplicate Eric profile page is indexable
[ ] Profile content matches his approved copy exactly
[ ] Profile displays only approved entity / licensing / contact facts
[ ] H1 is title case; no all-caps CSS on it
[ ] No false DFW office, address or local-superiority claim
[ ] Person schema limited to approved visible facts
[ ] Desktop, tablet, mobile, keyboard, contrast and screen-reader-label QA
[ ] Analytics events exclude personal and financial data
[ ] Self-referencing canonical, in the sitemap, ordinary internal HTML links
```

---

## 11. What is still open

```text
[ ] CONTACT ERIC → destination                       one answer needed
[ ] sameAs profile URLs                              omitted until supplied
```

Everything else he specified is in hand. The page can be built now, with the
secondary CTA the only thing held.

---

## 12. Related work this page unblocks

```text
Work With Eric module      §11. Approved copy in hand. Secondary CTA points at
                           this profile. Deploys to all nine indexable DFW
                           pages, NOT to the noindex DFW home-loans page.
Root-site routing module   §12. Approved copy in hand. Destination is this
                           profile page. Deploys to the main homepage, the
                           generic Self-Employed page and the generic Bank
                           Statement page. There is no generic Super Jumbo page.
Team card refresh          §10. New copy in hand. Waits for this page so title,
                           NMLS, credential and bio stay consistent, and needs a
                           React source change — no runtime patch.
Legacy redirect            /leadership-team/eric-bennett/ currently 301s to
                           /about as a placeholder. Repoint it here once live.
```

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

Nothing here is approval to publish.
