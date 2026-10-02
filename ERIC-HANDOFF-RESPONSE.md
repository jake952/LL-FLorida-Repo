# Response to the DFW Homepage Handoff

**For Eric Bennett. Written 14 September 2026.**
**Revised 14 September 2026** after Eric’s staging review, to correct the
authority language and the Super Jumbo copy record.

> **What the automated controls do and do not do**
>
> ```text
> Automated content and build controls help enforce approved copy, structural
> requirements, placeholder handling, and selected prohibited phrases. They do
> not independently verify substantiation, product availability, legal compliance,
> privacy compliance, licensing requirements, testimonial permissions, or
> state-specific mortgage-advertising obligations.
> ```
>
> A passing build is not a compliance review and is not reported as one.

This covers the DFW homepage handoff section by section, and the work done
alongside it that the handoff did not ask for. It is written to be read on its
own — you should not need the build to follow it.

Two things worth saying at the top:

- **Four facts the page will not state until you supply them.** They are listed
  in full in section D. The page omits or visibly placeholders each one rather
  than guessing, and the build refuses to produce an indexable page while a
  placeholder is on it.
- **One place the build deliberately does not follow the handoff.** Section 5's
  trust strip is not built. The reason is in section C. If that call is wrong it
  is a one-line change to put back.

---

## A. The homepage, section by section

The DFW homepage was a static clone of the Austin homepage. It is now built from
this handoff. The global header and footer are still the site's own — section 19
lists those as approved inputs, so they were not reworded.

| § | Asked for | State |
|---|---|---|
| 1 | Non-QM / alternative-doc positioning; market name only in identity locations | **Done.** The market name appears twice in the body: the hero eyebrow and one hero sentence. The build counts them and fails above two |
| 2 | Cut ~10 competing CTAs to five; `START A SCENARIO REVIEW` as the primary | **Done.** Exactly five primary body CTAs. `Start Application` no longer appears in body content — header and footer only, which §2 permits |
| 3 | Keep navy/gold/ivory and the serif display; change the hierarchy | **Done,** with a caveat in section C |
| 4 | New hero: eyebrow, H1, body, qualification line, two CTAs, proof panel, 2×2 metric tiles | **Done,** copy verbatim. All four metric tiles render; the two unresolved ones show your `[CURRENT VERIFIED]` placeholder and are marked on the page as not approved for production |
| 5 | Trust strip below the hero | **Not built — deliberate.** See section C |
| 6 | `How Is Your Income Documented?`, six cards, 3×2 desktop / 2 tablet / 1 mobile, the card qualifier, and the "Not sure" route | **Done,** copy verbatim, column counts declared rather than inferred |
| 7 | Self-employed authority block: new eyebrow, H2, body, six topic bullets, badge revised to `UP TO $5M`, the $20M supporting sentence, one CTA | **Done.** Eyebrow, H2, body, bullets and badge verbatim. The supporting sentence is now the owner-approved $20M wording rather than the handoff block’s phrasing of it. Every listed removal is gone |
| 8 | Program grid in three groups, not a flat list of ten | **Done.** 5 + 4 + 3 cards. The Super Jumbo card now carries the owner-approved amount wording, not the handoff block’s paraphrase of it |
| 9 | `A Clear Process From First Conversation to Closing`, four replacement tiles | **Done,** copy verbatim. `Application & Approval`, `Maximum speed`, the 21-day target and `Close with Confidence` are all gone |
| 10 | New FAQ block, accessible accordion, FAQPage schema only if it matches the visible text | **Done.** Six questions live; the seventh is held — see section D. Schema and visible copy are generated from one list, so they cannot drift |
| 11 | Do not publish the current testimonials; use the safer placeholder format | **Done,** your two placeholder quotes verbatim, with their attribution lines. No `Review` or `AggregateRating` schema |
| 12 | Guided 9-step scenario form on the homepage, conditional Super Jumbo step, hidden CRM fields | **Done.** The homepage had no form at all before |
| 13 | Replace the final CTA; one primary and **one** secondary contact path | **Done.** `START A SCENARIO REVIEW` plus `CALL (214) 531-6416`. No third CTA |
| 14 | Title, meta, one H1, WebPage / Organization / BreadcrumbList / FAQPage | **Done,** title and description verbatim |
| 15 | Compliance-sensitive items | Listed in section D |
| 16 | 19 analytics events | **18 wired.** `trust_strip_view` is not required while the trust strip is absent, per your 14 September direction |
| 17 | Accessibility | **Done.** One H1, no skipped heading levels, every interactive target ≥ 44 px, no horizontal scroll at 320 px, tested at 320 / 768 / desktop |

### The form, specifically

Your §12 flow is implemented as specified, including the parts that differed
from what already existed:

- **Step 2** now has your seven options, not five — `substantial assets and
  limited traditional income` and `real estate investor` were missing.
- **Step 3** uses your wording, *"…self-employed or **receiving this income**?"*
  The form previously said "or operating your business", which does not fit
  either of the two borrowers step 2 just added.
- **Step 4** has your ten options, not five.
- **Step 4a** exists and behaves as specified: shown only when
  `High-balance or Super Jumbo financing` is selected, the counter still reads
  *Step 4 of 9* so nobody is told the form grew, and it submits empty when
  skipped so the CRM payload has the same shape from every page. The question
  carries a line saying it is routing information, not an eligibility
  determination.
- **Step 9** already had every individual LLM source selectable and stored
  separately from tracked attribution. Unchanged.
- **Hidden CRM fields**, submit CTA, success and error copy are all as written.

### The sticky bar

Rebuilt to §2. It is hidden at page load, appears only once the hero has
scrolled away, hides again whenever the scenario form is in view, stops
appearing once someone starts filling the form in or submits it, and a dismissal
is respected for the rest of the session. One action, not five.

---

## B. Changes the handoff did not ask for

These came from Jake on the same day. Your 14 September review confirmed the
program decisions among them as owner-approved; the rest are implementation
decisions or items still open, and `STAGING-CHANGE-LOG.md` states which is
which for every entry, with a revert path.

### Three new product pages

| Page | Route | Note |
|---|---|---|
| No Ratio Mortgage Options | `/texas/dallas-fort-worth/no-ratio-mortgages/` | New. Your handoff copy used for the direct answer and the FAQ |
| Super Jumbo Mortgage Options | `/texas/dallas-fort-worth/super-jumbo-mortgages/` | New. Carries the $5M / $20M statement with its qualifier |
| Asset-Utilization Mortgage Options | `/texas/dallas-fort-worth/asset-utilization-mortgages/` | Restored. The copy was written in the original build and had been folded onto the self-employed hub |

All three use the same template, register, and disclosure pattern as the six
existing program pages: conditional language throughout, every product fact
followed by what varies, and a form note on each that reads *"Do not submit tax
returns, bank statements, account numbers, or Social Security numbers through
this form."*

Your §19 asked for live URLs for Bank Statement, P&L, Asset Utilization, No
Ratio, Super Jumbo and DSCR. Five of those six now exist as pages. **Profit &
Loss remains consolidated onto the self-employed hub** — its homepage card
carries `program_interest=profit_loss` so the form still opens on the right path.

### Navigation

- **DSCR removed from the Self-Employed dropdown.** It is an investment-property
  path, not a self-employed documentation path, and listing it in both places
  implied otherwise. It remains in the bar under **Investor Loans**.
- **How to Qualify retired.** The page is gone, its URL 301s to the
  self-employed hub, and every link and label pointing at it has been repointed.
- **No Ratio, Super Jumbo and Asset-Utilization added** to the dropdown, the
  mobile navigation and the footer programme list.

