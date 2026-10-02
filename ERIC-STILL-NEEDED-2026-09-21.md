# Still Needed From Eric

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 21 September 2026
**Re:** Your response of 21 September — what is applied, what is blocked, what you have to answer

Written to be answered cold. Supersedes the open-items list; everything that
list asked has been answered except where noted below.

---

## 1. Applied from your response

No action needed on these. Listed so you can see the instruction landed.

```text
§1   Nine DFW pages indexable. DFW contact moved to noindex, follow and out
     of the sitemap.
§2.1 "258 Five-Star Reviews" removed from all nine. The whole footer review
     block went with it — see 3.1.
§2.2 "Over $1 Billion in Loans Funded" removed from all nine.
§2.4 The company-tenure line removed from all nine, including "Serving
     Clients Since 2002", since its evidence record does not exist.
§3   Austin calculator: superlative removed, phone corrected, released for
     indexing, canonical trailing-slash URL added to the sitemap. See 3.2 —
     it was six phone references, not one.
§4   DFW About stays noindex, follow. H1 untouched, flagged for the separate
     content handoff.
§5   DFW Home Loans stays noindex, follow and out of the sitemap.
```

Three build checks had been set to REQUIRE the tenure line and failed the
moment it came off. They now require its absence on the indexable pages. That is
the system working: a copy decision could not be reversed without something
objecting.

**Nothing is published yet.** Upload is the next step and it is on our side.

---

## 2. Blocking — the build stops here without these

The profile page, the Work With Eric module and the root-site routing module all
converge on destinations you have not supplied. Your §15 puts them at step 12,
after the indexation release, so the order is not wrong — but nothing can be
finished without these four.

```text
[ ] The DFW scenario-review form or calendar URL
        Your §6 primary CTA, §11 module primary CTA, and the conversion end
        of every path in your §8 link map. You wrote
        [INSERT APPROVED DFW SCENARIO-REVIEW FORM OR CALENDAR URL].

[ ] The direct professional contact URL
        Your §6 secondary CTA, "CONTACT ERIC →". You wrote
        [INSERT APPROVED DIRECT CONTACT URL OR CONTACT FORM URL].

[ ] Your LinkedIn URL, and any other professional profile URL
        For sameAs. Per your own instruction, sameAs will be OMITTED rather
        than guessed if these do not arrive — so this is a decision, not a
        blocker. Say "omit" if that is the answer.

[ ] Resource copy and real review dates
        Your §13 names five resources and says the first package is new
        content, not retroactive attribution. The template can be built with
        nothing in it; no attributed resource publishes without the copy and
        a real review date.
```

**What we will do meanwhile:** build the profile page and both modules in
staging with everything you have supplied — H1, credential line, full bio,
service-market statement, NMLS placement, headshot, support text, CTA labels —
and leave the two destinations as marked placeholders. The build already refuses
to let a page carrying an unresolved placeholder become indexable, so the page
cannot go live half-finished by accident. Send the two URLs and it is a one-line
change, not a rebuild.

---

## 3. New questions your response raises

These did not exist before your instructions; each is a consequence of them.

### 3.1 Your claim removals were DFW-scoped, and the Austin pages carry the same claims

Your §2.1 and §2.2 say remove from "every intended-indexable DFW page", and they
also record the register status as **"Not approved for indexable production
use"** — which is not a DFW-only statement.

Two consequences you should decide on deliberately:

**The Austin calculator.** You released it for indexing in the same response.
Its marquee still reads `OVER $1 BILLION IN LOANS FUNDED` and `SINCE 2002`. We
did not touch them, because your removal named DFW pages and extending a copy
change to Austin on our own reading is not our call. So a page is about to
become indexable carrying a claim you just marked not approved for indexable
use.

**The other eight Austin pages.** They are already indexed and already carry the
review count, the volume claim and the tenure line in their footers.

```text
[ ] Remove the claims from the Austin calculator before it is indexed — yes or no?
[ ] Do the same on the eight already-indexed Austin pages — yes, no, or later?
```

