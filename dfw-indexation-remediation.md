# DFW Indexation Remediation

What was changed, what was not, and what can only be finished by a person with Search Console access. Regenerated on every build — do not hand-edit.

## What created the block

Not a bug, and not a CMS or CDN setting. `noindex, nofollow, noarchive, nosnippet` is the staging value this project applies to every DFW page by design, written into each page by its builder and asserted by `_build/check-placeholder-promotion.js`. It is removed at deploy time, not at build time, by a switch that operates on the files about to be uploaded:

```
cd go-live
node set-indexing.js production
```

That step was not run before the upload. The upload set was still in staging mode, so every DFW page went to production carrying the staging meta, and `robots.txt` was never copied in at all — which is why the live one is the host default.

## Files that control indexing, and what each one does

| File | Role |
| --- | --- |
| `_build/set-indexing.js` | the switch. Rewrites the robots meta on all 24 pages and installs the matching `robots.txt`. Copied into the package as `go-live/set-indexing.js` |
| `go-live/robots.PRODUCTION.txt` | `Allow: /` plus the `Sitemap:` line |
| `go-live/robots.STAGING.txt` | `Disallow: /` |
| `_build/build-sitemap.js` | reads `ALWAYS_NOINDEX` out of the switch so the sitemap and the meta cannot disagree |
| repo `robots.txt` | `Disallow: /`, deliberately **never** uploaded |

No `X-Robots-Tag` is set anywhere — not in `.htaccess`, not by the host. Confirmed against the live responses on 21 September 2026, 15:07 UTC.

## What was changed

**1. The upload set was flipped to production.** 18 pages now declare `index, follow, max-snippet:-1, max-image-preview:large`; `upload/robots.txt` is the production file, with the `Sitemap:` directive the live one lacks.

**2. The six held-back pages now say `noindex, follow` in production instead of `noindex, nofollow, noarchive, nosnippet`.** This is the substantive change and it was not in the handoff. The market home is the only static route into the DFW cluster from the indexed Austin site; under the old value the flip would have opened the ten pages while closing the one door to them. `noindex, follow` keeps those six out of the index — the duplicate-content reason they were held back is unchanged — while letting a crawler walk through. `noarchive` and `nosnippet` were dropped with it because they govern how a page is displayed in results and a noindex page is not displayed.

**3. Apply and verify now share one function.** The switch computed the expected value twice, in two places, from the same constants. That is how a rule gets applied and then confirmed against a different rule, so `heldBackValue()` is now the only thing that decides, and the post-write verification calls it.

Staging mode is untouched: it still applies the full `noindex, nofollow, noarchive, nosnippet` and still refuses to leave any page indexable.

## What was deliberately not changed

Per the handoff: no URL, slug, redirect, canonical, title, page name, taxonomy, visual hierarchy or public copy. No schema was added. No claim was added or strengthened.

## `home-loans`: decided, with one thing left to watch

The URL was held back from the index between 9 and 21 September 2026 and is now indexable, both on instruction:

- **9 September 2026** — added to `ALWAYS_NOINDEX` because it measured 84% identical to the Austin `/home-loans/` page by 5-gram overlap, with both pages self-canonical. The other seven cross-market pairs sit at 30–39%; this one is the Austin page with its links repointed rather than a page written from the DFW template.
- **21 September 2026** — listed among the ten intended to rank in the handoff, and Jake Bennett confirmed removal from the list the same day. It is now `index, follow` and it has entered the sitemap.

**That settles the instruction, not the duplication.** Two self-canonical pages at 84% overlap are now both declaring themselves indexable, and Google picks one canonical for a near-duplicate pair regardless of what each page asks for. If it picks the Austin URL, the DFW page is crawled, folded into the Austin one, and reports in Search Console as a duplicate rather than ranking. No robots meta prevents that and no build step can.

So the specific thing to check for this URL after submission is **Google-selected canonical**, not just indexed status. If Google selects the Austin page, the remedy is to make the DFW page genuinely different — its own copy, its own examples, DFW-specific substance — which is a content decision rather than a technical one.

## Deployment actions — outside the repository

1. Upload `upload/` in full, **including `robots.txt`**, which has never been uploaded.
2. Purge every cache layer: host, any CDN, any page cache. Google can otherwise be served HTML that still carries the old meta.
3. Re-fetch each URL and confirm the robots meta changed before touching Search Console.
4. Submit `https://leahylending.com/sitemap.xml` in Google Search Console and Bing Webmaster Tools. The live `robots.txt` has advertised no sitemap until now.
5. Run the Search Console **Live Test** per URL. Only after it reports indexing allowed, use Request Indexing.
6. Run the Bing URL inspection per URL.

## Cannot be verified from here

- Whether Google and Bing actually index the pages, and which canonical Google selects.
- Whether a CDN or WAF sits in front of the origin. None was visible in the response headers on 21 September 2026, 15:07 UTC — `nginx`, no Cloudflare headers — but only the hosting account can confirm what is configured.
- Search Console and Bing Webmaster evidence, screenshots and dates. Those belong in the spreadsheet the handoff asks Jake to build; this build cannot reach either tool.

## Before publishing, one thing worth a conscious decision

Making these pages indexable is the event that several `LAUNCH-BLOCKERS.md` entries were written to gate. The review count, the funded-volume figure and the tenure statement are owner-approved for a noindex staging build and still carry **Pending evidence record** against an indexable production release. Publishing the flip does not resolve them, and this file is not approval to publish.