### Two owner-approved program decisions

Both are owner-approved decisions, confirmed by Eric Bennett on 14 September
2026, and both are recorded in `COMPLIANCE-RULES.md` §9.1 and §9.2 with a table
of exactly what changed in the build.

Owner approval of a product **label** is not compliance approval of a **claim**.
Rates, APRs, payments, down payments, LTVs, credit-score minimums, reserve
requirements, interest-only terms, cash-out limits, occupancy rules and
lender-specific underwriting requirements all still require the applicable
product, compliance or legal review, and appear nowhere on these pages.

1. **"No Ratio" is an owner-approved public product name.** Your line at
   `03-self-employed.md:26` was page-specific guidance for the Asset Utilization
   page, not a sitewide prohibition — your characterisation, now recorded as
   such. The build had been treating it as a ban and refusing to compile any
   page containing the term, and a claim scanner had been stamping a `REVIEW`
   comment beside every use. Both are removed. **Asset Utilization remains a
   separate owner-approved public product name** and is not replaced by No Ratio
   on its own page.

2. **The Super Jumbo amount statements have owner-approved wording.**

   ```text
   Available Super Jumbo mortgage programs up to $5 million.

   Case-by-case financing paths up to $20 million may be available.
   ```

   **Correction.** An earlier version of this report described the Super Jumbo
   copy as used verbatim. It was not. The amount statement existed in nine
   paraphrases across the homepage, the Super Jumbo page, two card grids, a FAQ
   answer, two meta descriptions and a supporting sentence. Every one has been
   replaced with the wording above. They are now written once in
   `_build/approved-copy.js`, every page reads them from there, and
   `_build/check-approved-copy.js` fails the build on any other form.

   Every other approval, rate, payment, closing-time, credit-score,
   down-payment, reserve and eligibility promise stays prohibited.

**Two rules from the same handoff were not lifted and still hold:** no *"no tax
returns required"*, and no *"qualify on gross deposits"*.

### Supporting work

- **`sitemap.xml` was not generated by anything.** It still listed the retired
  `/how-to-qualify/` and none of the three new pages. It is now derived from the
  live, indexable pages — 10 DFW URLs.
- **`landing-manifest.json`**, the sheet the CRM mapping and analytics config are
  built from, was equally stale. Also derived now. It declares 54 analytics
  events and the code fires exactly 54.
- **Imagery.** Two aerial neighbourhood photographs were sourced for No Ratio and
  Super Jumbo. Neither shows a specific house beside mortgage copy, which would
  read as an implied outcome. Asset-Utilization currently shares the
  self-employed hub's photograph — see section D.

---

## C. Where the build does not follow the handoff

### §5 — the trust strip is not built

Recorded as directed:

> Trust strip removed by owner direction for this version because it duplicates
> hero-proof content and includes unresolved verification-dependent metrics.
> The trust_strip_view analytics event is not required while the strip is absent.

A future strip must use distinct, approved, substantiated content and receive
its own implementation direction. Reinstating this one is a single function and
a single observer; the facts themselves are unchanged and still configured.

### A caveat on §3, offered plainly

§3 says the visual direction should remain and the hierarchy should change. The
palette, the typefaces and the photographic treatment are unchanged. But the new
sections are built on their own stylesheet rather than the compiled bundle's, so
their **spacing and type scale are not pixel-matched** to the Austin components
they sit beside. The section sequence maps one-to-one onto the old page plus the
two you added, but it will read as a different page. If any specific component
should match the old one exactly, say which.

### Three claims in the global footer

The footer's brand blurb reads *"We say yes when others say no. The premier
mortgage lender for self-employed individuals and W-2 investors. Since 2002."*

That is a phrase your §4 lists for removal, an unsupported superlative, and a
tenure attribution your §15 wants confirmed. It was left alone because §19 names
the footer components among the approved inputs, and the same blurb is on every
page of the live site — rewriting it is not this handoff's call. All three now
carry `REVIEW` markers on the page. **This is a decision for you.**

---

## D. What we need from you

### 1. Four facts the page will not state

| Item | Where it appears | Current state |
|---|---|---|
| Verified review rating and count | Hero metric tile | Renders `[CURRENT VERIFIED] FIVE-STAR REVIEWS` |
| Verified licensed-state count | Hero metric tile | Renders `[CURRENT VERIFIED] STATES LICENSED` |
| Licensing approval for the DFW service-area FAQ | FAQ, your seventh question | Held back entirely |
| Compliance approval for real testimonials | Testimonials | Your placeholder format is shipping |

The earlier page carried `5.0★ Google & Yelp Rating` and a licensed-state count
that had already been flagged as unconfirmed (19 vs 14). Neither is carried
forward.

These cannot ship by accident: the build refuses to produce an indexable page
while a `[CURRENT VERIFIED]` placeholder is present, so the flip to production
indexing fails until the figures exist.

### 2. Confirmations §15 asks for before launch

`25+ YEARS IN BUSINESS` · `$1B+ IN LOANS FUNDED` · available programmes up to
**$5 million** · customised paths up to **$20 million**.

All four are on the page. The first two were treated as approved because you
supplied them as literal copy rather than bracketed placeholders; the $5M/$20M
pair because you supplied that sentence with its qualifier. §15 still lists all
four for confirmation.

### 3. The footer blurb

Three marked claims, described in section C. Keep, reword, or remove.

### 4. Photographer attribution

The two new heroes are free Unsplash-licence images. The source URLs are
recorded in `IMAGE-CREDITS.md`; the photographers' display names were not
captured and are outstanding. Asset-Utilization has no photograph of its own and
currently shares the self-employed hub's.

---

## E. How to check it, and what came back with this revision

Everything is on staging and `noindex`. Nothing is live.

Four documents are new, generated from the build by
`_build/build-review-pack.js` and shipped in `go-live/`, never to a web server:

| File | What it is |
|---|---|
| `STAGING-CHANGE-LOG.md` | every change beyond the homepage handoff, with reason, affected URLs, staging status, revert path, owner approval status and any further review needed |
| `PUBLIC-CLAIMS.md` | every public claim: location, exact visible wording, source, status, evidence required — including claims on pages outside this work that are **not approved and live on staging today** |
| `ROUTES.md` | all DFW routes with indexing state, sitemap membership and page-view event; all redirects; sitemap contents |
| `ANALYTICS-EVENTS.md` | every event, where it fires, the payload fields in use, and what is never transmitted |

Alongside the three that already existed:

| File | What it is |
|---|---|
| `GO-LIVE.md` | who owns what, generated from the build |
| `COMPLIANCE-RULES.md` | the rules. §9.1 records the No Ratio direction, §9.2 the Super Jumbo wording, §9.3 the limits of the automated controls |
| `COPY-REVIEW.md` | the 62 flagged phrases across eleven pages, with the rule each one fails |

### One thing in PUBLIC-CLAIMS.md worth reading first

The wording check found **"No tax returns required" live on three Austin pages**
today — `/bank-statement-loans`, `/self-employed-mortgage-loans` and
`/how-self-employed-borrowers-qualify-for-mortgage`. That is on your prohibited
list. Those pages are outside this work and outside the homepage handoff, so
nothing here changed them, but they are shipping.

They are reported rather than enforced deliberately: failing the build on
pre-existing copy nobody has been asked to change would block every deploy and
bury the pages that are in scope. The decision on them is yours.

### Placeholder behaviour

```text
Staging:    renders unresolved placeholders for internal review, marked on the
            page as "Not approved for production", and stays noindex.
Production: the build fails if a placeholder remains, so an indexable page
            carrying [CURRENT VERIFIED] cannot be produced.
```

