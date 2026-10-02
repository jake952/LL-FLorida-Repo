# Your Profile Page Is Built — and One Question It Raises

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 21 September 2026
**Re:** Handoff B, Build tasks 1, 2 and 3

Written to be answered cold. One question at the end, and it is the reason for
this document.

---

## The question first

**Nothing on the site navigates to your profile page.** It is built, indexable
and linked from eleven pages, but every one of those links sits at the bottom of
its page, and no menu anywhere points at it. A visitor who arrives at the
homepage and browses will not find it.

The obvious route — About page, your team card, click your name — does not work,
because the team card links to nothing. That is your section 10 refresh, and it
needs an application-source change, which is the same release that blocks two
other items.

So the page currently works for:

```text
Search          once Google indexes it, someone searching your name finds it
Deep pages      someone already reading a DFW program page scrolls to the module
```

and does not work for anyone browsing the site.

**How do you want it reached?** Four options, and they are not exclusive:

```text
A. A navigation entry
   Direct and permanent. It implies a "Loan Officers" section, and there is one
   profile in it today. That may be fine if others are coming, odd if not.

B. The team card links to it
   The natural path people actually take when looking someone up. Needs the
   application-source change that your section 10 team-card refresh needs
   anyway, so it costs nothing extra once that release happens.

C. Move the modules higher on the page
   The Work With Eric module sits above the footer on all nine DFW pages. It
   could sit further up. This changes the reading order of live pages, so it is
   your call rather than ours.

D. Leave it as it is
   Defensible if the page's job is entity association for search and AI rather
   than site navigation, which is what Handoff B is mostly about. Worth choosing
   deliberately rather than by default.
```

Our reading: **B is the real answer** and A is worth deciding separately. B
requires no new copy from you and rides a release that has to happen anyway.

---

## What is built

### The canonical profile page

```text
URL         https://leahylending.com/loan-officers/eric-bennett/
Indexing    index, follow, max-snippet:-1, max-image-preview:large
Canonical   self-referencing
Sitemap     listed
Size        56 KB, one H1
```

Every word of visible copy is yours, verbatim, from sections 6 and 7. The
builder holds your approved strings as constants, derives the page from them,
then re-reads the written file and compares it back — so a typo introduced later
fails the build rather than becoming a claim about you.

On the page:

```text
H1                  Eric Bennett | Mortgage Guidance for Complex Income and
                    High-Balance Scenarios          title case, no all-caps CSS
Public title        Executive Vice President | Mortgage Loan Originator
NMLS #288376        directly beneath the title, as selectable text — not inside
                    a graphic, per your instruction
Credential          25+ Years of Mortgage Experience
Entity statement    verbatim
Service market      verbatim, with no DFW office or address implied anywhere
Full bio            all six paragraphs, in order
Areas of guidance   five, derived from your second bio paragraph rather than
                    written fresh, so the page cannot name a focus you did not
Headshot            the existing team-card image, with your approved alt text
Support text        verbatim, in the closing disclosure
```

The build refuses barred content in the page's own copy: `25+ Years of
Experience`, `25+ Years in Business`, `20+ Years Experience`, the six retired
team-card phrases, review counts, volume claims, and anything implying a
Dallas–Fort Worth office.

### The two CTAs

```text
START A DFW SCENARIO REVIEW →   the questionnaire on the same page
CONTACT ERIC →                  /texas/dallas-fort-worth/contact/
```

**Your scenario-review placeholder is resolved without an external URL.** Every
page on this site carries its own questionnaire that submits to the CRM from its
submit button, so the profile has one too and the CTA points at it. No route was
invented, which you barred.

The contact CTA goes to the DFW contact page on Jake's direction. That page is
`noindex, follow` — fine for a destination, since noindex governs whether a page
appears in results, not whether a visitor can reach it.

### Person schema

```text
name       Eric Bennett
url        https://leahylending.com/loan-officers/eric-bennett/
jobTitle   Executive Vice President | Mortgage Loan Originator
worksFor   Leahy Lending, legalName Kyber Mortgage Corporation dba Leahy Lending
```

**sameAs is omitted**, on your instruction not to guess. Nothing else is in
there: no address, rating, volume, tenure, award or unsupported credential.

### Work With Eric — section 11

Your approved copy, on all nine intended-indexable DFW pages. **Not on the DFW
home-loans page**, per your instruction, and the build fails if it ever appears
there.

### Root-site DFW routing — section 12

Your approved copy, on the generic Self-Employed and Bank Statement pages. The
links are ordinary HTML anchors in the served response, as you required.

**The main homepage is not done and cannot be from here.** Your section 12 lists
it first. It is the React shell — it renders 13 characters of HTML, the words
"Leahy Lending", and everything else is drawn by JavaScript. There is nothing to
insert an anchor into, and your own "ordinary server-rendered HTML anchors"
requirement cannot be met by anything this build writes.

### Eleven inbound links

```text
9  DFW program pages          Work With Eric module
2  generic Austin pages       root-site routing module
```

All ordinary HTML, no JavaScript. This is what stops the page being an orphan —
a sitemap entry is a request to crawl, an internal link is a reason to.

### DFW contact address

On Jake's direction: all 84 references across the 16 DFW pages now read
`Eric@LeahyLending.com`. The Austin pages keep the shared mailbox.

**Four of those 84 are not borrower contact**, and you should see them: the
privacy policy's rights-exercise contact, the SMS compliance line, the
privacy-policy enquiries contact, and the Organization email inside the JSON-LD
on the legal pages. A personal inbox now receives privacy-rights requests and
SMS compliance replies. Each is reversible on its own — say which, if any.

---

## Still outstanding from you

```text
[ ] How the profile should be organically reached — the question above
[ ] sameAs profile URLs, or confirmation to leave it omitted permanently
[ ] Resource copy and a real review date per resource, for your section 13
[ ] The four legal/compliance contact references above — keep or revert
```

## Waiting on one application-source release

Three items now need the same change to the React application. They should ship
together:

```text
1. The team-card refresh, your section 10 — and the link to your profile
2. The root-site routing module on the main homepage, your section 12
3. The 258 reviews, $1B funded and SINCE 2002 claims still inside the
   compiled bundle, which reach the homepage and every application-rendered
   route and are therefore still on indexed pages
```

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

Nothing here is approval to publish. No claim is made about whether Google or
Bing will index this page, whether it will rank, or whether answer engines will
cite it or associate it with you.
