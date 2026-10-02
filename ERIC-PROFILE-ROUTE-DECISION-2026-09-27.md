# Route-Decision Package — Eric Bennett Canonical Profile

**Date:** 27 September 2026
**Scope:** Eric §4 — facts required for an explicit canonical-route decision
**Status:** AWAITING ERIC'S DECISION · no further profile-route changes will be made

All data below was read from production and from the current upload set. Nothing
was changed to produce it.

---

## 1. All current and retired profile URLs

| URL | Status | Redirects to | Hops |
|---|---|---|---|
| `/texas/dallas-fort-worth/loan-officers/eric-bennett/` | **200** | — | — |
| `/loan-officers/eric-bennett/` | 301 | `/texas/dallas-fort-worth/loan-officers/eric-bennett/` | 1 |
| `/leadership-team/eric-bennett/` | 301 | `/texas/dallas-fort-worth/loan-officers/eric-bennett/` | 1 |
| `/loan-officers/` | 301 | `/about` → `/about/` | **2** |
| `/leadership-team/` | 301 | `/about` → `/about/` | **2** |
| `/texas/dallas-fort-worth/loan-officers/` | **403** | — | — |

Both retired *profile* URLs reach the live page in a single hop. The two 2-hop
redirects are on the section roots, and are the backlog item in Eric's §6.

**The 403 is new information.** An intermediate segment of the canonical URL
returns "forbidden" where a genuinely absent path on the same host returns 404.
It is a directory with no `index.html`. A crawler walking up the canonical path
receives 403, which is a weaker signal than 404 and is not a deliberate choice —
it is the server's default for a directory it may not list.

Relevant `.htaccess` rules currently in force:

```apache
RewriteRule ^loan-officers/?$                        /about [R=301,L]
RewriteRule ^loan-officers/(barry-wheeler|ethan-cope|james-bonacci)/?$  /about [R=301,L]
RewriteRule ^loan-officers/eric-bennett/?$           /texas/dallas-fort-worth/loan-officers/eric-bennett/ [R=301,L]
RewriteRule ^leadership-team/?$                      /about [R=301,L]
RewriteRule ^leadership-team/eric-bennett/?$         /texas/dallas-fort-worth/loan-officers/eric-bennett/ [R=301,L]
RewriteRule ^leadership-team/ryan-leahy/?$           /about [R=301,L]
RewriteRule ^services/leadership/ryan-leahy/?$       /about [R=301,L]
```

Bare `/loan-officers/` going to `/about` is deliberate and matches Eric's earlier
specification that `/loan-officers/` is "a SECTION, not a one-off page".

---

## 2. Canonical tag

```html
<link rel="canonical" href="https://leahylending.com/texas/dallas-fort-worth/loan-officers/eric-bennett/">
```

Self-referential and consistent with the served URL.

**Robots:** `index, follow, max-snippet:-1, max-image-preview:large`

---

## 3. Person schema

```text
@type          Person
url            https://leahylending.com/texas/dallas-fort-worth/loan-officers/eric-bennett/
identifier     288376   (NMLS)
```

The schema `url` matches the canonical. If the canonical route changes, this
value changes with it — it is generated from the route, not maintained separately.

---

## 4. Internal links pointing at the profile

**13 links, all to the DFW path. Zero to any retired path.**

| Page | Links |
|---|---|
| `/` | 1 |
| `/bank-statement-loans/` | 1 |
| `/self-employed-mortgage-loans/` | 1 |
| `/texas/dallas-fort-worth/1099-mortgages/` | 1 |
| `/texas/dallas-fort-worth/asset-utilization-mortgages/` | 1 |
| `/texas/dallas-fort-worth/bank-statement-mortgages/` | 1 |
| `/texas/dallas-fort-worth/construction-loans/` | 1 |
| `/texas/dallas-fort-worth/dscr-investor-loans/` | 1 |
| `/texas/dallas-fort-worth/loan-officers/eric-bennett/` | 1 (self) |
| `/texas/dallas-fort-worth/no-ratio-mortgages/` | 1 |
| `/texas/dallas-fort-worth/rsu-bonus-commission-income/` | 1 |
| `/texas/dallas-fort-worth/self-employed-mortgages/` | 1 |
| `/texas/dallas-fort-worth/super-jumbo-mortgages/` | 1 |