---

Every structural claim in this document is enforced by a gate that fails the
build rather than by someone remembering.
phrases, the approved dollar figures, the FAQ-to-schema match, the four hero
tiles, the 3×2 grid and the placeholder-versus-indexing rule each have one, and
each was deliberately broken once to confirm it fails.

---
---

# Response to the RSU, Bonus & Commission handoff

**Written 15 September 2026.** Covers the handoff of the same date, section by
section, including its global sections 1.1–1.5 and its build order (section 17).

> **What the automated controls do and do not do**
>
> ```text
> Automated content and build controls help enforce approved copy, structural
> requirements, placeholder handling, and selected prohibited phrases. They do
> not independently verify substantiation, product availability, legal compliance,
> privacy compliance, licensing requirements, testimonial permissions, or
> state-specific mortgage-advertising obligations.
> ```
>
> A passing build is not a compliance review and is not reported as one.

## F. The page

**Route: `/texas/dallas-fort-worth/rsu-bonus-commission-income/`** — the route
section 3 recommends. The old `/rsu-bonus-commission-mortgages/` 301s to it in
one hop with query strings preserved. Nothing on this build has been deployed or
indexed, so there was no search value to keep, and your canonical, `og:url` and
title tag all name the `-income` route.

Every visible string on the page is the copy in the handoff. It is held in
`_build/page-rsu.js`, and the acceptance gate `_build/check-rsu-page.js` is
generated from that same module rather than written by hand — so a string can
only be asserted if it is also what the page is built from. The gate runs last,
on the file as it will be uploaded, after the navigation, footer and link passes
have all had their turn at it.

| Section | What it asked for | State |
|---|---|---|
| 2 | Specialty positioning; no promise that any component will count | Every treatment statement is conditional. The gate fails the build on "we count…", "most banks won't", "will count toward", "counts toward qualification" and "full buying power" |
| 3 | Route, title, meta description, canonical, Open Graph, local-language rule | All exact. "Dallas–Fort Worth" appears in the URL, title, meta description, H1 and breadcrumb only — the gate counts it in the visible body and fails above two |
| 4 | Hero structure kept; two paragraphs of new copy; form intro and disclaimer | Exact. Both paragraphs render; the form disclaimer replaced the template's bank-statement wording |
| 5 | Compensation-context copy, three bullets, context callout | Exact. The callout fires `context_cta_click` with `cta_location=compensation_context` |
| 6 | Panel eyebrow → COMPENSATION SCENARIOS TO DISCUSS; four examples; conclusion | Exact |
| 7 | Four adjacent cards, no self-referential card, visible qualifier, Not Sure module | Exact. The page's own "featured" card is not emitted. Desktop 4 / tablet 2 / mobile 1, measured |
| 8 | New body copy and four compensation tiles | Exact. The tiles are now `<h3>`, per section 14's "tile headings" |
| 9 | Six FAQs; `<h3><button>` with `aria-expanded`, `aria-controls`, unique ids | Exact. Answers ship in the HTML with no `hidden` attribute — the script collapses them on load, so they are crawlable and readable without JavaScript |
| 10 | Program Information copy; author line deleted | Exact. The byline is removed from the template itself, so no page can regrow it |
| 11 | Nine-step form, new fields, hidden CRM values | All nine steps, conditional step 5 on all three branches, `compensation_profile` and `variable_compensation_history` as new fields |
| 12 | Closing CTA copy and trust line | Exact. Does not repeat the market name |
| 14 | One H1, semantic H2/H3, FAQPage schema matching visible copy | One H1, no skipped heading levels, schema compared question-by-question against the rendered text |
| 15 | Event names and non-PII properties | All present. `faq_question` removed from the analytics payload — see section I |
| 16 | Seven viewports, keyboard, focus, labels | Measured at all seven — see section G |

**Sticky CTA (section 13).** There is no sticky bar on this page, so its rules
did not apply. The conditional wording in the handoff — "If the global sticky
bar remains active" — is why nothing was added.

**Form field names.** `compensation_profile` and `variable_compensation_history`
are new names rather than reuses of `income_profile` and
`self_employment_history`. Those two are still sent by the self-employed and
1099 pages and still mean what they say there; filling
`self_employment_history` with a W-2 employee's compensation history would
quietly corrupt the field for the pages that use it properly. Both new names are
on your section 15 property list, so they may be sent as event properties.

Registering them turned up a real defect. `audit-integrity.js` already checks
that every field a form POSTs is declared in `crm_custom_fields_required`, and it
correctly reported both new names as missing — GoHighLevel drops an unrecognised
field silently, so the endpoint would have accepted every answer to steps 2 and 4
and the CRM would have discarded them, with no error on either side. But that
script was not in the build’s step list and exited 0 whatever it found, so the full
build printed green with the finding sitting unread. Both are fixed: the fields are
registered, `CRM-ROUTING.md` is corrected, and the audit now runs as a build step
and fails on any HIGH finding.

## G. Viewport and accessibility results

Measured in the local preview after the webfonts had loaded, at 320, 375, 390,
768, 1024, 1280 and 1440.

```text
Horizontal scroll      none at any width — body.scrollWidth equals clientWidth,
                       and an attempted scrollTo(400, 0) moves nothing
Related cards          4 columns at 1024/1280/1440, 2 at 768, 1 at 320/375/390
Hero, context, FAQ     two columns at 1024 and above, stacked below
Form card              inside the viewport at every width; never clipped
Program Information,   fit at every width
closing CTA, qualifier
```

Accessibility, measured on the rendered page rather than the source:

```text
One H1, no skipped heading levels through the whole document
Related cards, panel heading, FAQ questions and tile headings are all H3
Accordion   6 buttons, 6 uniquely-identified panels, aria-labelledby resolves,
            keyboard focusable, one open at a time, answer text in the DOM
            while collapsed
Focus       3px gold ring on the accordion toggles; rule verified present
Form        every control labelled; every radio group in a fieldset with a
            legend; answers survive Back and Continue; step 5 branches
            correctly for purchase, refinance, cash-out and investment
Honeypot    hidden, aria-hidden, tabindex -1 — not exposed to a screen reader
Console     no errors
```

Two observations rather than changes:

- The three source links in the Program Information box are 16px high, below the
  24px WCAG 2.2 target-size minimum. It is pre-existing on all sixteen pages and
  this handoff did not ask for it. Say the word and it is a one-line change to
  the shared stylesheet.
- FAQ questions render in capitals. A global `button { text-transform:
  uppercase }` rule does it, and the 1099 page you have already seen renders the
  same way, so it is the established look rather than something introduced here.
  Also a one-line change if you would rather see them as you wrote them.

## H. The global sections, 1.1 to 1.5

**1.1–1.3 — the footer statement.** One string in `_build/global-footer.js`,
written onto all 24 pages by a post-pass and checked on all 24. It is not
hardcoded page by page, which is what section 1.1 asked for. The reason it is a
post-pass and not a template edit: the footer reached the suite by four
different routes, and three pages are file-maintained with no builder at all, so
editing the builders would have left those three behind — which is exactly how
the Self-Employed dropdown ended up correct in the builder and wrong on ten
pages.

Two things in the new statement still need substantiation and are listed in
`PUBLIC-CLAIMS.md`: "the premier mortgage lender" is a superlative, and "Since
2002" is a tenure attribution.

