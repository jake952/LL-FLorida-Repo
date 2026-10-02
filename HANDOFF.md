# Handoff — Leahy Lending staging

**Written** 2 September 2026. **Read `LANDING-PAGE-SPEC.md` before editing anything.**

This session wired up the mortgage calculator, repaired the page template, and
bridged the calculator into the compiled React shell. Below is what changed,
what is verified, what is blocked, and what not to undo.

---

## 0. Orientation

The site root is the **inner** folder — the download nests a folder of the same
name inside itself:

```
leahylending_staging_full_v54_plus_dfw_copy_preview_v0.3/
  leahylending_staging_full_v54_plus_dfw_copy_preview_v0.3/   <- site root, work here
```

Two generations of page live side by side, and the difference matters:

| Surface | Built from | Can you edit it? |
| --- | --- | --- |
| `/`, `/about`, `/bank-statement-loans`, + 11 more SPA routes | `assets/index--e7Hi0yS.js` (1.5 MB, minified, **no source, no sourcemap**) | No — needs the React repo |
| `/mortgage-payment-amortization-calculator/`, the three `/texas/…` pages, `/_template/` | hand-authored HTML + `landing-assets/` | Yes |

### Preview server

`.claude/launch.json` runs `.claude/static-server.js`, which approximates the
production `.htaccess`: real files win, directories resolve to `index.html`,
the 14 SPA routes fall through to the shell with a 200, `/texas/` and
`/texas/{market}/` return 404, nothing is cached.

Start it with the Browser pane's `preview_start` using config name
`leahy-staging`. **Paths in `launch.json` are relative, so the session's working
directory must be the site root.** Manual equivalent:

```bash
node .claude/static-server.js .
```

Then `http://localhost:4173/`. The previous session's config pointed at a
temp-directory script that no longer exists; that is why the server now lives
in `.claude/`.

---

## 1. The calculator — `/mortgage-payment-amortization-calculator/`

`LL-CALC-PAYMENT-01`, page version `1.0.0`, engine
`landing-assets/calculator.js` (`CALC_VERSION` `1.0.0` — the two are
deliberately kept in step; a snapshot identifies the page build that made it).

### Verified working

Maths is exposed on `window.LLCalc` so it can be tested without a browser.
Confirmed in the running page:

| Scenario | Result |
| --- | --- |
| $400k, 6.5%, 30 yr | P&I $2,528 · total interest $510,178 · payoff 30 yr 0 mo |
| $25k down → 95% LTV | MI row appears · $198/mo · total $3,200 |
| +$300/mo principal | payoff 22 yr 5 mo · $149,581 interest avoided |

Zero-rate branch is intentional (the standard formula is undefined at r=0).
MI applies only above 80% LTV, from a visible editable factor defaulting to
0.5%. `FAQPage` schema is byte-identical to the visible accordion (spec §11.5).

### Added this session

- **Analytics** — four milestone events, each firing once per load:
  `calculator_first_estimate`, `calculator_extra_principal_modeled`,
  `calculator_term_changed`, `calculator_schedule_expanded`.
- **No dollar amounts in any analytics payload.** These events reach GA4 and
  the Meta Pixel. LTV is reduced to a band (`above_80` / `80_or_below`);
  figures are omitted. Handoff §8 bans PII; this applies the same rule to a
  visitor's financial details. **Do not "enrich" these events with amounts.**
  The full scenario still travels with a submitted lead, where the visitor
  consented and the destination is the CRM.
- **Accessibility** — `aria-live` was on the whole summary `<aside>`, so every
  keystroke re-announced the total, four breakdown lines and four facts.
  Replaced with a scoped, debounced `role="status"` that speaks one sentence
  700 ms after typing stops. Nothing announces on first render.
- **Breadcrumb** — visible `<nav class="breadcrumb">` plus `BreadcrumbList`.
  The `.breadcrumb` CSS already existed in `landing.css`, unused.
