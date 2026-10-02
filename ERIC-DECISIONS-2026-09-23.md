# Decisions Needed From Eric

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 23 September 2026

Supersedes the earlier lists. Written to be answered cold; assumes you have read
nothing else. Eight items, each answerable in a line.

Nothing here is blocked on us. Everything we could do without a decision from
you is done, and the current build passes 234 of 250 production route checks —
the other 16 are one fix already built and waiting on an upload.

---

## 1. How should your profile page be reached?

**This is the one that matters most, and it has been open since 21 September.**

The page is live-ready at `/loan-officers/eric-bennett/`, indexable, in the
sitemap, and linked from eleven pages. But **nothing navigates to it.** Every one
of those eleven links sits at the bottom of its page, and no menu anywhere points
at it. Someone who lands on the homepage and browses will never find it.

The route people actually take — About page, your team card, click your name —
does not work, because the team card links to nothing.

```text
A. A navigation entry
   Direct and permanent. Implies a "Loan Officers" section; there is one
   profile in it today.

B. The team card links to it                                    ← our reading
   The path people actually take. Needs no new copy from you, and rides the
   application release that your section 10 team-card refresh needs anyway.

C. Move the modules higher up their pages
   Changes the reading order of nine live pages, so your call.

D. Leave it
   Defensible if the page's job is entity association for search and AI rather
   than site navigation. Worth choosing rather than defaulting into.
```

---

## 2. sameAs — omit permanently, or supply URLs?

Currently omitted, on your instruction not to guess. The Person schema carries
name, url, jobTitle and worksFor only.

```text
[ ] Supply your LinkedIn and any other current professional profile URL, or
[ ] Confirm sameAs stays omitted until you say otherwise
```

---

## 3. Resource copy and review dates

The template is built. Nothing is published and nothing is attributed to you.
Your section 13 named five resources; none can go live without final copy and a
real review date for each.

---

## 4. Four legal contacts now route to your personal inbox

On Jake's direction all 84 references to `ClientCare@LeahyLending.com` on the DFW
pages became `Eric@LeahyLending.com`. Most are ordinary borrower contact. **Four
are not**, and you should decide on them specifically:

```text
privacy   the rights-exercise contact — where a consumer sends a data-access
          or deletion request
privacy   the SMS compliance line — "reply HELP or contact us at ..."
privacy   the privacy-policy enquiries contact
terms     the legal-notice address block, and the Organization email inside
          the page's structured data
```

That last one also states an individual's address as the **company's** email,
which is not factually right.

```text
[ ] Leave all four on your address, or
[ ] Name which should return to the shared mailbox
```

---

## 5. The Austin calculator still carries two withdrawn claims

Your sections 2.1 and 2.2 scoped the claim removal to DFW pages, and we applied
it there and then across all nine Austin pages when you confirmed "do not create
different claim rules for DFW versus Austin".

The Austin calculator's **marquee** still reads:

```text
OVER $1 BILLION IN LOANS FUNDED
SINCE 2002
```

You released that page for indexing in the same response, so a page you approved
for the index now carries a claim you marked "not approved for indexable
production use". We did not touch it because your removal named the claims in
prose and this is the marquee, and extending a copy change on our own reading is
not our call.

```text
[ ] Remove both, or confirm they stay
```

---

## 6. A superlative is now inconsistent across Austin

You directed `AUSTIN'S TRUSTED MORTGAGE SPECIALIST` removed from the calculator.
It is still on the other eight Austin pages, so the same market-standing claim is
gone from one indexable Austin page and present on eight. That inconsistency came
from following your calculator-specific instruction literally.

```text
[ ] Remove from the other eight, or accept the difference
```

---

## 7. An unevidenced performance claim

One Austin page, `/how-self-employed-borrowers-qualify-for-mortgage/`, carries a
stats panel. Two rows were removed as the claims you withdrew. The third was
left alone:

```text
Day Close Target — 21
```

A performance claim with no evidence record, on an indexable page — the shape
your own rules catch. It was not on your list, and your response closed with "no
additional public copy or claim changes are authorized beyond the specific items
above."

```text
[ ] Remove, keep, or defer
```

---

## 8. The DFW privacy page shows the Austin phone

It states `(214) 531-6416` in seven places and `(512) 240-2897` in three. The
three are in legal text: the privacy-policy contact line and the SMS compliance
line.

We did not change them. An SMS compliance number is very likely the number
registered with the carriers for that messaging programme, and changing it to
match the page's market could break a compliance obligation rather than a style
rule.

```text
[ ] Confirm the (512) number is correct in that legal text, or say which
    should change
```

---

## What is waiting on the application release

Three items need a change to the React application source. They are not blocked
on you except for prioritising them, and they should ship together.

**Why they cannot be done here.** The Austin homepage and every route the
application renders itself — `/about`, `/contact`, `/apply`, `/privacy`,
`/terms` — are drawn in the browser by a compiled JavaScript bundle. The served
HTML for those URLs is 13 characters of text and an empty container; everything
a visitor sees is built after the page loads. The bundle ships with no source
and no sourcemap in this fileset, so its contents cannot be edited — only
regenerated from the application project.

```text
1. Your team card
   Section 10's replacement copy, the 25+ Years of Mortgage Experience
   credential, and the link to your profile — which is also option B in item 1.

2. The root-site routing module on the main homepage
   Your section 12 lists it first. It is deployed on the two generic Austin
   pages. The homepage has no served HTML to place an anchor in, and your own
   requirement is "ordinary server-rendered HTML anchors in the raw page
   response" — which cannot be met from outside the application.

3. The withdrawn claims still inside the bundle
   258 reviews, OVER $1 BILLION IN LOANS FUNDED and SINCE 2002 are compiled
   into it, so they render on the homepage and every application route. Those
   pages are indexed. This is the last place those claims survive.
```

Item 3 is the one with a deadline attached: every other copy of those claims is
gone, and these are on indexed pages today.

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

Nothing here is approval to publish.