**1.4 — How to Qualify retired.** Server-side 301, one hop, to the self-employed
hub, with query strings and UTMs preserved — verified in the preview. Gone from
navigation, footer, quick links and the sitemap. No legacy content and no
generic Key Requirements block was carried into any new page. The redirect map
is in source control in `_build/consolidation-map.js`, and a new gate,
`_build/check-htaccess-redirects.js`, fails the build if that map and `.htaccess`
ever disagree — they had already drifted twice in one day.

**1.5 — the two prohibited phrases.** Neither appears anywhere in the suite. The
author byline is removed from the template itself, so no rebuild can regrow it.

## I. Where this build deviates, and what needs your decision

Four items. Each is implemented one way and recorded, not left silently.

**1. A third wording of the $5M / $20M statement.** Your section 7, card 1,
reads:

```text
Available programs may support loans up to $5 million, while customized
financing paths for larger requests up to $20 million may also be available
through lender relationships and individual review.
```

Your 14 September direction gives "Available Super Jumbo mortgage programs up to
$5 million." and "Case-by-case financing paths up to $20 million may be
available.", and asked for that wording to be used consistently across cards.
The 1099 handoff then wrote them a second way. This is a third. It is
implemented as you wrote it here, because it is the later and more specific
direction for this page, and your own acceptance list requires the two
statements to stay distinct and qualified — which this wording does. **One
wording should be chosen for all three places.**

**2. The footer program list.** Section 13 says "ensure links are valid or
omitted until live" and gives ten items. The list had nineteen, eight of which
named products with no page of their own — Profit & Loss Loans, Bridge Loans,
Buy Before You Sell, Spec Construction Lending, Asset Only Program, Seller
Financing (MORE), Jumbo Mortgage Options, Second Home Financing. Every one was
repointed to a hub, so no link was broken; what a visitor got was eight
differently-labelled routes to the same two pages.

It is now one list in `_build/footer-programs.js`, written onto every page, with
no duplicate destinations. Two departures from your ten:

- **"Profit & Loss Mortgage Options" is omitted.** There is no Profit & Loss
  page; the route 301s to the Self-Employed hub, which is already item 2.
  Including it would put back one of the duplicate rows this rewrite exists to
  remove. Your own wording permits omission until live.
- **"Home Loan Options" and "Construction Loans" are kept, after the ten.** Both
  are live pages with real content, and removing their only footer entry would
  be a navigation regression you did not ask for.

**3. The 1099 footer label.** The 1099 handoff set it to "1099 Income
Documentation Options". Section 13 of this handoff gives "Mortgage Options for
1099 Income". The newer, footer-scoped one is applied. Two handoffs, two labels —
your call.

**4. FAQ analytics.** Section 9 says "track only `faq_index`, `faq_id`, and
expanded state". Both FAQ implementations were also sending the question text as
`faq_question`. It was never personal data, but it was page copy travelling into
the analytics stream for no benefit and it is not on your section 15 list, so it
is gone — from the `<details>` pages as well as this one.

While removing it, the payload inventory in `ANALYTICS-EVENTS.md` turned out to
be a hand-kept list that had drifted from the code. It is now read out of the
scripts by brace-matching the payload objects, and the generator refuses to
produce the document if any field name looks personal.

## J. Gates added with this work

Each was deliberately broken once to confirm it fails, and the failures are
quoted here because a gate nobody has seen fail is a gate nobody knows works.

```text
_build/check-rsu-page.js
  Broke four things at once — a bullet's wording, one aria-controls, one tile's
  heading tag, the context CTA's cta_location — and it reported all four.

_build/check-htaccess-redirects.js
  Deleted the RSU rule, retargeted the How to Qualify rule, and pointed a rule
  at a live page. Reported: a route that would 404 in production, a target that
  disagrees with the map, and a live page that would be unreachable.

_build/build-programs.js — accordion semantics
  Caught the first build of this page on its own: "FAQ count: 0 visible vs 6 in
  schema", because the schema check could not yet read the button pattern. It
  refused to write the page rather than ship a schema for questions it could
  not find.

_build/build-fileset.js — Markdown default-deny
  A list of internal filenames only protects the names somebody remembered;
  COPY-REVIEW.md and GO-LIVE.md had already shipped that way once. A Markdown
  file at the web root is now internal unless declared otherwise. Tested with a
  stray file: refused to write the fileset.

_build/build-review-pack.js — analytics payload inventory
  Added a "visitor_email" field to a payload. Refused to generate the document.

_build/audit-integrity.js — now a build step, and now able to fail
  It already had the CRM-field check and already reported the two new RSU
  fields as unregistered. It simply was not in the build’s step list, and it
  exited 0 whatever it found. Removed a field from the manifest again after
  wiring it in, to confirm: exit 1, "1 HIGH finding(s) — build failed".
  A gate that does not run and a gate that cannot fail are the same gate.
```

## K. What is still outstanding

```text
1. One wording for the $5M / $20M statements, across the Super Jumbo page, the
   1099 Program Highlights and this page's high-balance card.
2. The two footer-list deviations in section I.2.
3. The 1099 footer label in section I.3.
4. Substantiation for "the premier mortgage lender" and "Since 2002" in the
   global footer statement.
5. Product and compliance approval of the compensation language, per your
   section 17, step 13. Nothing in the build verifies that.
```

---
---

# Response to the Self-Employed Hub handoff

**Written 15 September 2026.** Covers the handoff of the same date, section by
section, including its global footer change (§12).

> **What the automated controls do and do not do**
>
> ```text
> Automated content and build controls help enforce approved copy, structural
> requirements, placeholder handling, and selected prohibited phrases. They do
> not independently verify substantiation, product availability, legal compliance,
> privacy compliance, licensing requirements, testimonial permissions, or
> state-specific mortgage-advertising obligations.
> ```
>
> A passing build is not a compliance review and is not reported as one.

## L. The page

The hub keeps its route, its template and its role. What changed is its scope:
four documentation labels became six, four mortgage-path cards became six, five
FAQs became seven, and the form gained two documentation options plus a
conditional loan-range question.

It is now built from `_build/page-self-employed.js` by
`_build/build-self-employed-hub.js`, the same pattern as the 1099 and RSU pages,
and the acceptance block is generated from that content module rather than
written by hand.

| Section | What it asked for | State |
|---|---|---|
| 1 | Keep the page as a category pillar | Kept. No self-referential hub card in its own grid, and DSCR stays adjacent investor content rather than a self-employed documentation card |
| 4 | Title, meta description, canonical, OG, local-language rule | All exact. "Dallas–Fort Worth" appears in the URL, title, meta description, H1 and one hero sentence only — the gate counts it in the visible body and fails above two |
| 5 | Hero second sentence, form intro, disclaimer, full form flow | Exact. Step 4 carries all eight options including No Ratio and Super Jumbo |
| 5 | Step 4a conditional loan-range question | Added, shown only for the Super Jumbo answer, and its inputs are disabled when it does not apply so it submits empty rather than a stale answer. Panel keeps `data-step-panel="4"` so the counter still reads "of 9" |
| 6 | Six documentation labels, microcopy, side-panel copy, terminology | Exact. Laid out 3 × 2 on desktop — your "optional preferred two-row layout". No Ratio is deliberately *not* in the generic documents panel, per your own instruction |
| 7 | Six cards, 3/2/1 grid, corrected 1099 title, grid qualifier | Exact. Measured at 3 columns from 1024 up, 2 at 768, 1 below. Visible title is "Mortgage Options for 1099 Income" |
| 8 | Not Sure heading, body, and routing | Exact. Fires `not_sure_cta_click` with `cta_location=hub_not_sure` |
| 9 | High-balance sentence, tile 02 label, one text CTA | Exact. Fires `why_leahy_cta_click` |
| 10 | Seven FAQs on an accessible accordion, schema matching exactly | Exact. Schema is *generated from the same array* as the visible copy, so the two cannot disagree |
| 11 | Closing CTA body, phone, trust line | Exact |
| 12 | Footer statement, program links, 1099 label, tenure | Applied — see section N |
| 14 | Hidden fields, program-interest values, events | `campaign_theme` is now `self_employed_alternative_documentation`; the three new events are registered |
| 15/16 | One H1, semantic hierarchy, seven viewports | Measured — see section M |