- **Reachability** — see §3.

### Blocked — the calculator cannot capture a lead yet

1. **The 13 `calc_*` custom fields almost certainly do not exist in GoHighLevel.**
   They were absent from `crm_custom_fields_required`; this session registered
   them in `landing-manifest.json`, but that is a record, not the CRM. If a
   field is missing when a lead submits, **that value drops silently** — the
   contact still arrives with name, email and phone, so it looks like a working
   form.
2. **`data-form-mode="dry-run"`** on the calculator page. The full submit path
   has **never run against the live endpoint**.

Field list with types, examples and gotchas was handed to the user as a
separate reference. The two traps:

- **Use text fields, not number fields.** `scenario-stepper.js:423` posts all
  keys every time, including empty ones, so the payload shape never varies.
  `calc_rate_assumption` and `calc_total_interest` legitimately arrive as `""`,
  which a GHL number field can reject — failing the whole submission.
- **`calc_snapshot_json` is ~620 characters**, one unbroken string. Truncated
  into invalid JSON is worse than absent.

Order of work: create the fields → flip to `live` → one real end-to-end
submission → confirm all 13 landed → delete the test contact.

### Still open

- `MI_MODE = 'estimate'` awaits compliance sign-off. `'withhold'` is a
  one-line flip in `calculator.js` that suppresses the estimate.
- Staging gate on, as intended: `noindex` tags + `robots.txt` `Disallow: /`.

---

## 2. Nav overflow — a pre-existing bug, now fixed

Adding a `Calculator` entry made an eighth top-level nav item, which exposed
that **the row already overflowed before anything was added.** Measured by
comparing the row's `scrollWidth` to `clientWidth` with the link hidden:

| Content width | Overflow, no Calculator | Was clipping |
| --- | --- | --- |
| 1009 px | **101 px** | the gold Start Application button |
| 1085 px | **25 px** | same |
| 1185 px | 0 | — |

Spec §6 documents the intended behavior — *"≤1279px header phone hidden so
the row fits"* — but that rule was only ever written for the
first-generation `.header-phone` in `landing.css`, never for `.ll-nav-phone`,
so it had no effect on these pages.

Fix appended to `landing-assets/chrome.css`, fully commented with the numbers:

- **≤1279 px** — hide the header phone, nav gap 12 → 8 px
- **≤1079 px** — gap → 6 px, nav-link letter-spacing .12 → .085 em

Letter-spacing was chosen as the least perceptible lever; it leaves the
bundle-extracted button geometry and brand lockup untouched. Result: zero
overflow from 1080 px up, and at 1024 px the residual 18 px is absorbed by
wrapping with nothing clipped. **The nav now fits from 1024 px up, which it did
not before.** The phone stays reachable via the mobile panel, footer and sticky
bar, and returns to the header at 1280 px.

---

## 3. Calculator reachability

### Static pages — the real thing

Three placements in each of the five chrome-carrying files
(`mortgage-payment-amortization-calculator/`, the three `/texas/…` pages, and
`_template/` so new markets inherit it):

| Placement | Label | `data-cta-location` |
| --- | --- | --- |
| desktop nav, after Construction Loans | `Calculator` | `primary_nav` |
| mobile disclosure panel | `Calculator` | `mobile_nav` |
| footer → Quick Links, after Self-Employed Guide | `Mortgage Calculator` | `footer_quick_links` |

Each carries `data-track="calculator_nav_click"` per spec §12.2. The
calculator's own two nav links carry `aria-current="page"`. Verified: the
footer click emits the event into both `ll:analytics` and `dataLayer` with no
PII.

### SPA routes — a stopgap, flagged as such

`landing-assets/spa-calculator-link.js`, loaded from `index.html`.

**This is not the fix.** The React nav and footer are inside the bundle, so
this injects the link into the rendered DOM and a `MutationObserver` re-adds it
after re-renders. The user was told the risks and chose to proceed.

The bundle still ships `data-loc` annotations naming the real source files:

