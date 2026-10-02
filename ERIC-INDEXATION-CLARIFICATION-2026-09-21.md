# Indexation State — Clarification, and What Is Still Needed

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 21 September 2026

Supersedes the earlier lists. Written to be answered cold.

---

## 1. Clarifying the noindex, because your last note and ours were both right

You wrote that the pages are still noindexed. That is correct. We wrote that the
noindex was removed. That is also correct. The two statements are about
different copies of the site, and the ambiguity is ours to fix.

There are three copies, and they are meant to differ:

| | DFW program pages | Austin pages |
| --- | --- | --- |
| **Repository source** | `noindex, nofollow, noarchive, nosnippet` | `index, follow, …` |
| **Upload set** (ready, not sent) | `index, follow, …` | `index, follow, …` |
| **Live site, right now** | `noindex, nofollow, noarchive, nosnippet` | `index, follow, …` |

So, precisely:

```text
The existing pages are live and publicly reachable.
The DFW program pages are still noindex in production.
The corrected deployment that removes those directives is built, verified,
  and has not yet been uploaded.
```

Nothing has gone backwards, and nothing needs re-deciding. One upload changes
the bottom row to match the middle one.

### Why the source file itself says noindex

It is deliberate. The staging value is written into every DFW page by its
builder, and it is removed at **deploy** time by a switch that edits the copy
about to be uploaded — never the repository.

The reason is that it makes the unsafe state impossible to reach by accident. A
build cannot produce indexable pages; an in-progress upload cannot leak one; a
page added tomorrow inherits the safe value without anyone remembering to set
it. Indexing becomes a deliberate act performed once, on a known set of files,
immediately before they go up.

### The one failure mode, which is what happened to you

A deliberate act performed separately is an act that can be skipped. It was,
before the previous upload. Every DFW page went to production carrying the
staging value, Search Console reported the Self-Employed page excluded by a
noindex tag, and it took your handoff and a full audit to establish that nothing
was broken — a step had simply not been run.

Nothing warned. The build reported "fileset verified" and stopped, which was
true and was the wrong last word.

That is now closed. The build's final line states which mode the upload set is
in, read from the files rather than assumed:

```text
!! UPLOAD SET IS IN STAGING MODE — 15 DFW page(s) still say
   "noindex, nofollow, noarchive, nosnippet", and robots.txt is: NOT PRESENT
   Uploading now republishes the noindex that Search Console flagged.
   Run this first:   cd go-live && node set-indexing.js production
```

or, when it is ready to go:

```text
[x] upload set is in PRODUCTION mode
    robots.txt: User-agent: * | Allow: / | Sitemap: https://leahylending.com/sitemap.xml
```

It reads the second one today.

---

## 2. What the upload will change

```text
18 pages   index, follow, max-snippet:-1, max-image-preview:large
            — your nine DFW program pages, plus the nine Austin pages

 7 pages   noindex, follow
            — DFW market home, about, privacy, terms, contact,
              DFW calculator, DFW home-loans

robots.txt  Allow: / plus the Sitemap: directive — never uploaded before,
            which is why the live one is the host default with no sitemap line

sitemap.xml every URL verified to return 200 with no redirect
```

---

## 3. Applied from your response — no action needed

```text
§1  Nine DFW pages indexable. DFW contact held back and out of the sitemap.
§2  258 reviews and the $1B volume claim removed. Tenure — see item 4.
§3  Austin calculator: superlative removed, all six phone references
    corrected to (512) 240-2897, released for indexing, canonical URL added
    to the sitemap.
§4  One claim standard across both markets. All nine Austin pages swept by
    the same rule and the same code as the nine DFW pages.
§5  Phone correction confirmed. The DFW calculator keeps the DFW number.
§6  Team card waits for the profile build. No runtime patch.
§7  Personal credential and company tenure kept distinct.
§9  Analytics boundary moved from convention into code: nine allow-listed
    non-sensitive dimensions, including the three you named, and a build
    check that fails if a barred field name appears anywhere in the tracker.
```