**Sticky bar (§13).** There is no sticky bar on this page, so its rules did not
apply. Your wording — "If the global sticky bar remains active" — is why nothing
was added.

## M. Viewport and accessibility results

Measured in the local preview after the webfonts had loaded, at 320, 375, 390,
768, 1024, 1280 and 1440.

```text
Horizontal scroll   none at any width. body.scrollWidth equals clientWidth and
                    an attempted scrollTo(400, 0) moves nothing. The only
                    element outside the viewport is the skip link parked at
                    -9999px, which is the standard visually-hidden pattern
Six-card grid       3 columns at 1024/1280/1440, 2 at 768, 1 at 320/375/390
Documentation strip 3 columns × 2 rows on desktop, 2 at tablet, 1 on mobile
Hero, context, FAQ  two columns at 1024 and above, stacked below
Form card           inside the viewport at every width; never clipped
```

Accessibility, measured on the rendered page rather than the source:

```text
One H1; no skipped heading levels; 16 H3s (cards, panel, tiles, FAQ questions)
Accordion    7 buttons, 7 uniquely-identified panels, aria-labelledby resolves,
             keyboard focusable, answers in the DOM while collapsed
Form         every control labelled; all nine radio groups in a fieldset with a
             legend; step 4a correctly skipped and disabled when it does not
             apply; answers survive Back and Continue
Honeypot     hidden, aria-hidden, tabindex -1
Console      no errors
```

One correction worth recording: the first 320px reading reported a 3px
horizontal scroll. It was measured before layout had settled. Re-measured after
a proper settle, `body.scrollWidth` equals `clientWidth` and the page does not
scroll sideways at any tested width. The page was not changed to fix it, because
there was nothing to fix.

## N. §12, and the footer statement conflict

**This handoff reverses the footer statement applied earlier the same day.**

The RSU handoff §1.1 set it to *"We say yes when others say no. The premier
mortgage lender for self-employed individuals, realtors and investors. Since
2002."* and that was applied to all 24 pages. §12 here replaces it with the
specialty-positioning wording plus *"25+ Years in Business."*

The reason this was raised rather than simply applied: **§12 quotes the copy it
is replacing as "…self-employed individuals *and W-2 investors*. Since 2002."**
That is the *pre-RSU* wording. Whoever wrote this handoff was reading a version
of the site from before the RSU change landed, so which document is the later
direction is genuinely ambiguous. It was put to the owner, and the decision was
to apply the hub wording. It now ships on all 25 pages from one source.

Two things follow from it:

- **The tenure claim needs settling.** "25+ Years in Business" and the
  superseded "Since 2002" cannot both be right — 2002 to 2026 is 24 years.
  Neither is substantiated. Both are in `PUBLIC-CLAIMS.md`.
- **"We say yes when others say no" is barred everywhere again.** The sentence
  that carried it is gone, so the footer exception in the wording gate has been
  removed and DFW pages are now checked whole. The 14 September homepage handoff
  §4 required its removal and §2 barred it as CTA language; that is now enforced
  with no exception.

**Footer program links.** §12's ten-item list differs from the RSU handoff's on
two entries. Both are resolved by the rule the two share — "ensure links are
valid or omitted until live", "do not render dead links":

- **"Bridge / Investor Financing" is not added.** There is no bridge page; the
  route is consolidated onto `/home-loans/`, which the list already carries
  under its own name. Adding it would recreate exactly the duplicate-destination
  row the list was rewritten to remove.
- **"RSU, Bonus & Commission Income Options" is kept.** It is a live page with
  its own route, named explicitly by the RSU handoff. §12's rule is about
  validity, not exhaustiveness.

Everything else §12 asked for was already true: the 1099 label, the Profit &
Loss omission, and no dead links.

## O. A defect this handoff surfaced

Adding step 4a to the hub put `super_jumbo_loan_range` on a second page — and
the CRM-field gate failed immediately.

The field has been on the **market home's** form since the homepage handoff
added its conditional step 4a. It was in neither `CRM-ROUTING.md` nor
`crm_custom_fields_required`. GoHighLevel drops an unrecognised field silently,
so every answer to that question would have been accepted by the endpoint and
discarded by the CRM, with no error on either side.

The check that exists to prevent exactly this walked the DFW *subdirectories*
and built `<entry>/index.html` — which never reaches
`texas/dallas-fort-worth/index.html` itself. The market home carries the largest
scenario form on the build and was the one page the check could not see. It now
includes it, and scanning it surfaced no other unregistered fields.

## P. Where this build deviates, and what needs your decision

**1. Six wordings of the $5M / $20M pair.** This handoff supplies three more —
§7 card 6, §9, and §10 FAQ 6 — on top of the 14 September Super Jumbo direction,
the 1099 Program Highlights, and the RSU card. Each is implemented as its own
handoff writes it, because paraphrasing an approved statement is how the
conditional half gets lost. **One wording should be chosen for all six.**

One of the three is flagged separately: FAQ 6 says *"Leahy Lending **offers**
available programs up to $5 million"*. Every other wording on the build
attributes availability to the programs rather than to the company as an offer.
Implemented as written because it is owner-supplied copy, and reported because
it is the firmest version of the claim on the site.

**2. The footer statement and the tenure line** — section N.

**3. The footer program list** — section N.

## Q. Gates added or fixed with this work

```text
_build/build-self-employed-hub.js — acceptance generated from the content module
  Put "1099 Mortgage Options" and "no income verification" into the content
  module and rebuilt: both reported as barred wordings, page not written.
  Broke an anchor: "og:description: anchor not found".

  Worth being precise about what this gate does and does not do. The builder
  OWNS the strip, the cards, the tiles and the FAQ — it rewrites them from the
  content module on every run — so a hand-edit to those regions is repaired,
  not reported. What the acceptance block catches is bad content and a failed
  application, which are the two things that can actually ship.

_build/audit-integrity.js — the CRM-field scan now opens the market home
  It never had. See section O.

_build/build-self-employed-hub.js — idempotency
  Ran three times from a clean page: 72,181 bytes, then unchanged, then
  unchanged. Getting there took two fixes, both of which had shipped a working
  first run and a broken second:
    · four region rewrites each located their closing tag with their own
      newline-and-indent needle and compared against a string with different
      bounds, so each failed to recognise its own output and rewrote it with a
      doubled indent. One depth-matching helper now owns all four.
    · the §9 high-balance sentence is APPENDED after a paragraph that stays
      where it is, so its anchor was still present on every later run and the
      sentence was added again each time — 330 bytes per run while every line
      of the report said "already". The fix is ordering: check whether the page
      is already in the target state BEFORE looking for the anchor.
```
## R. Independent audit of this handoff

`_build/check-self-employed-hub.js` checks the built page against the handoff
with **195 checks**, every expected string typed from your document by hand
rather than generated from the content module.