Answering "DFW only, leave Austin alone" is a perfectly coherent answer. It just
needs to be the answer rather than an accident of scope.

### 3.2 The Austin calculator had six DFW phone references, not one

You named the marquee. The page carried `(214) 531-6416` in **six** places, five
of them click-to-call: the marquee, the desktop nav, the mobile nav, a closing
CTA button, the footer, and a `data-phone` attribute feeding the form.

Your instruction "Do not use the DFW phone number on the Austin calculator"
covers the page, so all six now read `(512) 240-2897` and all five `tel:` links
point there. Every other Austin page already used that number.

```text
[ ] Confirm. This changes where calls from that page land.
```

The DFW clone of the calculator still shows the DFW number; its builder now
swaps it explicitly rather than inheriting it.

### 3.3 The footer statement on the nine now ends without a tenure line

Removing the sentence leaves the paragraph ending:

```text
...alternative-documentation, non-QM, high-balance, and investor mortgage
options for self-employed borrowers, business owners, independent
professionals, and real estate investors.
```

It reads cleanly and nothing is orphaned. But the footer on those nine pages now
says nothing about the firm's history, where every other page still does.

```text
[ ] Leave it as is, or supply a replacement line that needs no evidence record?
```

### 3.4 The team card lives in compiled code, not in a page

Your §10 supplies replacement team-card copy and §2.3 supplies the personal
credential `25+ Years of Mortgage Experience`, both "once the profile refresh is
implemented."

The team card is not a file anyone can edit — it is compiled into the Austin
React bundle. Changing it means either a developer change in the React source
and a rebuild, or a runtime patch of the kind already used for two footer links,
which is fragile and would be a third one.

```text
[ ] Confirm the team card waits for the profile build rather than being
    patched now.
[ ] Confirm someone owns the React source change, or that a patch is acceptable.
```

Until then the card still shows `20+ Years Experience` and the old phrases your
§10 lists for removal.

### 3.5 Your §2.3 credential and the site's company tenure now differ deliberately

`25+ Years of Mortgage Experience` is yours, personal, dated from December 2000.
`25+ Years of Experience` is the company line Jake directed site-wide on
18 September, which your §2.4 has now removed from the nine indexable DFW pages
but which remains on the Austin pages and the held-back DFW pages.

Both are live at once, in different places, meaning different things, differing
by two words.

```text
[ ] Confirm that is intended, or say which of the two should give way where
    they appear on the same page.
```

---

## 4. Answered, for the record

You asked nothing further on these; noting them so they do not resurface.

- **DFW market home** stays `noindex, follow`, links crawlable, not in the
  sitemap. Already in that state before your response.
- **DSCR and Construction** — your §11 approves the module on both. Recorded.
- **Generic Super Jumbo page** — there is none on the Austin site. Your §12
  already says not to wait for it.
- **Person schema** — will carry only the visible facts from your §14, and no
  address, rating, volume, tenure, award or unsupported credential.
- **Analytics** — your §9 boundary is now enforced in code rather than by
  convention. The tracker filters to an explicit list of nine non-sensitive
  dimensions, including the three you named for the new modules, and a build
  check fails if a barred field name appears anywhere in it. Nothing further
  needed from you.

---

## 5. Sequence, with owners

```text
1.  Claims removed from the nine                     DONE
2.  Personal credential applied to profile/card      blocked on 3.4
3.  Upload the corrected files incl. robots.txt      Jake
4.  Nine DFW pages indexable                         follows the upload
5.  Held-back pages stay noindex, follow             DONE
6.  Purge all caches                                 Jake
7.  Re-fetch and confirm the production robots state Jake
8.  Search Console Live Tests, nine pages            Jake
9.  Request indexing after each test passes          Jake
10. Submit/refresh the sitemap, Google and Bing      Jake
11. Austin calculator indexable                      corrections DONE, see 3.1
12. Build profile and modules in staging             blocked on section 2
```

Your §16 return package is mostly post-upload evidence. Everything in it that
can be produced before the upload is either done or in the four audit documents
already delivered.

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
