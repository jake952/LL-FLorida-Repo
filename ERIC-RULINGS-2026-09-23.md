# Eric Bennett — Rulings of 23 September 2026

**Status:** governing. Supersedes the earlier handoffs where they conflict.
**Recorded:** 23 September 2026.

---

## About this record, and how far to trust it

**Eric did not supply a file.** Both of his 23 September responses arrived as
messages, and this document is a transcription of them made by the build so that
the repository stops citing instructions from 21 September that his later
rulings have overtaken. Every other `ERIC-*.md` in this folder is either a
document he sent or one we sent him; this one is neither, and that distinction
matters if anything here is ever disputed.

**If Eric's original wording differs from this record, his original governs.**

Three kinds of statement appear below and they are labelled throughout:

```text
VERBATIM   quoted from his message
SUMMARY    his decision, restated by the build
RELAYED    reported to the build by Jake Bennett as Eric's decision,
           with no message from Eric seen directly
```

The RELAYED items are the ones to get in writing. They are also the four most
consequential in the set.

---

# Part A — Final response

## A1. DFW is not a separate entity

**SUMMARY.** Dallas–Fort Worth is not a separate branch, office, location or
legal entity from Austin, and no page may describe it as one.

**VERBATIM — barred:**

```text
DFW branch
Dallas branch
DFW office
Dallas office
DFW location
Leahy Lending Dallas
Separate Dallas–Fort Worth entity
```

## A2. Company claims — confirmed and approved

**SUMMARY.** These are accurate, approved for public production use, and must
REMAIN in production. This reverses the earlier removal, which he called
"incorrect and overbroad."

```text
Serving Texas clients since 2002.
Over $1 billion in loans funded.
Google rating and review count.
```

**VERBATIM — display treatment:**

```text
SINCE 2002
OVER $1 BILLION IN LOANS FUNDED
Google · 5.0 · [count] Reviews
```

**Do not describe these as unsubstantiated, provisional, pending, unsupported or
awaiting an evidence packet** — see B1, where he corrected exactly that.

## A3. Contact routing

**SUMMARY.** The shared company mailbox is restored for every legal, privacy,
SMS-compliance, terms and Organization-schema function:

```text
ClientCare@LeahyLending.com   privacy rights-exercise requests
                              SMS HELP and compliance contact language
                              privacy-policy enquiries
                              terms / legal-notice contact information
                              Organization structured-data email

Eric@LeahyLending.com         ordinary borrower enquiries on DFW pages only
```

**VERBATIM:** "Do not conflate that sales/contact route with company legal or
privacy communications."

## A4. Austin positioning

**SUMMARY.** Keep `AUSTIN'S TRUSTED MORTGAGE SPECIALIST`.

**VERBATIM — barred escalations:**

```text
Austin's #1 mortgage specialist
Austin's most trusted mortgage specialist
Austin's best mortgage lender
Austin's highest-rated mortgage lender
```

## A5. Close-target metric

**SUMMARY.** Standardize the displayed wording to `21-DAY CLOSE TARGET`.

**VERBATIM — barred:**

```text
21-Day Close
Close in 21 Days
Guaranteed 21-Day Close
Guaranteed Closing in 21 Days
21-Day Closings
```

**VERBATIM — required support text**, placed in or immediately below the stat
section; not in a footer, tooltip, modal, separate legal page or collapsed
disclosure:

> Closing timelines vary by loan program, borrower documentation, property,
> appraisal, title, underwriting, lender, and other transaction conditions. A
> target is not a guarantee of closing within 21 days.

## A6. DFW market headline

**SUMMARY.** The approved standard is either of:

```text
DALLAS–FORT WORTH MORTGAGE SPECIALIST
MORTGAGE OPTIONS FOR DALLAS–FORT WORTH
```

`TEXAS'S TRUSTED MORTGAGE SPECIALIST` is not to appear on a DFW page.

