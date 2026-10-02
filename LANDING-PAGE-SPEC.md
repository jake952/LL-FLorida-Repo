# Leahy Lending — Landing Page Build Spec

**Answer to "is there a template in the codebase?" — there was not. This file and
`_template/index.html` are it.**

Every value here was extracted from the compiled production bundle, not invented:

| Source | What it gave us |
|---|---|
| `assets/index--e7Hi0yS.js` | component markup, inline styles, animation logic, nav data |
| `assets/index-CQLnJ61n.css` | compiled component classes, keyframes, color tokens |

**Do not "improve" these numbers.** They exist so landing routes are
indistinguishable from the React pages. If the live site changes, re-extract.

---

## 1. File layout

```
/landing-assets/
  landing.css          page-level layout (hero, sections, cards, FAQ, footer)
  chrome.css           SITE CHROME — marquee, fixed nav, sticky bar, tokens
  chrome.js            chrome behavior — nav scroll, dropdown, mobile, dismiss
  reveal.js            scroll reveal (IntersectionObserver)
  analytics.js         dataLayer events + UTM/referrer attribution capture
  scenario-stepper.js  the lead form (9-step flow, conditional logic, CRM submit)
  accordion.js         FAQ accordion
  img/                 hero + texture photography  ← YOU MUST SUPPLY THIS
/texas/{metro}/{topic}/index.html   e.g. .../bank-statement-mortgages/
/_template/index.html  copy this to start a new page  (carries the 9-step stepper form; see section 13)
/landing-manifest.json registry — one entry per route
```

Load order matters: `landing.css` then `chrome.css`. Chrome overrides page styles.

---

## 2. Required page skeleton

```html
<body class="ll-chrome" data-page-id="…" data-page-route="…"
      data-form-mode="dry-run" data-loan-type="…" data-market-state="TX">
  <div class="ll-marquee">…</div>     <!-- fixed, top:0,  35px -->
  <nav class="ll-nav">…</nav>         <!-- fixed, top:35 -> 0  -->
  <nav class="breadcrumb">…</nav>
  <main> …six content blocks… </main>
  <footer class="site-footer">…</footer>
  <div class="ll-sticky">…</div>      <!-- fixed, bottom:0 -->
  <script src="/landing-assets/analytics.js" defer></script>
  <script src="/landing-assets/chrome.js" defer></script>
  <script src="/landing-assets/reveal.js" defer></script>
  <script src="/landing-assets/accordion.js" defer></script>
  <script src="/landing-assets/scenario-stepper.js" defer></script>
</body>
```

`body.ll-chrome` supplies `padding-top: 99px` (`115px` ≥1024px) to clear the
fixed marquee + nav, and `padding-bottom: 60px` to clear the sticky bar.
`99 = 35 + 64`, `115 = 35 + 80` — matches `App.tsx` `pt-[99px] lg:pt-[115px]`.

---

## 3. Color tokens

| Token | Value | Source |
|---|---|---|
| navy | `#0A1628` | `bg-[#0A1628]` |
| navy ink (marquee text) | `#0D1B2A` | inline style |
| gold | `#d09945` | `.text-gold`, `.btn-gold` bg |
| gold hover | `#b9832c` | `.btn-gold:hover` |
| gold bar (marquee bg) | `#D4A843` | inline style |
| gold accent (inline JSX) | `oklch(0.72 0.12 75)` | hero `<em>`, sticky tick |
| card border | `oklch(88% .005 80)` | `.card-program` |
| btn-gold text | `#00070f` | `.btn-gold` |

---

## 4. Every animation

### 4.1 Top marquee — always running
```
@keyframes marquee-ref { 0% { translateX(100vw) } 100% { translateX(-100%) } }
animation: marquee-ref 30s linear infinite;
```
Bar: `#D4A843`, `height 35px`, `overflow hidden`, `z-index 45`.
Text: Outfit, `.75rem`, `600`, `letter-spacing .15em`, uppercase, `#0D1B2A`.

Copy (verbatim):
`WE SAY YES WHEN OTHERS SAY NO · LEAHY LENDING SAYS YES · SINCE 2002 · (512) 240-2897 · AUSTIN'S TRUSTED MORTGAGE SPECIALIST · OVER $1 BILLION IN LOANS FUNDED ·`