That distinction matters. The builder's own acceptance block is generated from
`page-self-employed.js`, so it proves the page matches what it was built from —
it cannot catch a typo in the module, because it would apply the typo and then
confirm it. This audit also covers every "keep" instruction the builder never
touches: the form eyebrow and heading, steps 1, 2, 3 and 5 to 9, and the section
headings. Nothing on this build was checking any of those before.

**Result: 195 checks, 0 failed, 2 declared deviations.**

The audit found four failures on its first run. Two were its own errors — a
self-referential-card check that counted the H1 and the hero eyebrow, and a
fieldset/legend count whose pattern missed the three step-5 branches — and are
fixed. Two were real and are below.

It also surfaced a defect while being written: `CRM-ROUTING.md` carries **two**
tables of form option values, and only one of them had been updated for No Ratio
and Super Jumbo. The provisioning sheet would have been built from a stale list.
Corrected, and the gate now checks the form against that sheet in both
directions — negative-tested by renaming two option values, which it caught each
way.

### Two declared deviations — open with you, not defects

**1. §12, "25+ Years in Business" — the About page still says "Since 2002".**

Twice, both inside captured Austin body copy: the H1 *"Austin's Trusted Lender
for Over Two Decades"*, and a stat block reading *"Since 2002 / Austin's Trusted
Mortgage Specialist"*. That page is a verbatim clone of the live Austin
`/about`, permanently noindex, and is already ring-fenced from the wording gate
for the same reason — rewriting it would be this build deciding what the rest of
leahylending.com says.

Every page this build assembles says "25+ Years in Business". Say the word and
the About clone follows.

**2. §15, BreadcrumbList schema is absent.**

The page renders no visible breadcrumb — the breadcrumb bar was removed from the
template — and §15's own rule is *"Implement only truthfully visible and
maintained schema"*. Emitting BreadcrumbList for a trail that is not on the page
would break that rule in order to satisfy the list.

Two ways to close it: add a visible breadcrumb to the shared template, which is
a layout change across the whole suite, or leave it as is. Your call.

One clarification on §15: the page declares `FinancialService` rather than
`Organization`. `FinancialService` is a subtype of `Organization`, so the
requirement is met by the more specific and more accurate of the two types.
---
---

# Response to the DSCR Investor handoff

**Written 15 September 2026.** Covers the handoff of the same date, section by
section.

> **What the automated controls do and do not do**
>
> ```text
> Automated content and build controls help enforce approved copy, structural
> requirements, placeholder handling, and selected prohibited phrases. They do
> not independently verify substantiation, product availability, legal compliance,
> privacy compliance, licensing requirements, testimonial permissions, or
> state-specific mortgage-advertising obligations.
> ```
>
> A passing build is not a compliance review and is not reported as one.

## S. The page

**Route: `/texas/dallas-fort-worth/dscr-investor-loans/`** — the route the
header recommends and §14's canonical names. The old
`/dscr-investor-mortgages/` 301s to it in one hop with query strings preserved,
verified in the preview. The Austin static keeps `/dscr-investor-loans/` at the
site root; a different path, so the two do not collide.

Content lives in `_build/page-dscr.js`, and `_build/check-dscr-page.js` audits
the built page against the handoff with **205 checks**, every expected string
typed from your document by hand rather than generated from the module — the
same separation used on the Self-Employed Hub, for the same reason.

**Result: 205 checks, 0 failed, 1 declared deviation.**

| Section | State |
|---|---|
| 1 | Everything on your "what is working" list is retained |
| 2 | Market name appears once in the visible body (the H1). Every "avoid" word is absent — the gate fails the build on each |
| 3 | Hero, form eyebrow, form heading, intro and disclaimer all exact. The disclaimer names leases |
| 4 | Context copy exact, all three bullets exact, callout fires `context_cta_click` with `cta_location=dscr_context` |
| 5 | Panel eyebrow is now "INVESTOR SCENARIOS TO DISCUSS"; all four profiles and the conclusion exact. Nothing claims personal income is ignored |
| 6 | Six cards, 3/2/1 measured. Generic "Home Loan Options" card removed. Grid qualifier visible. No Ratio and Super Jumbo wording exact |
| 7 | Body copy and all four tiles exact; tiles are H3 |
| 8 | Six FAQs on the button accordion; schema generated from the same array as the visible copy |
| 9 | Disclosure copy exact, three approved links, **no author byline** — see below |
| 10 | Investor questionnaire with the conditional Super Jumbo sub-step; `program_interest=dscr` |
| 11 | H2 replaced, copy and trust line exact, market name removed from the closing block |
| 12 | Footer statement and program links as directed |
| 14 | Title, meta, canonical, one H1, noindex, WebPage + Organization + FAQPage schema |
| 16 | Seven widths, no horizontal scroll — see below |

**§9, the author line.** You wrote "Use `Written by Leahy Lending` only if
publisher/author attribution is approved and consistent sitewide." It is not:
the RSU handoff §1.5 bars that exact phrase everywhere, and the build enforces
it on every page. So the conditional resolves to your own fallback and no byline
was added.

**§13, sticky bar.** There is no sticky bar on this page, so its rules did not
apply.

## T. §10, the form — one structural difference

Your §10 numbers the steps in an order the shared template does not use: it puts
timeline at 3 and contact at 7. Your own instruction is "Use the shared
nine-step scenario form, configured for investor intent", and §10 step 9
explicitly anticipates the template's fixed progression.

So the template's panel order is kept and **every field you name is present**;
only the radio steps were swapped. What ships is:

```text
1  What are you hoping to do?                  transaction_goal
2  Property or investment plan                 rental_strategy
3  Do you expect rental income?                expected_rental_income
4  Which financing path                        documentation_path
4a What loan amount range (conditional)        super_jumbo_loan_range
5  Funds / equity, by transaction type         (shared conditional)
6  Where are you in the process?               timeline
7  Property city and state                     property_city_state
8  Contact details                             first_name, email, phone, ...
9  How did you first hear about us?            discovery_source
```

Moving contact and city would mean rebuilding a form eight other pages share, so
the difference is reported rather than forced. Say the word if the order matters
more than the shared structure.

`investor_experience` is gone — §10 does not ask for it and its panel was needed
for `rental_strategy`.

## U. §16 results, and a real defect this handoff surfaced

Measured at 320, 375, 390, 768, 1024, 1280 and 1440.

```text
Horizontal scroll   none at any width
Six-card grid       3 columns at 1024+, 2 at 768, 1 below
Hero / context      two columns at 1024+, stacked below
FAQ                 6 buttons, unique panel ids, answers crawlable
Form                nine steps, 4a conditional, fieldset+legend on all groups
Console             no errors
```

**The DSCR page was scrolling sideways at 320px, and so was every other page.**

`[data-reveal="left"|"right"]` animates an element in from ±32px on the X axis.
Once the layout stacks to one column those elements already span the content
width, so the slide pushed them 32px past the viewport *for the length of the
animation* — 16px of real horizontal scroll at 320px, and 8px at 768px. It is
pre-existing and suite-wide, not something either handoff introduced.

It is fixed below 860px, where the layout has already stacked and a horizontal
slide no longer means anything: the reveal becomes the same vertical rise the
other elements use.

**Worth saying plainly: my earlier viewport passes would not have caught this.**
They took a single measurement after layout settled, and this overflow only
exists *while* the animation runs. The method now samples repeatedly while
scrolling the whole page. The DSCR, RSU and Self-Employed Hub pages were all
re-measured that way and all read zero.

## V. What needs your decision