## A7. Other

**SUMMARY.**

- Do not change legal, privacy or SMS phone numbers on market-consistency
  grounds.
- `sameAs` stays omitted from the Person schema.
- No resource may be published with Eric attribution.

**VERBATIM, closing:** "No additional public-copy, entity-positioning, claim,
legal-contact, or routing change is authorized beyond the decisions stated in
this response."

---

# Part B — Review of the return package

## B1. Required correction

**VERBATIM.** The return package's closing sentence, which questioned the tenure
figure against the 2002 founding year, is to be deleted or replaced. The
approved company-history claim is `Serving Texas clients since 2002.` and it
"is confirmed, accurate, approved for public production use, and is not to be
characterized as unsubstantiated, provisional, pending, unsupported, or awaiting
an evidence packet."

**VERBATIM — keep the claims distinct:**

```text
Leahy Lending company claim:      Serving Texas clients since 2002.
Eric Bennett personal credential: 25+ Years of Mortgage Experience.
```

**VERBATIM.** Do not reintroduce `25+ Years of Experience` or `25+ Years in
Business` as a company claim "unless I specifically authorize that wording
later."

## B2. Implementation review — approved as implemented

**SUMMARY.** Sixteen items confirmed, abbreviated here; the substance is in A1–A7
and in the build's own gates:

```text
 1  DFW not described as a separate branch, office, location or legal entity
 2  the barred DFW phrases and their negative build checks
 3  DALLAS–FORT WORTH MORTGAGE SPECIALIST replaces the Non-QM plural wording
 4  the confirmed company claims are retained
 5  ClientCare@ restored for privacy, SMS, legal, terms and Organization schema
 6  Eric@ only for ordinary borrower-facing DFW contact
 7  AUSTIN'S TRUSTED MORTGAGE SPECIALIST retained
 8  21-DAY CLOSE TARGET standardized
 9  its support text visible immediately below, in the same panel
10  sameAs remains omitted
11  no Eric-authored or Eric-reviewed resources published
12  /leadership-team/eric-bennett/ redirects to /loan-officers/eric-bennett/
13  /loan-officers/ remains a section prefix with its existing redirect
14  /about/eric-bennett/ remains unbuilt and unredirected
15  the DFW About-page team-card anchor to the canonical profile is approved
16  NO JavaScript-injected anchor, runtime patch or workaround is authorized
    for the public React-rendered /about page
```

## B3. Close-target scope

**SUMMARY.** Applying the standardized wording and support text to **both** pages
carrying the stat is approved:

```text
/how-self-employed-borrowers-qualify-for-mortgage/
/self-employed-mortgage-loans/
```

## B4. Application-source dependency