```
client/src/components/Navigation.tsx
client/src/components/Footer.tsx    (Quick Links <li> at line 99)
```

**When the React repo turns up: add the link in those two components, then
delete `spa-calculator-link.js` and its `<script>` tag in `index.html`.**
Instructions are repeated in the file header.

How it behaves:

- Inherits styling by copying a sibling's `className` (nav) and cloning the
  Self-Employed Guide `<li>` (footer) — a restyle carries across.
- Injects into every container holding a `Construction Loans` link, so desktop
  and burger menu are covered by one path.
- **Bails entirely on static pages** (`if (document.querySelector('.ll-nav')) return;`)
  so they never get a duplicate.
- Tracks clicks straight into `dataLayer` and `fbq`, because `analytics.js` is
  not loaded on SPA routes.
- Every DOM write is in try/catch — a failure degrades to "no link", not a
  broken page.
- **It also mirrors the §2 nav-fit rules**, because the SPA does not load
  `chrome.css` and the injected item made the React header phone wrap from
  35 px to 52 px. Hooks are data attributes set from JS, not the bundle's
  Tailwind class strings, which a rebuild can change.

Verified: 0 overflow at 1009 / 1085 / 1185 / 1265 / 1425 px; survives
client-side routing `/` → `/about` → `/` at exactly 2 nav + 1 footer links with
no duplicates and no console errors; clicking does a full page load out of the
SPA onto the static calculator page.

Known limits, unchanged: a future bundle can reorder those children and drop
it (the observer means a flicker, not a silent loss), and there is a genuine
first-paint gap.

---

## 4. `_template/index.html` — three separate repairs

### 4a. Corrupted marquee

An entire `<body>` tag had been pasted **inside the marquee text**, where the
literal `$1` used to be:

```
... AUSTIN'S TRUSTED MORTGAGE SPECIALIST · OVER <body class="ll-chrome" … > BILLION IN LOANS FUNDED ·
```

A find-and-replace treated `$1` in the copy as a regex backreference. The
giveaway: the stray block said `data-loan-type="Bank Statement"` while the real
one said `{{LOAN_TYPE}}`, so it happened during the tokenizing pass. Visible
damage: the marquee read **"OVER BILLION IN LOANS FUNDED"** — the company's
billion-dollar claim with the amount missing. The stray tag itself was swallowed
by the HTML parser, which is why it survived unnoticed.

Repaired by lifting the canonical 249-character span from an intact page, so it
is byte-identical per spec §4.1. **Only the template was affected** — all four
real pages were checked and are intact.

### 4b. Local-language rule (spec §12)

The template violated the rule it documents, 26 times. Treatment mirrors the
shipping `bank-statement-mortgages` v0.6.0 page — the page the revision was
actually applied to — rather than an interpretation of the spec.

Now passes the spec's own acceptance tests:

| Check | Result |
| --- | --- |
| `DFW` in visible copy | 0 |
| Literal metro in visible copy | 0 |
| Metro in prose, excluding H1 + breadcrumb | 1 (the hero sentence) |
| Canonical CTA label | 4 × `Start a Scenario Review`, 0 variants |

Metro kept and tokenized to `{{MARKET_NAME}}` in: meta description, og:title,
og:description, `BreadcrumbList`, H1, the one permitted hero sentence, and the
property-market select option. Removed from: hero eyebrow, form kicker, submit
button, three CTA labels, bridge copy, paths intro, program-card CTA, process
goal sentence, process marker, FAQ intro, closing CTA. `(DFW)` was dropped from
meta and og:title — an acronym like that cannot generalize to Austin.

**`areaServed` was removed. Do not put it back without compliance sign-off.**
The shipping page carries none, and its head comment records why: service-area
metadata is withheld pending licensing and compliance approval. The template
was publishing it anyway, so every new market page would have asserted a
service area nobody approved. The approved shape is parked in an HTML comment
beside the JSON-LD block.