### 4.2 Nav slide
Trigger `window.scrollY > 60`. `top: 35px → 0`.
`transition: top .3s ease, background-color .3s ease`.
Background: transparent **only on `/`**; every other route is always
`bg-[#0A1628] shadow-lg`. Landing pages are therefore always solid.

### 4.3 Hero entrance — on load, not scroll
```
@keyframes fade-up { 0% { opacity:0; translateY(24px) } to { opacity:1; translateY(0) } }
.animate-fade-up { animation: .7s forwards fade-up; }
```

### 4.4 Scroll reveal — everything below the hero
Trigger: `IntersectionObserver`, `threshold: 0.15`, **one-shot** (`disconnect()`
after first intersection). Duration `700ms`, `ease-out`.

| Target | From | Stagger |
|---|---|---|
| `.section-header`, `.faq-intro`, `.program-info`, `.aeo-cta`, `.final-cta-copy` | `opacity 0, translateY(24px)` | — |
| `.program-grid > .program-card` | `opacity 0, translateY(32px)` | `index × 120ms` |
| `.marker-strip > .marker`, `.faq-list > details` | `opacity 0, translateY(32px)` | `index × 60ms` |
| `.intro-grid > .body-copy` | `opacity 0, translateX(-32px)` | — |
| `.intro-grid > .focus-panel` | `opacity 0, translateX(32px)` | `200ms` |

**Progressive enhancement is mandatory.** The hidden state lives behind
`html.js-reveal`, and both that class and the `data-reveal` attributes are added
at runtime. With JS off the page renders fully visible — required, because these
pages must serve complete content in raw HTML for answer engines. A 4s failsafe
reveals anything the observer missed. Raw HTML must contain zero occurrences of
`data-reveal`, `js-reveal`, or `opacity:0`.

`prefers-reduced-motion: reduce` disables the marquee, fade-up, and all reveals.

### 4.5 Micro-transitions
| Element | Transition |
|---|---|
| `.btn-gold` | `all .2s` |
| `.card-program` / `.program-card` | `all .2s`; hover `border-color rgba(208,153,69,.4)`, `box-shadow 0 4px 24px rgba(208,153,69,.08)` |
| nav links, dropdown items | `color .15s` (+ `background-color .15s` on dropdown) |
| dropdown caret | `transform .2s`, `rotate(180deg)` when open |

---

## 5. Opacity system by container type

This is the whole vocabulary the site uses. Reuse it; do not introduce new values.

### Overlays on imagery
| Use | Value |
|---|---|
| Hero gradient (left→right) | `#0A1628` at **.90 → .70 → .30** |
| Interior hero gradient | `#0A1628` at **.90 → .70** (→ `.90` when text is full-width) |
| Dark section texture | `opacity: .20`, `background-size: cover` |

### Surfaces
| Use | Value |
|---|---|
| Glass card fill | `rgba(255,255,255,.05)` (`bg-white/5`) |
| Raised glass fill | `rgba(255,255,255,.10)` (`bg-white/10`) |
| Hairline border | `rgba(255,255,255,.10)` (`border-white/10`) |
| Subtle border | `rgba(255,255,255,.05)` |
| Emphasis border | `rgba(255,255,255,.20)` |
| Frosted panel | `rgba(255,255,255,.80)` + `backdrop-blur-sm` |
| Scrim | `rgba(10,22,40,.80)` |

### Text on dark
| Role | Value | Frequency in bundle |
|---|---|---|
| Body copy | `rgba(255,255,255,.70)` | 9 |
| Primary muted | `rgba(255,255,255,.80)` | 5 |
| **Labels / eyebrows** | `rgba(255,255,255,.60)` | **51 — most common** |
| Secondary meta | `rgba(255,255,255,.50)` | 15 |
| Tertiary / icons | `rgba(255,255,255,.40)` | 38 |
| Dividers, faint meta | `rgba(255,255,255,.30)` | 15 |
| Near-invisible accents | `rgba(255,255,255,.20)` | 9 |

---

## 6. Breakpoints

| Width | Behavior |
|---|---|
| `< 640px` | sticky-bar phone hidden, sticky tick hidden |
| `< 768px` | sticky-bar secondary sentence hidden |
| `< 1024px` (`lg`) | **nav collapses to burger**; body padding-top 99px |
| `≥ 1024px` | desktop nav; nav row 80px; body padding-top 115px |
| `≤ 900px` | first-generation rule hides `.site-nav` — burger must cover this whole band |
| `≤ 1279px` | header phone hidden so the row fits |