**SUMMARY.** Acknowledged. No runtime patch or JavaScript injection may be used
to modify the public React homepage or public `/about`. When the application
project is available, three items ship together: Eric's About-page team card
(link, approved copy, title, NMLS #288376, `25+ Years of Mortgage Experience`);
the root-site routing module; and the application-bundle company claims, which
are retained and must not be assigned to Eric individually.

## B5. Upload authorization

**SUMMARY.** Upload the current fileset to production, subject to a preflight
check. His list, and its status against the fileset as built:

```text
[x] the inaccurate "unsubstantiated" tenure sentence removed from the record
[x] 19 intended-indexable pages carry index, follow
[x] the seven held-back routes remain noindex, follow
[x] sitemap.xml contains only intended canonical indexable URLs
[x] confirmed company claims in their approved placements
[x] no barred branch / office / location / separate-entity language
[x] ClientCare@ in the required contexts, visible text matching its mailto
[x] 21-DAY CLOSE TARGET support text legible, desktop and mobile
[x] /leadership-team/eric-bennett/ one-hop redirect, once both are live
[x] no unresolved placeholder CTA can become publicly indexable
```

**After upload:** purge caches; verify live response, rendered page, canonical,
robots, sitemap presence and redirect behavior; confirm the profile returns 200
and is indexable; confirm each held-back route stays `noindex, follow` and out of
the sitemap; run Search Console Live Tests per intended-indexable DFW URL;
**request indexing only after the corresponding Live Test confirms eligibility**;
submit or refresh the sitemap in Search Console and Bing Webmaster Tools; return
the production validation package.

**VERBATIM, on the profile page:** it is not live until the post-upload check
confirms `200`, `index, follow`, a self-referencing canonical and sitemap
presence. "Do not ask Google or Bing to index it before that production
verification is complete."

## B6. Publication scope — not authorized

**VERBATIM.**

```text
New rates, APRs, payment examples, fees, or trigger-term advertising
Changes to licensing disclosures or NMLS disclosures
Changes to privacy or SMS-program contacts beyond those stated
New product-eligibility or approval claims
New public resource content or Eric attribution
A React/runtime workaround outside the normal application-source release
A separate DFW office, branch, location, or entity representation
```

---

# Part C — Relayed approvals

**RELAYED by Jake Bennett, 23 September 2026. No message from Eric seen
directly. Get these in writing.**

## C1. Company tenure figure

The company figure returns to `20+ Years of Experience`. `25+` is retained only
for Eric personally. This resolves B1 in the direction of Eric's ruling, on
Jake's instruction to follow it.

## C2. Eric's own credential

Eric's credential and every mention of his work experience read 25 years —
`25+ Years of Mortgage Experience`, with the supporting bio sentence moved to
match so the card does not contradict itself.

## C3. Four claims approved for production

Each had been outstanding since the 21 September decision table, which his own
21 September response did not address, and which neither 23 September response
mentions:

```text
WE SAY YES WHEN OTHERS SAY NO / LEAHY LENDING SAYS YES
    previously barred by §1.4 and homepage §2
    NOTE: not confined to the market home. sync-marquee.js places it on every
    DFW page and it is also live Austin copy, so this approval covers 19
    indexable pages.

No Tax Returns Required
    on the §4.1 standing prohibited list, which permits it "absent a separate
    owner/product/compliance approval". Present on three indexable AUSTIN
    pages in captured live copy.

Michael R. testimonial, including "$1.4M"
    §6 barred testimonials until substantiated. Written permission from the
    named borrower was already recorded as on file, 18 September 2026. The one
    page carrying it is noindex.

14 STATES LICENSED
    previously pending a licensing-footprint evidence record. On the noindex
    market home only.
```

---

# What this supersedes

```text
§1.4 / homepage §2   bar on "We Say Yes" wording            superseded by C3
§4.1                 "No Tax Returns Required"              approved by C3
§6                   testimonial bar, for this testimonial   approved by C3
18 Sep               withdrawal of both 25+ variants        settled by B1 + C1
15/18 Sep            "25+ Years of Experience" as company    withdrawn by B1
                     claim, owner-directed
21 Sep               "pending evidence record" framing on
                     SINCE 2002 / $1B / review count         superseded by A2
21 Sep               DALLAS–FORT WORTH'S TRUSTED wording     superseded by A6
```

---

# Still unanswered

```text
How the profile page should be reached organically. Open since 21 September.
The team card is the route and needs the application source; B4 bars a runtime
workaround. No interim route authorized.

§13 resource copy and review dates for the five named resources. Nothing can
publish without final copy and a real review date for each.

The lead-capture defect. Neither 23 September response mentions it, and the
return package he reviewed does not contain it: the homepage and /apply forms
accepted submissions, showed a success message and sent nothing. A runtime
handler now posts them to the CRM. B6 does not authorize "a React/runtime
workaround outside the normal application-source release", and that bar was
written about the About-page anchor, with no knowledge that one member of the
category was discarding live leads. Eric has not ruled on it because he has
not been told.
```

---

## What this document does not say

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not compliance clearance and not production approval.