### 4c. The form was dead

The template loaded `scenario-stepper.js` but had **no `[data-stepper]`
element**. The script's first act is `if (!form) return`, so it bailed and the
form did nothing. It also had **no `sms_consent` fields** and used
`property_market` where the CRM contract expects `property_city_state`.

Ported the 9-step form from the shipping bank-statement page (7,710 chars out,
20,091 in). That page's form is metro-clean, so the markup moved across
unchanged. Kept the template's own heading and intro copy, adding
`data-form-heading tabindex="-1"` for the stepper's focus management.

**Also added six `<body>` data attributes the template never had** — the hidden
half of the job. `scenario-stepper.js` and `analytics.js` read them, and
without them the form submits but `landing_page`, `market_page`,
`campaign_theme` and `program_interest` all arrive blank: every one a required
CRM field, and the ones GHL routes on.

Driven end to end in the browser, not just rendered:

| Test | Result |
| --- | --- |
| Stepper initializes | 9 panels, only panel 1 visible |
| Continue with nothing answered | blocked — *"Select an option to continue."* |
| Advance | Step 2 of 9, bar 11% → 22% |
| Screen-reader live region | *"Step 2 of 9: your income."* |
| All 9 steps → submit | reached submit; dry-run intercepted |
| Payload | **33 custom fields**, no token leakage into values |

Diffed against the manifest's required list: 33 of 33 applicable fields.
The three absent are correct by design — `work_profile` and
`1099_income_history` are 1099-page-only per the manifest's own note, and
`sms_consent_ip` is stamped server-side from `x-forwarded-for`.

A2P/10DLC consent now works where the old form had none: both checkboxes,
plus `sms_consent_timestamp` as real ISO-8601, `sms_consent_url` and
`sms_consent_text`.

### New tokens — documented in spec §13

`{{MARKET_STATE}}`, `{{LANDING_PAGE}}`, `{{MARKET_PAGE}}`,
`{{CAMPAIGN_THEME}}`, `{{CRM_TAG}}`, `{{PAGEVIEW_EVENT}}`. The last five are
**not optional** — see above. `data-form-type` is a constant
(`scenario_review`) and `data-program-interest` reuses `{{LOAN_TYPE}}`, so
neither needs a token.

Note `{{TOKEN}}` at line 3 is prose in the instruction comment, not a real
token — it will show up in any token scan.

---

## 5. Do not undo these

1. **`areaServed` stays out** of the template until compliance approves (§4b).
2. **No dollar amounts in calculator analytics** (§1).
3. **The metro appears once in prose**, outside H1 and breadcrumb (§4b). Spec
   §13 is explicit that body copy is approved content — transcribe, do not
   rewrite. A blind token replace will re-break §12.
4. **`FAQPage` schema must stay byte-identical to the visible accordion**
   (spec §11.5). The template has 8 pairs, the calculator 6. Editing a FAQ
   answer means editing both copies identically.
5. **`chrome.css` fit rules** (§2) — removing them re-breaks the nav at
   1024–1199 px, including for pages without the Calculator link.

---

## 6. Open items, in the order I would take them

1. **The live/dry-run mismatch.** All three `/texas/…` pages have
   `data-form-mode="live"` in markup while `landing-manifest.json` records them
   as `dry-run`. Staging fills are creating **real CRM records and real Meta
   `Lead` events**. Either the manifest is stale or the pages should not be
   live. Resolve before anything else — every test submission pollutes
   production data.
2. **Create the 13 GHL fields**, then flip the calculator to `live` and run one
   end-to-end submission (§1).
3. **New landing pages.** *This is what the user originally asked for and it is
   not started.* Blocked on a decision they have not yet given: **which
   market(s)** (Austin / Houston / San Antonio / a Florida metro) and **which
   page types** (bank-statement only, which is the template's native copy, or
   all three). Ask before building — a page is ~50–60 KB of spec-locked copy
   and the template only carries bank-statement wording. Do not invent
   marketing prose: spec §11.9 forbids introducing rate, APR, credit-score,
   LTV, loan-amount or close-time claims.
