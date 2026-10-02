# Return Package — Eric's Response of 23 September 2026

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 23 September 2026

Your response of 23 September has been implemented in full. This is the return
package your section 11 asked for, plus the two items it cannot yet contain and
why.

Written to be read cold. Nothing here is approval to publish.

---

## 1. What changed, section by section

### §1 — DFW is not a separate branch, office, location or entity

**Implemented in staging.** No DFW page described the company as being of DFW,
and none does now. The build already refused this class of copy; your barred
list was wider than the rule, so the rule was widened to match it exactly:

```text
now barred, suite-wide     DFW branch · Dallas branch · DFW office
                           Dallas office · DFW location
                           Leahy Lending Dallas
                           Separate Dallas–Fort Worth entity
```

Each is negative-tested — the check was confirmed to fail on each barred phrase
before being trusted to pass on the real pages. Eighteen cases, all correct.

**One thing to know, because it was not obvious.** The DFW eyebrow read
`DALLAS–FORT WORTH NON-QM MORTGAGE SPECIALISTS`. That plural phrasing was not
passing the presence-claim rule on merit — it slipped through on a technicality,
because the words `NON-QM` sat between the market name and the noun and broke the
pattern the rule matches. It has been on every DFW page since. It is now gone,
replaced by your §7 standard. The rule no longer has that gap.

### §2 — approved company claims retained

**Implemented in staging.** The pass that had removed these was deleted outright
rather than narrowed, because your response called the removal "incorrect and
overbroad" and every claim regenerates from its own builder once nothing is
stripping it.

| Claim | Pages carrying it |
|---|---|
| `Serving Texas clients since 2002.` | 26 |
| `Over $1 billion in loans funded.` | 24 |
| Google rating and review count | 21 |

Display treatment is as you specified: `SINCE 2002`,
`OVER $1 BILLION IN LOANS FUNDED`, `Google · 5.0 · 258 Reviews`.

Three build gates had been changed to *require* the claims' absence. All three
are back to requiring their presence, so the removal cannot recur quietly.

### §4 — legal, privacy, SMS and structured-data contact

**Implemented in staging.** All five functions are on `ClientCare@LeahyLending.com`:

```text
privacy   rights-exercise contact          ClientCare@
privacy   SMS HELP and compliance          ClientCare@
privacy   policy enquiries                 ClientCare@
terms     legal-notice contact             ClientCare@
schema    Organization email               ClientCare@
```

`Eric@LeahyLending.com` remains on ordinary borrower contact across the DFW
pages, which is the distinction your response drew.

**Two defects were found doing this, and both are worth your attention** because
they are the kind that survive a green build:

1. **The terms page was showing one address and mailing another.** Its
   legal-notice block rendered the text `Eric@LeahyLending.com` inside a link
   whose `mailto:` pointed at `ClientCare@`. A visitor reading the page and a
   visitor clicking it got different answers. Fixed; every visible address on
   every DFW page now matches its own `mailto:`.

2. **Three pages could not be corrected at all until the pass was rebuilt.** The
   Organization schema email on `1099-mortgages`, `bank-statement-mortgages` and
   `self-employed-mortgages` was still Eric's. Those three pages are maintained
   as files rather than regenerated, so the 21 September change was baked in
   permanently — and the correction pass only ever searched for the *old*
   address, which those pages no longer contained. It skipped them silently.
   The pass now reads both addresses and decides each occurrence from its own
   context, so it is self-correcting whichever value a page starts from.
   Negative-tested in both directions.

### §5 — Austin positioning

**Implemented in staging.** `AUSTIN'S TRUSTED MORTGAGE SPECIALIST` is retained on
9 Austin pages. None of the four escalations you barred appears anywhere:
`Austin's #1 mortgage specialist`, `Austin's most trusted mortgage specialist`,
`Austin's best mortgage lender`, `Austin's highest-rated mortgage lender`.

### §6 — close-target wording

**Implemented in staging.** The stat read `Day Close Target — 21`. It now reads
`21-DAY CLOSE TARGET`, with your support text immediately below it, in the same
panel — not in a footer, tooltip, modal, separate legal page or collapsed
disclosure:

> Closing timelines vary by loan program, borrower documentation, property,
> appraisal, title, underwriting, lender, and other transaction conditions. A
> target is not a guarantee of closing within 21 days.

None of the barred phrasings appears: `21-Day Close`, `Close in 21 Days`,
`Guaranteed 21-Day Close`, `Guaranteed Closing in 21 Days`, `21-Day Closings`.