**Fractional-DPR warning.** On a 1.5× display the CSS viewport can be
`1199.33px`, so a `max-width: 1199px` query never matches. Keep breakpoints
clear of exact content-fit boundaries — this cost real debugging time.

Nav geometry: container `max-width 1440px`, `padding 0 16px` (`24px` ≥640px).
Content containers: `max-width 1280px`. These differ — the nav is wider.

---

## 7. Sections must be full-bleed

`<main>` must **not** carry a width cap. Sections span the viewport; each one
wraps its content in `.section-inner` (`min(1280px, 100% - 48px)`). A cap on
`main` letterboxes every section background.

---

## 8. Imagery — ACTION REQUIRED

The bundle references five CloudFront assets. **All return HTTP 403
AccessDenied**, verified with and without a `leahylending.com` Referer:

```
hero-home_7cf38c58.jpg
hero-selfemployed_c62e741e.jpg
hero-investor_6680f24d.jpg
texture-dark_d313352e.jpg
about-team_d9c3fed2.jpg
```

They cannot be fetched from anywhere. Supply the real files, drop them in
`/landing-assets/img/`, and set two variables:

```css
:root {
  --ll-hero-image: url('/landing-assets/img/hero-home.jpg');
  --ll-texture:    url('/landing-assets/img/texture-dark.jpg');
}
```

Until then a documented gold-radial fallback renders so the hero reads as
designed rather than broken. **This is the one remaining reason a landing page
is still visually distinguishable from the live site.**

---

## 9. Nav data (verbatim from the bundle)

Top level: `Home` · `Self-Employed Loans ▾` · `Investor Loans` · `Home Loans` ·
`Construction Loans` · `About` · `Contact`

`Self-Employed Loans` dropdown (`w-56`):

| Label | Href |
|---|---|
| Bank Statement Loans | `/bank-statement-loans` |
| 1099 Mortgage Loans | `/1099-mortgage-loans` |
| DSCR Investor Loans | `/dscr-investor-loans` |
| Self-Employed Hub | `/self-employed-mortgage-loans` |
| How to Qualify | `/how-self-employed-borrowers-qualify-for-mortgage` |
| Bonus / RSU Income | `/bonus-commission-rsu-income-mortgage` |

Header actions: phone `tel:5122402897`, then `Start Application` (`.btn-gold`) →
`https://hypersmart.my1003app.com/209010/register` (new tab).

Live routes only — the SPA router defines exactly these:
`/` `/about` `/apply` `/contact` `/privacy` `/terms` `/home-loans`
`/construction-loans` `/bank-statement-loans` `/1099-mortgage-loans`
`/dscr-investor-loans` `/self-employed-mortgage-loans`
`/how-self-employed-borrowers-qualify-for-mortgage`
`/bonus-commission-rsu-income-mortgage`

`/texas/` does **not** exist. Do not link it until it does.

---

## 10. Sticky bar

`fixed bottom-0 z-40`, `bg #0A1628`, `border-top rgba(255,255,255,.1)`,
`shadow-2xl`. Inner `max-width 1280px`, `padding 12px 16px` (24px ≥640, 32px ≥1024).

Left: 4×32px gold tick (`oklch(0.72 0.12 75)`, hidden <640px) then
**"Questions about your mortgage options?"** (white, 500) +
" — Our advisors are ready to help." (`white/60`, hidden <768px).

Right: phone (hidden <640px), `Schedule Consultation` → `/contact`
(`.btn-gold` at `.75rem`, `8px 16px`), dismiss `×` (`white/40`).

Dismiss hides it and drops the body's bottom padding. Persisted in
`sessionStorage` under `ll-sticky-dismissed`.

---

## 11. New-page checklist

1. `cp -r _template texas/{metro-slug}/{topic-slug}` and rename to `index.html`.
2. Replace identity: `<title>`, meta description, canonical, 3 OG tags,
   `data-page-id`, `data-page-route`, `data-loan-type`.
3. Replace the six content blocks. Copy is spec-locked — transcribe, don't write.
4. Update breadcrumb + `BreadcrumbList`. Unlinked `<span>` for any segment
   whose route is not live.
