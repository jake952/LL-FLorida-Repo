# Handoff B — Status and Blocking Inputs

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 21 September 2026
**Re:** Handoff B — Site Build, Entity Connections, and Validation

---

## Short version

Handoff B is **blocked at its own prerequisite**, and correctly so. Seven of the
nine build tasks depend on approved copy and factual inputs from Handoff A, none
of which has arrived. Nothing that requires your approved copy has been built,
and nothing has been guessed at or drafted "to be replaced later".

What has moved: the indexation work your Shared Sequence puts first is complete
in the build and waiting on one upload, and **one instruction in Handoff B
conflicted with a change made earlier the same day. It has been reverted to
match you.** Detail in section 3.

Section 5 is the deliverable you can act on now: everything you need to supply
before any of this can be built.

---

## 1. Build task status

| Task | Status | Blocked on |
| --- | --- | --- |
| 1. Canonical Eric profile page | Not started | Approved profile copy, headshot + alt text, role/entity statement, disclosures, professional URLs, CTA destination |
| 2. Work With Eric module | Not started | Approved module copy, CTA destinations, and your yes/no on DSCR and Construction |
| 3. Root-site DFW routing module | Not started | Approved routing copy and an approved destination |
| 4. DFW market-home handling | **Already in the required state** | — |
| 5. Author/reviewer framework | Not started | Approved attribution text, your confirmation of what you actually authored or reviewed |
| 6. DFW education-resource template | Not started | Approved resource copy and briefs |
| 7. Eric entity structured data | Not started | The visible approved facts it is supposed to mirror |
| 8. DFW indexation and entity-link QA | Indexation complete in the build; awaiting upload, then Search Console and Bing | Upload, cache purge, then live verification |
| 9. Analytics boundaries | Event inventory defined, nothing wired | The modules themselves |

Task 4 needs no work: `/texas/dallas-fort-worth/` is already `noindex, follow`,
its internal links are crawlable, and it is not in the sitemap. That value was
set on 21 September for a reason that turns out to match your direction exactly
— see section 4.

---

## 2. What is ready to ship, and what it is waiting on

Your nine intended-indexable DFW retrieval pages are all `index, follow` in the
build, all self-canonical, all in the sitemap, and all internally linked:

```text
self-employed-mortgages        bank-statement-mortgages
1099-mortgages                 no-ratio-mortgages
asset-utilization-mortgages    rsu-bonus-commission-income
super-jumbo-mortgages          dscr-investor-loans
construction-loans
```

The production `robots.txt`, with the `Sitemap:` directive, is prepared and has
**never been uploaded** — the live one is the host default. All of it is waiting
on a single upload.

Until that upload happens, every DFW page on production is still serving
`noindex, nofollow, noarchive, nosnippet`, so nothing in Handoff B's entity
system can begin working regardless of what is built.

---

## 3. One conflict, found and resolved in your favor

**`/texas/dallas-fort-worth/home-loans/` had been made indexable earlier on
21 September. Handoff B says not to change its indexation state. It has been put
back.**

The sequence, because it matters for the record:

```text
9 September    Held back from the index on instruction. It measured 84%
               identical to the Austin /home-loans/ page by 5-gram overlap;
               the other seven cross-market pairs sit at 30-39%.
21 September   Your first handoff that day listed it among ten URLs intended
               to rank. Jake directed it be made indexable, and it was.
21 September   Handoff B lists NINE intended-indexable pages, excludes this
               one, and names it separately: do not change its indexation
               state without an owner-approved content-differentiation brief.
21 September   Reverted. noindex, follow, and out of the sitemap.
```

**Nothing was published in that window.** The URL never went to production as
indexable and came back, so there is no crawl history to unwind and no signal to
correct. The sitemap followed automatically, because it reads the held-back list
rather than keeping its own copy.

The build now also refuses the reverse drift: a page you have held back cannot
become indexable without the check failing and naming it. That guard was
negative-tested.

---

## 4. Two places where Handoff B confirms something already found

Recording these because they mean less work, not more.

**The market home is already `noindex, follow`.** It was changed from the full
`noindex, nofollow, noarchive, nosnippet` on 21 September, before Handoff B
arrived, because measuring the link graph showed the market home is the **only**
static route into the DFW cluster from the indexed site — six Austin program
pages each link to it, and none links to any of the nine. With `nofollow` on it,
making the nine indexable would have opened them while closing the one door.
Your Task 4 requires exactly the state it is now in.