**Applied to two pages, not the one you named — flagging it rather than burying
it.** Your §6 cites `/how-self-employed-borrowers-qualify-for-mortgage/`. The
same stat also sits on `/self-employed-mortgage-loans/` in a different shape. You
asked to *standardize* the wording, and you have previously ruled against
different claim rules for DFW versus Austin, so leaving one page on the wording
you rejected would have reproduced the split the direction exists to close. This
is the same stat restated, not new copy. **Say so if you want it confined to the
one page.**

**The disclosure very nearly shipped invisible.** First build rendered it in the
page's default body color — near-black text on a dark navy panel. The stylesheet
is prebuilt, so the two styling classes used did not exist in it and were
silently ignored. A required disclosure was present in the source and unreadable
on screen. It is now legible, and the build refuses to ship this disclosure
styled by any class that is not actually in the compiled stylesheet.

### §7 — DFW market headline

**Implemented in staging.** All 16 DFW pages carry
`DALLAS–FORT WORTH MORTGAGE SPECIALIST`. `TEXAS'S TRUSTED MORTGAGE SPECIALIST`
appears on no DFW page — it was already absent.

### §8 — legal, privacy and SMS phone numbers

**No change made**, per your direction not to alter them on market-consistency
grounds. The DFW privacy page continues to show `(512) 240-2897` in the
privacy-policy contact line and the SMS compliance line, and `(214) 531-6416`
elsewhere.

### §9 — sameAs

**No change made.** `sameAs` stays omitted from the Person schema. The node
carries name, url, jobTitle and worksFor only.

### §10 / §13 — resources

**Nothing published, nothing attributed to you.** No resource carries Eric
attribution anywhere in the build.

---

## 2. Your section 11 return package

### Items confirmed from source

| Item | Status |
|---|---|
| DFW not a separate office, branch or entity | Confirmed — §1 above; 18 negative-tested cases |
| Approved company claims retained | Confirmed — §2 above; 26 / 24 / 21 pages |
| Austin trusted-specialist heading retained | Confirmed — 9 pages |
| `21-DAY CLOSE TARGET` + adjacent support text | Confirmed — 2 pages, verified on screen |
| Legal / privacy / SMS contact values unchanged | Confirmed — §4 and §8 above |

### Items that cannot be supplied yet, and why

**The staging link and the team-card screenshot.**

Your profile page is built, indexable, in the sitemap, and linked from 11 pages:

```text
/loan-officers/eric-bennett/
H1       Eric Bennett | Mortgage Guidance for Complex Income and
         High-Balance Scenarios
robots   index, follow, max-snippet:-1, max-image-preview:large
sameAs   omitted
```

It has never been uploaded. `https://leahylending.com/loan-officers/eric-bennett/`
returns 404 right now — verified by loading it, not assumed. The live site also
still shows `DALLAS–FORT WORTH NON-QM MORTGAGE SPECIALISTS`, which confirms that
nothing built since 21 September has been deployed to either environment.

So there is no link to send you yet. Two further things you should know:

- **Staging is behind HTTP basic authentication.** A staging link will return 401
  without credentials. If you want to review there, you need them from Jake.
- **The team-card refresh cannot be done here at all.** See section 4 below.

**The production deployment and indexing-validation package.** Blocked on the
upload. It is the next action and is described in section 3.

---

## 3. What happens next, in order

1. **Jake uploads the current fileset.** 110 files, production mode, sitemap at
   `https://leahylending.com/sitemap.xml`. Everything in section 1 of this
   document reaches the live site at that point and not before.
2. **Indexing state on arrival:** 19 pages indexable, 7 held back as
   `noindex, follow`. The held-back set is `(home)`, `about`, `contact`,
   `privacy`, `terms`, the DFW calculator, and DFW `home-loans` — the last per
   your Handoff B, pending a content-differentiation brief.
3. **Request Indexing** in Search Console for the remaining URLs. Ten were
   outstanding; the daily quota was hit on 21 September.
4. **Indexing-validation package** returned to you once Search Console has
   recrawled.

---

## 4. What is waiting on the React application release

Three items need the application source and cannot be done from this fileset.
They are not blocked on you except for prioritising them.

**Why.** The Austin homepage and the routes the application renders itself —
`/about`, `/contact`, `/apply`, `/privacy`, `/terms` — are drawn in the browser by
a compiled JavaScript bundle. The served HTML for those URLs is 13 characters of
text and an empty container. The bundle ships with no source and no sourcemap in
this fileset, so its contents cannot be edited, only regenerated from the
application project. **That project has not been released to this workstream.**
That is the whole of the dependency: not a technical obstacle, an access one.