5. `FAQPage` schema must be **byte-identical** to the visible accordion, or omit it.
6. Add the route to `landing-manifest.json` and `sitemap.xml`.
7. Confirm raw HTML contains no `data-reveal` / `js-reveal` / `opacity:0`.
8. Sweep widths 320→1920 for horizontal overflow and reachable nav.
9. Never introduce a rate, APR, credit score, LTV, loan amount, close-time, or
   statement-period claim.

---

## 12. Local-language rule (revision handoff, Aug 23 2026)

The metro name establishes identity. It must not appear in routine UI.

**Keep Dallas–Fort Worth in:** URL · title tag · meta description · H1 · **one**
natural hero-copy sentence · one approved service-area statement or optional FAQ ·
approved schema/service-area metadata. The breadcrumb also carries it, mirroring
the URL hierarchy.

**Remove it from:** CTA labels · form eyebrow and headline · submit button ·
conditional form messaging · card CTA labels · generic section headlines ·
generic process copy · repeated closing-CTA copy · form helper text.

**Canonical CTA label:** `START A SCENARIO REVIEW`. Never
`START A DFW SCENARIO REVIEW` or `START YOUR DALLAS–FORT WORTH … REVIEW`.
The location belongs in the page identity, not in every user action.

**Verify:** exactly one metro mention in prose once the H1 and breadcrumb are
excluded, and zero occurrences of the string `DFW` in visible copy.

### 12.1 Attribution rule — do not collapse these

The user-selected `discovery_source` must never be merged with machine
attribution. `utm_source/medium/campaign/content/term`, `referrer`,
`first_touch_source`, `last_touch_source` and click IDs are captured by
`analytics.js` and submitted as their own distinct CRM fields.

A lead can legitimately report `discovery_source = claude` while
`utm_source = perplexity`. Both values are kept — that contrast is the signal.

### 12.2 Analytics events

`view_bank_statement_page` · `hero_primary_cta_click` ·
`hero_secondary_cta_click` · `hero_form_start` ·
`hero_form_step_complete` · `scenario_form_submit` ·
`scenario_form_success` · `scenario_form_error` · `faq_expand` ·
`closing_cta_click` · `phone_click` · `self_employed_hub_click`

`application_start_click` — added because the four "Start Application" CTAs
on every page (desktop nav, mobile panel, footer link list, footer button, and
a fifth in the body of `_template`) carried no tracking at all. They leave for
the 1003 application, so they are the conversion endpoint; without this there
was no way to attribute an application to a page or a CTA position. It carries
`cta_location` only, and it is a Meta `trackCustom`, not a `Lead` — nothing has
been submitted at that point. `scenario_form_success` remains the only `Lead`.

The reconciled list of every event actually present in the markup lives in
`landing-manifest.json` under `analytics_events`; treat that as authoritative
when the two disagree.

Each is pushed to `window.dataLayer` **and** dispatched as a
`ll:analytics` CustomEvent, so a destination (GTM/GA4/Segment/Pixel) can be
attached later without touching markup. Mark new CTAs with
`data-track="event_name"` to enrol them.

### 12.3 Route change

`/texas/dallas-fort-worth/bank-statement-loans/` → **`…/bank-statement-mortgages/`**.
The old path was staging-only and `noindex`, so no redirect is required. If it
ever went live, add a one-hop 301 preserving path, UTMs and click IDs.
`landing-manifest.json` records the old path as `previous_route`.

## 13. Multi-market expansion

The template is market-parameterized. When opening a new area (Austin, Houston,
San Antonio), the only structural change is the market path — the chrome, form,
schema and footer wiring carry over unchanged.

### Tokens