**Your instruction not to rely solely on links from the noindex market home for
discovery is currently unsatisfiable, and Task 3 is the fix.** Today that is the
only static route in. The Austin application's DFW link is added by JavaScript
after load and is absent from the HTML a crawler is served — the raw response for
`leahylending.com/` contains zero occurrences of `dallas-fort-worth`. Your
requirement that the routing module render ordinary HTML anchors in the source
delivered to crawlers is the thing that closes it.

---

## 5. Deliverable 9 — inputs required before anything can be built

Nothing below is a preference. Each item blocks a specific build task, and none
can be substituted with placeholder text, because a placeholder in a page about
a real licensed individual is a factual claim about that person.

### 5.1 Blocks Task 1 — the canonical profile page

```text
[ ] Approved profile copy, final wording
[ ] Approved role and title, exactly as it may be stated publicly
[ ] Approved statement of the Leahy Lending / Kyber Mortgage Corporation
    relationship, in the form it may appear publicly
[ ] NMLS treatment: which number is shown, in what form, and where
[ ] Required disclosures, verbatim
[ ] Approved DFW service-market statement
[ ] Approved list of areas of guidance
[ ] Headshot file, plus the alt text you want with it
[ ] Approved direct professional contact method
[ ] Approved professional profile URLs for sameAs — real, current, and yours
[ ] Primary CTA destination: the DFW scenario-review form or calendar URL
[ ] Secondary CTA destination, if there is one
[ ] Route decision: /loan-officers/eric-bennett/ or /about/eric-bennett/
```

### 5.2 Blocks Task 2 — the Work With Eric module

```text
[ ] Approved module copy
[ ] Approved primary CTA label and destination
[ ] Yes or no on /texas/dallas-fort-worth/dscr-investor-loans/
[ ] Yes or no on /texas/dallas-fort-worth/construction-loans/
```

### 5.3 Blocks Task 3 — the root-site routing module

```text
[ ] Approved routing copy
[ ] Approved destination, given that the market home is excluded by your own
    rule: the profile page, a specific indexable DFW program page, or the
    scenario-review endpoint
[ ] Confirmation of which root pages it goes on. The generic Self-Employed and
    Bank Statement pages exist; there is no generic Super Jumbo page on the
    Austin site, so that location has nothing to attach to today.
```

### 5.4 Blocks Tasks 5 and 6 — attribution and resources

```text
[ ] Approved "Prepared by" / "Reviewed by" wording
[ ] A named list of which content you actually authored or materially reviewed
[ ] The last-reviewed date for each
[ ] Approved resource copy, per resource
[ ] The borrower-facing qualifier/disclaimer, verbatim
```

### 5.5 Blocks Task 7 — structured data

Task 7 requires the schema to mirror visible approved facts, so it cannot be
written before 5.1 is answered. Once it is, the Person node will carry only what
the page visibly states, and no ratings, volume, tenure, awards or address.

### 5.6 Outstanding from the earlier handoff, and still unresolved

These predate Handoff B and gate an indexable production release:

```text
[ ] 258 five-star reviews          evidence record, or withdrawal
[ ] Over $1 billion in loans funded evidence record, or withdrawal
[ ] 25+ Years of Experience         evidence record, or withdrawal
```

All three are approved for a noindex staging build and carry **Pending evidence
record** against an indexable release. Your validation list in Handoff B bars
introducing a new tenure, review or volume claim; these are existing ones, and
the upload makes the pages carrying them indexable for the first time.

---

## 6. Questions that need an answer before build, not during

1. **Route for the profile page** — `/loan-officers/eric-bennett/` is your
   stated preference. It creates a new top-level section on a site that has none.
   Confirm, and confirm nothing else is planned to live under it, because a
   single-child directory is worth knowing about before it exists.
2. **DSCR and Construction** — the module list marks both "only if Eric
   approves". They are otherwise in your intended-indexable nine.
3. **The Austin mortgage calculator** is live and has been `noindex` since it
   went up, by accident rather than decision — the tool that sets indexing never
   saw it. It is held at its current state pending your answer. The DFW
   calculator is held back *because* it duplicates this Austin one, so if the
   Austin original is also unindexed, neither can rank.
4. **`/texas/dallas-fort-worth/contact/`** is currently indexable and in the
   sitemap, and appears on neither of your lists. Intended, or hold it back with
   about, privacy and terms?

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

Nothing here is approval to publish, and the build completing without failures
states how much was checked rather than that the pages are correct or complete.
No claim is made about whether Google or Bing will index these pages, whether
they will rank, or whether answer engines will cite them or associate them with
you.