```text
1. Your team card
   Your §10 replacement copy, the 25+ Years of Mortgage Experience credential,
   and a link to your profile page.

2. The root-site routing module on the main homepage
   Your §12 lists it first. It is deployed on the two generic Austin pages. The
   homepage has no served HTML to place an anchor in, and your own requirement
   is "ordinary server-rendered HTML anchors in the raw page response".

3. Claims compiled into the bundle
   The approved claims render on the homepage and every application route from
   inside the bundle. They are correct and approved, so this is now a
   consistency point rather than a risk: any future change to them cannot be
   made from this fileset.
```

---

## 5. Two decisions taken from your own handoffs

Both of these were going to come back to you as questions. On review your
existing handoffs already answer them, so they were applied rather than asked.
Each is reversible in one line if the reading is wrong.

### §6 applies to both pages that carry the stat

Your §6 says **standardize**, and your earlier direction was **"do not create
different claim rules for DFW versus Austin."** Standardising a wording onto one
of the two pages that show the same stat is the split that direction rules out,
so it is applied to both. **Reversible:** name the page to confine it to.

### `/leadership-team/eric-bennett/` now points at your profile

Your build spec, section 12, is explicit:

> Legacy redirect: `/leadership-team/eric-bennett/` currently 301s to `/about`
> as a placeholder. Repoint it here once live.

The page now ships, so the placeholder is repointed. The redirect and its
destination are in the same fileset, so there is no window where it points at a
404. Ryan Leahy's URL keeps going to `/about` — there is no profile page for him,
and a redirect does not get to invent one.

Two related points, both decided the same way — by what your spec already says:

- **Bare `/loan-officers/` still 301s to `/about`.** Your spec calls it "a
  SECTION, not a one-off page", built so further approved profiles can use the
  structure later. A section index page would be new public copy, which is not
  authorized, so the prefix keeps its redirect rather than becoming a 404.
- **`/about/eric-bennett/` is still not built and not redirected.** Your spec
  says DO NOT BUILD, and 301 it only "if that URL is ever needed". It is not
  needed, so nothing was added.

**Apache rewrite rules cannot be exercised in this build** — there is no Apache
here. The rule's syntax, its one-hop behavior and the existence of its target are
checked by the build, and that check was confirmed to reject a target that does
not resolve before being trusted. The redirect itself is verified after upload.

### Your team card now links to your profile, where a team card exists

Jake confirmed on 23 September that the intended organic route is exactly what
you would expect: click your photograph or your name on the About page and land
on your profile.

**Done on the DFW About page.** Your image and your name are now a single anchor
to `/loan-officers/eric-bennett/` — an ordinary server-rendered HTML anchor in
the raw page response, which is the form your §12 requires. Your title, your
credential, your NMLS number and your bio are untouched, and Ryan's card is
untouched. This is not the §10 refresh and does not pre-empt it.

**Not possible on the public `/about`, and this is the part to register.** That
page is rendered entirely by the compiled React bundle. Its served response is
**5,021 bytes with an empty `#root` and no mention of your name anywhere in it** —
fetched from the live site to confirm, not assumed. The card visitors actually
see does not exist in any file in this fileset, so it cannot be linked from here
by any means short of injecting it with JavaScript after load.

**That injection was available and was not used.** There is precedent for it in
this codebase. It was rejected for two reasons: your spec says the team card
needs a React source change and explicitly bars a runtime patch, and a
JavaScript-injected anchor is invisible to crawlers — which would defeat the
entity-association purpose the profile page exists for, while looking like the
problem had been solved.

So the honest position: the route is correct and live-ready everywhere it can be
authored, and on the one page that matters most for discovery it waits on the
application release along with your §10 refresh. Thirteen pages now link to the
profile.

Your response states that no additional public-copy, entity-positioning, claim,
legal-contact or routing change is authorized beyond the decisions in it. Nothing
outside those decisions, or the prior handoff decisions cited above, has been
changed.

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not compliance clearance and not production approval.

**Correction, at Eric Bennett's direction, 23 September 2026.** This document
previously closed with a sentence questioning the company tenure claim against
the 2002 founding year. That characterization was wrong, is withdrawn, and has
been removed rather than quoted here.

The approved company-history claim is `Serving Texas clients since 2002.` — it
is confirmed, accurate, and approved for public production use. It is not
provisional, not pending an evidence packet, and is not to be described as
unsupported anywhere in public copy, deployment notes or production
documentation.

The two claims are distinct and stay distinct:

```text
Leahy Lending company claim   Serving Texas clients since 2002.
Eric Bennett, personal        25+ Years of Mortgage Experience.
```