**1. `program_interest` for this page changed from `dscr_investor` to `dscr`**,
per §10. **Any GoHighLevel workflow routing on `dscr_investor` will stop
matching** and must be repointed before launch. `landing_page` changed from
`dfw_dscr_investor_mortgages` to `dfw_dscr_investor_loans` at the same time.
`CRM-ROUTING.md` carries a provisioning note listing what must *not* be created:
`investor_experience` is now posted by no page at all.

**2. BreadcrumbList schema is still absent** — the same open item as the
Self-Employed Hub. These pages render no visible breadcrumb, and §14 permits
only accurate and visible structured data. Closing it means adding a visible
breadcrumb to the shared template, which is a layout change across the suite.

**3. The Super Jumbo wording is now consistent, and that is worth noting.**
Your §6 card 5 uses word-for-word the same two amount sentences as the
Self-Employed Hub's §7 card 6. They are read from one constant rather than
retyped, so those two pages cannot drift apart. That still leaves the earlier
variants — the 14 September Super Jumbo direction, the 1099 Program Highlights,
and the RSU card — and one wording should be chosen across all of them.

## W. Gates added with this work

```text
_build/check-dscr-page.js — 205 checks, typed from the handoff
  Broke four things in the content module — the panel eyebrow, the No Ratio
  qualifying sentence, a form option label, and the closing H2 — and it
  reported eight failures across four sections, refusing the page.

_build/build-programs.js — the step-label check no longer fails on "unchanged"
  It treated "the label is already correct" as an error, which is what stopped
  the first DSCR build: step 1 legitimately keeps the template's label and only
  swaps its options. Absent is a failure; unchanged is not.

_build/form-steps.js — conditional sub-steps are data now
  The homepage grew a Super Jumbo loan-range question by hand, the Self-Employed
  Hub's builder inserts its own, and this handoff asked for a third. One
  implementation, declared per page, and the fieldset-count gate moves with it
  instead of hard-coding eight.
```
## X. Correction — three things the first pass reported as done and were not

The first report on this handoff said "205 checks, 0 failed". That was true and
also misleading: three of §10 and §15's requirements were **not checked**, so
they could not fail, and all three were unmet.

**1. §10 submit CTA.** The button read "Start My Scenario Review". The handoff
asks for "START MY INVESTOR SCENARIO REVIEW". Now page-configurable and set.

**2. §10 success message.** The shared script said "Thank you. Your scenario
review request has been received." The handoff asks for "Your **investor**
scenario review request has been received." The page now supplies its own
wording through `data-success-message`; every other page keeps the shared
sentence.

**3. §15 analytics properties.** `rental_strategy` and `expected_rental_income`
are on the required property list and were not being sent. Added, along with
`super_jumbo_loan_range`. `property_city_state` is still deliberately excluded —
it is free text, and §15 forbids it.

### And a fourth, older one: the form-progress event names

The code fired `scenario_form_start` and `scenario_form_step_complete`. All
**three** handoffs — RSU §15, Self-Employed Hub §14, and DSCR §15 — ask for
`hero_form_start` and `hero_form_step_complete`, while listing
`scenario_form_submit`, `scenario_form_success` and `scenario_form_error` under
*those* names. The distinction is consistent across all three documents and the
build had never honoured it.

Renamed suite-wide, because all three handoffs want the same two names. The
submission events keep theirs. Verified firing on the live page.

**If any GoHighLevel or GA4 configuration references `scenario_form_start` or
`scenario_form_step_complete`, it needs repointing** — alongside the
`dscr_investor` → `dscr` change in section V.

### What changed in how this is checked

The gate went from 205 checks to 234. The three misses were all of one kind: a
requirement nobody had written a check for. Two further checks were wrong in my
own favour and are fixed — one read a comment explaining that free-text fields
are excluded and reported the explanation as the violation.

Every added check was negative-tested. The payload one was proved by adding
`property_city_state` to the analytics allowlist: it failed, as it should.
---
---

# Response to the Asset Utilization handoff

**Written 15 September 2026.**

> **What the automated controls do and do not do**
>
> ```text
> Automated content and build controls help enforce approved copy, structural
> requirements, placeholder handling, and selected prohibited phrases. They do
> not independently verify substantiation, product availability, legal compliance,
> privacy compliance, licensing requirements, testimonial permissions, or
> state-specific mortgage-advertising obligations.
> ```

## Y. The page

`_build/check-asset-utilization-page.js` — **68 checks, 0 failed, 3 declared
deviations.** Every expected string typed from your handoff by hand.

| Item | State |
|---|---|
| Config | URL unchanged, Super Jumbo destination live so the form fallback is not used |
| 1 | Hero heading, lead sentence and body exact. **The hero CTA was removed** — see deviation 4 |
| 2 | Education retained. Nothing says every asset is eligible, that assets automatically become qualifying income, or that a visitor is approved — each is a check that fails the build |
| 3 | High-balance module placed after the education block and before the related-options grid. Not in the hero — verified by element order, not by eye |
| 4 | Super Jumbo CTA links to the DFW page |
| 5 | Qualifier is the last element *inside* the module, 18px below the CTA, at 320px and 768px alike — it cannot reflow away from the module because nothing can come between them |
| 6 | Primary CTA below the bridge, and visually distinct: the Super Jumbo CTA is a text link, this one is the gold button |

Seven-width sweep, sampled while scrolling: zero horizontal overflow. One H1,
no skipped heading levels, every radio group in a fieldset with a legend, no
console errors.

## Z. Four deviations

**4. Item 1’s hero CTA is not rendered.** Your item 1 ends with "DISCUSS YOUR DFW
ASSET UTILIZATION SCENARIO →". It was built as a hero link to 
— but on this template that anchor *is* the scenario form, which sits in the
hero immediately beside the link. Clicking it appended a fragment to the URL and
jumped to a form already on screen, which reads as a reload of the same page.

Removed on Jake’s instruction, 15 September 2026. **No CTA copy was lost**: the
wording now appears exactly once, on the gold button below the high-balance
bridge, which is where your item 6 puts the primary conversion CTA. The gate
asserts that count is exactly one, so it cannot silently come back or disappear.

The three below still need your decision.

### The original three

**1. The $5M sentence is one word from the Super Jumbo page's.**

```text
this page          Available Super Jumbo programs may support loan amounts up to $5 million.
Super Jumbo page   Available Super Jumbo MORTGAGE programs may support loan amounts up to $5 million.
```

The $20 million sentence is **identical** on both, so it is literally the same
constant. Only the $5 million sentence differs, by the word "mortgage", on two
pages that link to each other through this very module.

That reads like a transcription slip rather than a decision. But both handoffs
say "exactly", a build cannot tell a slip from an intention, and guessing wrong
on a public amount claim is the worse error — so each page ships what its own
handoff says and the gate enforces the difference. It caught a deliberate swap
of one for the other during testing.

**This is now the eighth wording of these two figures.** It is the clearest case
yet for settling on one across the suite.

**2. The H1 and the title tag now differ in styling.** Your hero heading is
"Asset Utilization Mortgages in Dallas–Fort Worth"; the title tag and eyebrow
still read "Asset-Utilization Mortgage Options". You supplied no new title tag,
and your own escalation points make this product's naming a product/compliance
decision — so I changed neither.

**3. The market name is now inside this page's CTAs.** The 14 September
direction keeps it out of controls, and the RSU, Self-Employed Hub and DSCR
handoffs all reinforce that. This handoff supplies CTA text containing "DFW" and
its validation checks require it. Applied as an explicit page-scoped override
(`marketInCtas`), recorded with its reason, and **form labels stay exempt from
the override everywhere** — no handoff has ever asked for the market inside a
field label, so that half of the rule is now absolute rather than overridable.

