# Remaining Issues

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 21 September 2026
**Re:** Your response of 21 September — everything applied, and what is left

Supersedes the previous two lists. Written to be answered cold; assumes you have
read nothing else today. Numbered so you can reply with a list.

**Status of the site, stated precisely:** the existing pages are live. The
corrected production deployment that removes the unintended DFW noindex
directives has not yet been uploaded.

---

## 1. Applied from your response — no action needed

```text
§1  Nine DFW pages set indexable. DFW contact moved to noindex, follow and
    out of the sitemap.
§2  258 reviews and the $1B volume claim removed. Tenure — see item 3.
§3  Austin calculator: superlative removed, all six phone references
    corrected, released for indexing, canonical URL in the sitemap.
§4  The same claim standard now applies to Austin. All nine static Austin
    pages swept by the same rule and the same code as the nine DFW pages.
§5  Phone correction confirmed and applied. The DFW calculator keeps the DFW
    number; its builder now swaps it explicitly rather than inheriting it.
§6  Team card waits for the profile build. No runtime patch.
§7  Personal credential and company tenure kept distinct.
§9  Analytics boundary moved from convention into code: the tracker filters
    to nine allow-listed non-sensitive dimensions, including the three you
    named for the new modules, and a build check fails if a barred field name
    appears anywhere in it. Nothing further needed from you.
```

Two things your list did not name in words, found by applying it:

- **The Austin marquee said `SINCE 2002`**, not the `Serving Clients Since 2002`
  wording you approved on 18 September. Removing a claim means removing the
  words the page actually uses, so both forms were handled. They now read the
  approved wording — see item 3.
- **One Austin page carried the same claims as a stats panel, not prose.**
  `/how-self-employed-borrowers-qualify-for-mortgage/` has a "Quick Stats" block
  with `Loans Funded — $1B+` and `Years Experience — 20+`. Both are on your list
  in substance and neither was on it in words; matching prose alone would have
  left the same two claims on an indexable page in a smaller font. Removed.

---

## 2. Still blocking the profile and module build

Unchanged from the last list. Your §15 puts this work after the indexation
release, so the order is right — but it cannot be finished without these.

```text
[ ] The live DFW scenario-review form or calendar URL
[ ] The direct professional contact URL
[ ] Your LinkedIn URL, or confirmation to omit sameAs permanently for now
[ ] Resource copy and real review dates, per resource
```

Both modules and the profile will be built in staging with your approved copy
and the CTA destinations left as blocked placeholders, as you directed. The
build already refuses to let a page carrying an unresolved placeholder become
indexable, so it cannot go live half-finished by accident.

---

## 3. One decision reversed, and you should know before the upload

**The company-tenure line is back on the indexable pages, in your approved
wording, on Jake Bennett's direction of 21 September.**

Your §2.4 and §4 withdrew it until an evidence record existed. It was removed on
that basis. Jake reinstated it, reasoning that the company was founded in 2002
and the site's own schema already publishes `foundingDate: 2002`, so the
statement follows from a fact the pages already carry.

What now ships on all 18 indexable pages, both markets:

```text
Footer:   Serving Clients Since 2002.
Marquee:  SERVING CLIENTS SINCE 2002
```

One wording everywhere — your 18 September phrasing. The older bare
`SINCE 2002` on the Austin pages is gone.

**The review count and the volume claim stay removed.** That direction covered
tenure only.

**This is an override, not a resolution.** Your condition was about having a
documented record, which is a different question from whether the statement is
true, and you have not rescinded it. It is recorded in the claims register and
the change log rather than applied quietly.

```text
[ ] Accept, or restate the condition and it comes back off.
```

---

## 4. Three things your instructions do not reach

Each is a consequence of applying your decisions, not a disagreement with them.

### 4.1 The compiled React bundle still carries all three claims

The Austin homepage and every route the application renders itself — `/about`,
`/contact`, `/apply`, `/privacy`, `/terms` — build their marquee and footer from
`assets/index--e7Hi0yS.9ef0ca27.js`. That file still contains:

```text
258
OVER $1 BILLION IN LOANS FUNDED
SINCE 2002
```

Those pages are indexed. Your rule — a claim not approved for indexable
production use should not remain on pages that are already indexable — reaches
them. They are not files anyone can edit.

**This is the same owner problem as the team card, and it should ride the same
React release.** Nothing in the static build can fix it.

```text
[ ] Confirm it goes with the team-card/profile React release, or say it needs
    handling sooner.
```

### 4.2 `AUSTIN'S TRUSTED MORTGAGE SPECIALIST` is now inconsistent

You directed its removal from the calculator. The other eight Austin pages still
carry it, so a market-standing superlative is gone from one indexable Austin page
and present on eight. That inconsistency was created by following your
calculator-specific instruction literally, which is the right way to follow it.

```text
[ ] Remove it from the other eight, or leave it and accept the difference?
```

It is also in the React bundle, so 4.1 applies to the SPA-rendered pages too.

### 4.3 A performance claim your list did not cover

The Quick Stats panel on `/how-self-employed-borrowers-qualify-for-mortgage/`
has a third row that was left alone:

```text
Day Close Target — 21
```

It is a performance claim with no evidence record on an indexable page — the
shape your rules catch. It is not on your list, and your response ends "no
additional public copy or claim changes are authorized beyond the specific items
above," so it was not touched.

```text
[ ] Remove, keep, or defer?
```

---

## 5. Sequence, with owners

```text
1.  Claims applied across both markets                    DONE
2.  Upload the corrected files incl. robots.txt, sitemap  Jake
3.  Purge all caches                                      Jake
4.  Re-fetch and confirm the production robots state      Jake
5.  Search Console Live Tests, nine DFW pages             Jake
6.  Request indexing after each test passes               Jake
7.  Submit/refresh the sitemap, Google and Bing           Jake
8.  Austin calculator indexable                           corrections DONE
9.  Build profile and modules in staging                  blocked on item 2
10. Resource template only, nothing published             ready when copy lands
11. Team card + React bundle claims                       see 4.1
```

Your §9 return package is mostly post-upload evidence. Items 1 and 2 of it — the
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