| Token | Example | Notes |
| --- | --- | --- |
| `{{PAGE_TITLE}}` | Bank Statement Mortgage Options in Austin \| Leahy Lending | `<title>` and og:title |
| `{{PAGE_ROUTE}}` | `/texas/austin/bank-statement-mortgages/` | leading AND trailing slash |
| `{{PAGE_ID}}` | `austin_bank_statement_mortgages` | registry id, snake_case |
| `{{LOAN_TYPE}}` | `bank_statement` | bank_statement, self_employed or 1099 |
| `{{MARKET_PATH}}` | `texas/austin` | **no** surrounding slashes |
| `{{MARKET_NAME}}` | Austin | display name used in copy |
| `{{MARKET_STATE}}` | `TX` | was hardcoded to TX; a Florida market needs this |
| `{{LANDING_PAGE}}` | `austin_bank_statement_mortgages` | CRM `landing_page`; distinguishes markets in GHL |
| `{{MARKET_PAGE}}` | `austin` | CRM `market_page` |
| `{{CAMPAIGN_THEME}}` | `bank_statement_mortgage` | CRM `campaign_theme`; follows loan type, not market |
| `{{CRM_TAG}}` | `austin` | `data-crm-tags`, the market tag |
| `{{PAGEVIEW_EVENT}}` | `view_bank_statement_page` | analytics page-view event name |
| `{{MARKET_PHONE}}` | (214) 531-6416 | display form, formatted; appears 5x incl. the marquee |
| `{{MARKET_PHONE_DIGITS}}` | `2145316416` | digits only, for `tel:` hrefs |

The last five feed `scenario-stepper.js` and `analytics.js` through `<body>`
data attributes. They are NOT optional: with any of them absent the form still
submits, but `landing_page`, `market_page`, `campaign_theme` and
`program_interest` arrive blank in GHL and the lead cannot be routed or
attributed. `data-form-type` is a constant (`scenario_review`) and
`data-program-interest` reuses `{{LOAN_TYPE}}`, so neither needs a token.

### The phone number is per market

All four pages — the three Dallas-Fort Worth pages and the national calculator
— use (214) 531-6416, a Dallas number, rather than the Austin main line. The
number is still tokenized in the template rather than hardcoded, because
whether a future market shares this number or gets its own has not been
decided, and a hardcoded 214 would silently follow into Houston, San Antonio
and any Florida market. If every market is to share one number, replace
`{{MARKET_PHONE}}` with a constant at that point.

Two tokens, because `tel:` needs digits only and the visible form needs
punctuation. Both must be set — a market page with an unreplaced
`{{MARKET_PHONE_DIGITS}}` produces `tel:{{MARKET_PHONE_DIGITS}}`, which is a
dead link that looks fine until someone taps it.

The number also reaches `<body>` as `data-phone` and `data-phone-href`.
`scenario-stepper.js` reads those for the message shown when a submission
fails, rather than hardcoding a number — that module is shared by every page,
so it cannot hold one value once pages are allowed to differ. It falls back to
the Austin main line if a page declares neither, which is deliberate: a
fallback should be the number that certainly routes, not a market-tracked one
that could misattribute calls from a page it does not belong to. All four pages
declare both attributes, so the fallback does not fire today.

**Two consequences worth knowing.** The marquee is no longer byte-identical
across the whole site — section 4.1 pins it, and the number inside it now
differs from the main site. And the main site still shows the Austin number,
because it lives in the compiled bundle and cannot be changed without the React
source, so a visitor moving from a landing page to `/about` sees the number
change. Both are deliberate and the phone number sits on the approvals list;
neither is a defect to repair.

### Footer sibling links are market-relative

The footer links Bank Statement / 1099 / Self-Employed to
`/{{MARKET_PATH}}/<type>-mortgages/`, so a new market keeps visitors inside its
own funnel. Before this was tokenized the paths were hardcoded to
`texas/dallas-fort-worth`, which would have sent Austin traffic to Dallas pages.

**If a market does not have all three page types yet**, point the missing ones at
the main-site route rather than leaving a dead link:

| Missing type | Fall back to |
| --- | --- |
| Bank Statement | `/bank-statement-loans` |
| 1099 | `/1099-mortgage-loans` |
| Self-Employed | `/self-employed-mortgage-loans` |

A 404 in the footer is worse than an exit to the main site.

### Body copy still carries literal market names

The template was derived from the DFW pages, so roughly sixteen literal market
names remain in the body copy. These are deliberately NOT tokenized — that copy
is approved content, and section 12 governs exactly where a market name may
appear. Replace them by hand: keep the market name in the URL, title, meta
description, H1, one hero sentence and the breadcrumb schema, and keep it out of
CTAs, form labels and helper text.

### Also per-market

- `data-crm-tags` — the market tag (`dfw`) must change per market.
- `data-market-page` and `data-campaign-theme` — market and theme slugs.
- `sitemap.xml` — add each new route.
- GHL — no new custom fields needed. `landing_page` and `market_page` already
  distinguish markets, so existing workflows keep working. Add a workflow per
  market only if routing should differ by area.