Two things your list reached in substance but not in words, and both were
handled: the Austin marquee used the older bare `SINCE 2002` rather than your
approved wording, and one Austin page carried the same claims as a stats panel
(`Loans Funded — $1B+`, `Years Experience — 20+`) rather than as sentences.

---

## 4. One decision reversed — needs your response

**The company-tenure line is back on the indexable pages, in your approved
wording, on Jake Bennett's direction.**

Your §2.4 and §4 withdrew it until an evidence record existed, and it was
removed on that basis. Jake reinstated it, reasoning that the company was
founded in 2002 and the site's own schema already publishes
`foundingDate: 2002`, so the statement follows from a fact the pages already
carry.

What ships on all 18 indexable pages:

```text
Footer:   Serving Clients Since 2002.
Marquee:  SERVING CLIENTS SINCE 2002
```

One wording everywhere — yours, from 18 September. The review count and the
volume claim stay removed; this direction covered tenure only.

**This is an override, not a resolution.** Your condition was about having a
documented record, which is a separate question from whether the statement is
true, and you have not rescinded it. It is recorded in the claims register and
the change log rather than applied quietly.

```text
[ ] Accept, or restate the condition and it comes back off before the upload.
```

---

## 5. Still blocking the profile and module build

```text
[ ] The live DFW scenario-review form or calendar URL
[ ] The direct professional contact URL
[ ] Your LinkedIn URL, or confirmation to omit sameAs for now
[ ] Resource copy and a real review date, per resource
```

Both modules and the profile will be built in staging from your approved copy
with the CTA destinations left as blocked placeholders, as you directed. The
build refuses to let a page carrying an unresolved placeholder become indexable,
so it cannot go live half-finished by accident.

---

## 6. Three things your instructions cannot reach

### 6.1 The compiled application still carries all three claims

The Austin homepage and every route the application renders itself — `/about`,
`/contact`, `/apply`, `/privacy`, `/terms` — build their marquee and footer from
a compiled JavaScript bundle. It still contains `258`,
`OVER $1 BILLION IN LOANS FUNDED` and `SINCE 2002`.

Those pages are indexed. Your rule reaches them. They are not files anyone can
edit, so nothing in the static build can fix it — it needs a change to the
application source and a rebuild.

```text
[ ] Confirm this rides the same release as the team card, or say it needs
    handling sooner.
```

### 6.2 `AUSTIN'S TRUSTED MORTGAGE SPECIALIST` is now inconsistent

You directed its removal from the calculator. The other eight Austin pages still
carry it, so the claim is gone from one indexable Austin page and present on
eight. That came from following your calculator-specific instruction literally.

```text
[ ] Remove it from the other eight, or leave it and accept the difference?
```

### 6.3 A performance claim your list did not cover

The same Austin stats panel has a third row, left alone:

```text
Day Close Target — 21
```

A performance claim with no evidence record, on an indexable page. Not on your
list, and your response ends "no additional public copy or claim changes are
authorized beyond the specific items above," so it was not touched.

```text
[ ] Remove, keep, or defer?
```

---

## 7. Sequence, with owners

```text
1.  Claims applied across both markets                    DONE
2.  Upload the corrected files incl. robots.txt, sitemap  Jake
3.  Purge all caches                                      Jake
4.  Re-fetch and confirm the production robots state      Jake
5.  Search Console Live Tests, nine DFW pages             Jake
6.  Request indexing after each test passes               Jake
7.  Submit/refresh the sitemap, Google and Bing           Jake
8.  Austin calculator indexable                           corrections DONE
9.  Build profile and modules in staging                  blocked on item 5
10. Resource template only, nothing published             ready when copy lands
11. Team card + compiled-bundle claims                    see 6.1
```

Your §9 return package is mostly post-upload evidence. Its first two items — the
before/after claim removals and the Austin calculator phone confirmation — are
producible now and will come with the staging package.

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

Nothing here is approval to publish. No claim is made about whether Google or
Bing will index these pages, whether they will rank, or whether answer engines
will cite them or associate them with you.