Ten of the thirteen are DFW pages. Three are Austin-side: the homepage and the
two Austin self-employed program pages.

**Author/reviewer links:** none currently exist. No page carries a byline or
reviewer attribution linking to the profile. (The globally prohibited
"Written by Leahy Lending" attribution is absent site-wide, as required.)

---

## 5. Lead routing and CTA behavior on the profile

The page carries the **DFW scenario questionnaire** plus a link to `/contact/`.

Because it sits under `/texas/dallas-fort-worth/`, submissions from it tag `dfw`
and route to Eric — consistent with the market-routing rule that `/texas/dallas-fort-worth/*`
routes to Eric and `/*` routes to ClientCare.

**This is the substantive consequence of the route choice.** The profile's path
determines its lead routing. Moving it to `/loan-officers/eric-bennett/` would
place it outside the DFW prefix, and its submissions would route to ClientCare
unless an explicit exception were added.

---

## 6. Sitemap

**The profile is not in `sitemap.xml`.**

It is the only indexable page in that position:

```text
indexable pages ....... 23
listed in sitemap ..... 22
not listed ............ /texas/dallas-fort-worth/loan-officers/eric-bennett/
```

This is the same discrepancy Eric's §6 lists as "sitemap mismatch: 22 URLs versus
23 indexable pages". It is not a counting artifact — it is this page.

The sitemap builder's rule excludes the DFW block from automatic listing, derived
from an earlier always-noindex policy for that prefix. The profile inherits that
exclusion despite now being `index, follow` with a self-canonical.

**No change has been made**, because whether this page should be advertised to
Google depends on which route is canonical — Eric's §4 decision. Listing it under
a path that may change would be worse than not listing it.

---

## 7. Impact comparison

### Retaining `/texas/dallas-fort-worth/loan-officers/eric-bennett/`

| | |
|---|---|
| Lead routing | Correct by path. Tags `dfw`, routes to Eric, no exception needed. |
| Internal links | 13 already point here. No change. |
| Redirects | Both retired profile URLs already resolve here in one hop. |
| Canonical / schema | Already consistent. No change. |
| Market containment | A visitor stays inside the DFW market, which was the reason for the move. |
| Cost | Ties a **person** to a **market** in the URL. If Eric later serves other markets, the canonical profile sits under a geography that no longer describes him. |
| Cost | Author-entity signals are nested three levels deep rather than at a site-level path. |
| Open item | The 403 on the intermediate segment. |

### Restoring `/loan-officers/eric-bennett/`

| | |
|---|---|
| Entity clarity | A person at a site-level path, market-independent. Conventional for author/E-E-A-T. |
| Section coherence | Matches Eric's own earlier specification that `/loan-officers/` is a section. |
| Cost | **Lead routing breaks.** Outside the DFW prefix, submissions tag Austin and route to ClientCare unless an explicit per-page exception is added. |
| Cost | 13 internal links need repointing. |
| Cost | Redirect direction reverses; care needed to avoid a redirect loop with the existing rules. |
| Cost | The bare `/loan-officers/` → `/about` rule would need revisiting, since a child would then be live under a parent that redirects away. |
| Cost | Canonical and Person schema `url` both change; any accrued signal on the DFW URL would need to transfer. |

### A third option, for completeness

Keep the DFW path canonical and add a **site-level alias** at
`/loan-officers/eric-bennett/` that 301s to it — which is the current behavior.
This is what is live today. Under this arrangement the only outstanding questions
are whether to list the page in the sitemap and what to do about the 403.

---

## 8. What is needed from Eric

1. **Which route is canonical.** Retain the DFW path, restore the site-level
   path, or confirm the current alias arrangement as permanent.
2. **Whether the profile should be listed in `sitemap.xml`.** Recommended once
   the canonical is fixed, because the page is indexable and carries the NMLS
   identifier and Person schema the entity work depends on.
3. **How the intermediate 403 should be handled** — a 404, a 301 to the DFW
   market page, or a real section index.

No profile-route change will be made until Eric responds.

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