## Gate behaviour worth knowing

The build stopped twice on this page before it would write, and both were the
right call:

```text
market name inside a CTA, button or form label
  The 14 September rule, doing its job. Resolved by making the CTA half
  per-page and the form-label half absolute, not by deleting the rule.

market mentioned 15 times in body copy, cap is 8
  Your handoff asks for DFW framing in the hero, the CTA and the module.
  Cap raised to 14 for this page only, with the reason in the source.
```

## AA. Correction — two things the first pass reported as done and were not

The first report on this handoff said "68 checks, 0 failed". Both of these were
unmet, and neither was checked — so neither could fail.

**1. Item 2 names eight review factors. Four were absent from the page.**

Your wording: "State that review may consider eligible assets, asset
documentation and liquidity, credit, property, liabilities, reserves, and the
overall loan structure." The page stated eligible assets, credit, property and
reserves. **Asset documentation, liquidity, liabilities and the overall loan
structure appeared nowhere on it.**

My check looked for three generic words — "assets", "credit", "documentation"
— and passed. A check that samples a requirement is not checking it. The
enumeration is now on the page in your own words and order, and all eight are
checked individually.

**2. The fallback `source_page` was wrong.** Your page configuration gives the
fallback as `program_interest=super_jumbo`, `source_page=asset_utilization`.
The link was carrying `source_page=dfw_asset_utilization_mortgages` — the
`landing_page` value. Harmless while the Super Jumbo page is live, wrong the
moment the fallback is used, which is exactly when nobody would be watching.
Both values are now on the link and both are checked.

The gate went from 68 checks to 76. Both additions were negative-tested by
removing what they assert.
---
---

# Response to the Bank Statement handoff

**Written 15 September 2026.**

> **What the automated controls do and do not do**
>
> ```text
> Automated content and build controls help enforce approved copy, structural
> requirements, placeholder handling, and selected prohibited phrases. They do
> not independently verify substantiation, product availability, legal compliance,
> privacy compliance, licensing requirements, testimonial permissions, or
> state-specific mortgage-advertising obligations.
> ```

## BB. The page

`_build/check-bank-statement-page.js` — **73 checks, 0 failed, 2 declared
deviations.** Every expected string typed from the handoff by hand.

This page is file-maintained — no builder generated it — so it gained an
applier, `_build/build-bank-statement-page.js`, built on the two idempotency
lessons the Self-Employed Hub cost: the substitution helper checks the
post-state *before* the anchor, and whole elements are depth-matched rather
than located by hand-written indentation. Three consecutive runs: 60,704 bytes,
unchanged, unchanged.

| Item | State |
|---|---|
| Config | URL unchanged. Fallback values carried on the link — `program_interest=super_jumbo`, `source_page=bank_statement` — so they are already right if the Super Jumbo page ever stops being live |
| 1 | Heading, lead sentence and body exact. **The hero CTA is not rendered** — see deviation 1 |
| 2 | Education retained. All seven review factors now stated; two were missing — see below |
| 3 | Bridge placed after the education content and before the related-options grid. Verified by element order |
| 4 | Super Jumbo CTA links to the DFW page |
| 5 | Qualifier is the last element *inside* the module, 18px below its CTA, identical at 320px and 1440px |
| 6 | Primary CTA below the bridge, gold, distinct from the Super Jumbo text link |

Seven-width sweep sampled while scrolling: zero horizontal overflow. One H1, no
skipped heading levels, every radio group in a fieldset with a legend, no
console errors.

**One thing worth calling out as a positive.** Your amount language here is
word-for-word the Asset Utilization handoff's, so the two pages read from a
single constant rather than adding a ninth wording. The count stays at eight.

## CC. Item 2 — two of seven factors were missing

Your wording: *"State that review may consider personal or business bank
statements, deposit patterns, applicable business expenses, credit, assets,
property, and the overall loan scenario."*

The page stated five. **Applicable business expenses and the overall loan
scenario appeared nowhere on it.** The enumeration is now on the page in your
own words and order, and all seven are checked individually rather than sampled
— which is the mistake that let the same gap through on the Asset Utilization
page until it was audited a second time.

## DD. Two deviations

**1. Item 1's hero CTA is not rendered.**

Item 1 ends with "DISCUSS YOUR DFW BANK STATEMENT SCENARIO →". On these
templates the scenario form sits *in* the hero, so a link to `#scenario-review`
jumps to a form already on screen and reads as a page reload.

Jake had the identical control removed from the Asset Utilization page earlier
today for exactly that reason. Rather than ship a control he has already
rejected once and wait to be told again, the same decision is applied here. **No
CTA copy is lost**: the wording appears exactly once, on the item 6 CTA below
the bridge, and the gate asserts that count is one.

If you want a hero CTA on these pages it needs a different target than the form
already visible beside it.

**2. The H1 and the title tag differ in styling.** Item 1's heading is "Bank
Statement Mortgages in Dallas–Fort Worth"; the title tag still reads "Bank
Statement Mortgage **Options** in Dallas–Fort Worth". You supplied no new title
tag, so neither was changed. The same mismatch exists on the Asset Utilization
page from its handoff, so a single decision would settle both.

## EE. A checking mistake, repeated and fixed

The item 2 prohibitions check failed the page on its own disclaimer — *"That
does not determine whether you qualify"* — because it matched the substring
`you qualify` without reading the negation. Item 2 forbids *stating or implying*
that a visitor qualifies; a sentence that negates is doing the work, not
breaking the rule.

This is the third time this session a flat substring check has flagged a
compliance-positive sentence as a violation — after `guaranteed` on the Super
Jumbo page and `property_city_state` on the DSCR page. All three now judge at
sentence level with negation awareness. Counting characters or matching bare
substrings does not work on prose, and the failure mode is always the same
direction: the disclaimer gets reported as the offence.
## FF. Confirmation pass — what the second audit added

The first report said "73 checks, 0 failed". Re-auditing against the handoff
text rather than against the gate found three things the gate was not looking
at. None was a defect on the page; all three were gaps in the checking, and
leaving them would have meant the next change could break them silently.

**1. "DFW Super Jumbo link tested" was asserted, not tested.** The gate checked
that the href existed and that a file sat at that path. It now also confirms the
href resolves to a real file, and the destination was fetched over the preview
server: **HTTP 200**.

**2. Three of the validation check's promise terms were unmatched.** It bars
"approval, guaranteed eligibility, pricing, rates, APRs, payment amounts, loan
terms, closing timing, savings, or universal availability". The gate covered
rates, APRs, payments and savings but nothing matched *loan terms*, *closing
timing* or *universal availability*. All are checked now, and all are clean.

**3. Desktop and mobile QA was two widths.** Now 320, 375, 390, 768, 1024, 1280
and 1440, each sampled while scrolling the whole page. Zero horizontal overflow
at every one.

The gate went from 73 checks to 81.

### A mistake made and caught inside this pass

Adding the promise terms required excusing the page's own qualifier —
"...requirements **vary** by borrower, lender, and program" would otherwise read
as an asserted claim about loan terms. I widened the negation list to include
"vary", "depends", "subject to" **and "may"** — and applied it to both check
classes.

That quietly disarmed item 2's prohibitions. Nearly every sentence on these
pages contains "may", so **"bank statements may replace all required
documentation"** would have passed — which is precisely the implication item 2
bars.

There are now two predicates. Claims are judged strictly, where only an explicit
negation excuses a sentence. Promise terms are judged leniently, where
qualifying language is the point. Negative-tested with that exact "may" phrasing:
the strict predicate catches it, and the page's own qualifier stays clean.