4. **Get the React source.** It unblocks deleting the stopgap (§3), and the
   SPA nav still differs from the static nav at 1024–1279 px.
5. **Per-market values the tokens do not cover.** `<option>Another Texas
   market</option>` in the template's step 7 is hardcoded and wrong for a
   Florida market — and the lead cohort is literally named
   `texas_florida_landing_program`. That is approved copy, so it needs a
   decision.
6. **`/_template/` is publicly servable** — a real directory with an
   `index.html`, so `.htaccess` passes it straight through. It carries the
   `noindex` tags, so this is exposure rather than an SEO problem, but a
   template page full of `{{TOKENS}}` is reachable. Same for `.claude/` —
   **do not upload it to production.**
7. **Visible breadcrumbs are missing from the three `/texas/…` pages and the
   template.** All four declare `BreadcrumbList` schema; none renders a visible
   breadcrumb, and `.breadcrumb` CSS sits unused in `landing.css`. The
   calculator now has both. Google expects the schema to reflect on-page
   navigation, so the other four are inconsistent.

---

## 7. Files changed this session

```
index.html                                  + stopgap <script> tag
landing-assets/spa-calculator-link.js       NEW — SPA link injector
landing-assets/calculator.js                analytics, a11y status, header comment
landing-assets/chrome.css                   + nav-fit rules (appended)
mortgage-payment-amortization-calculator/index.html
                                            nav/footer links, breadcrumb + schema,
                                            scoped live region, version 1.0.0
texas/dallas-fort-worth/1099-mortgages/index.html            nav + footer links
texas/dallas-fort-worth/bank-statement-mortgages/index.html  nav + footer links
texas/dallas-fort-worth/self-employed-mortgages/index.html   nav + footer links
_template/index.html                        marquee repair, §12 pass, stepper port,
                                            body attributes, nav + footer links
landing-manifest.json                       calculator route, 13 calc_* fields
                                            (36→49), 6 events, field note
sitemap.xml                                 + calculator route
LANDING-PAGE-SPEC.md                        6 new tokens documented, layout note
.claude/launch.json                         rewritten — relative paths
.claude/static-server.js                    NEW — moved in from a temp dir
HANDOFF.md                                  this file
```

Untouched: the compiled bundle, `landing.css`, `scenario-stepper.js`,
`analytics.js`, `chrome.js`, `reveal.js`, `accordion.js`, `robots.txt`, and
`texas/dallas-fort-worth/bank-statement-loans/` (superseded v0.3.0 preview,
form disabled, left alone deliberately).

**This is not a git repository, so there is no undo but the copies below.**

Pre-edit backups of every changed file live one level up, *outside* the site
root so they cannot be deployed:

```
../_backups-pre-2026-09-02/            originals, mirroring the site structure
../_backups-pre-2026-09-02/_scripts/   the patch scripts that made the edits
```

The `_scripts/` copies are worth reading if you need to know exactly what an
edit did — each one anchors on unique strings and reports per-replacement
success, so they double as a changelog. `_template/index.html` has three
staged backups (`-pre-marquee-fix`, `-pre-metro-fix`, `-pre-stepper`) matching
the three repairs in §4.

Strongly consider `git init` before further work.

---

## 8. Two corrections worth carrying forward

Both were my own measurement errors, not product defects — do not go hunting
for them:

- The calculator's `FAQPage` schema **does** match its accordion. An early
  check reported mismatches because the script swept the amortization table's
  `<summary>` in with the FAQ ones, shifting the index by one.
- `offsetParent` is always `null` inside a `position: fixed` element like
  `.ll-nav`, so it is useless for testing nav-link visibility. Use
  `getBoundingClientRect()` — and make sure the viewport is actually laid out
  first, or every geometry read comes back `0`.
