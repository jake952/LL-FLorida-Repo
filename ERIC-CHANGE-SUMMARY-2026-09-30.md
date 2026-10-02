# Change Summary — What Went Live, 30 September 2026

**Date:** 30 September 2026
**To:** Eric Bennett
**From:** Jake Bennett / build
**Re:** Everything deployed since the 27 September build, with production verification

---

## What is live

Nine changes, deployed 30 September:

```text
1. Eric profile — exact approved copy correction
2. Eric profile — route restored to /loan-officers/eric-bennett/
3. Asset URL version stamping
4. Austin contact-CTA click tracking
5. CCPA rights anchor on /privacy/
6. Privacy disclosure on /apply/ and the Austin homepage
7. 551 internal links slashed — a 301 removed from every click
8. Six legacy redirects corrected from two hops to one
9. Honeypot bot filtering extended to all five submitting pages
```

Everything below is verified against production, not staging.

---

## 1. Profile copy correction

```text
H1                          "Eric Bennett"        exactly one H1
supporting descriptor       absent                nothing between name and title
public title                Executive Vice President & Mortgage Loan Originator
"Mortgage Guidance"         0 occurrences         both variants, whole page
"December 2000"             absent
Highland Village            1 occurrence          the approved bio sentence only
U.S. Army paragraph         present
bio                         7 paragraphs, your order, Highland Village second
Person jobTitle             Executive Vice President & Mortgage Loan Originator
canonical                   /loan-officers/eric-bennett/
```

Every barred string from your §9 list is absent. Every required string is
present verbatim. A build gate now enforces all of it, with 23 assertions each
proven to fail when violated.

**Image alt text** was also changed to the ampersand form. It previously read
`Executive Vice President and Mortgage Loan Originator`, which your §3 bars. It
sat outside your §9 enforcement list so it was first reported rather than
changed; Jake authorized the change on 28 September.

**Two knock-on metadata changes**, both flowing from the corrected entity
statement: the meta description and og:description now carry the ampersand
instead of the pipe. Nothing else in either tag changed.

**The page title still reads** `Eric Bennett | Leahy Lending`. That bar separates
page name from site name rather than being the public job title, so it was left
alone.

---

## 2. Lead routing — unchanged, confirmed live

```text
START A DFW SCENARIO REVIEW →   href="#scenario-review"                    unchanged
CONTACT ERIC →                  href="/texas/dallas-fort-worth/contact/"   unchanged
data-crm-tags="dfw"                                                        unchanged
data-market-page="dallas_fort_worth"                                       unchanged
```

Submissions from your profile still tag `dfw` and route to you.

End-to-end test on the Austin contact form after the changes:

```text
POST https://ll-crm-integration2.vercel.app/api/contact
HTTP 200  {"success":true,"contactId":"AItFu7n9kNYkhNUkOIJT"}
```

Synthetic data only, record deleted.

---

## 3. Everything else, verified on production

```text
stamped asset references    9 on the DFW market page, 0 unstamped
tracked Austin CTAs         8 on a sample program page
unslashed internal links    0
privacy disclosure          present on /apply/, / and /contact/
CCPA anchor                 present on /privacy/
sitemap                     23 URLs
```

**Asset versioning** matters because SiteGround serves these files with a
one-year cache and the filenames never changed — so a returning visitor kept
running the previous JavaScript and CSS indefinitely. Each reference now carries
its file's content hash, so a change to any file busts its own URL.

**The CCPA anchor** was the Austin privacy gap. The "Do Not Sell My Personal
Information" link in the consent block pointed at `/privacy/#ccpa`; the DFW
privacy page carried that anchor and the Austin one did not, so the Austin link
landed at the top of a twelve-section policy instead of at section 6. One
attribute, now matching what DFW already shipped. No policy wording changed.

**The privacy disclosure** closed the other half of that gap: `/apply/` and the
Austin homepage collected name, email and phone with no notice that a privacy
policy governed the submission, while `/contact/` and the DFW page both carried
one. The existing approved block was copied verbatim. Notice only — no consent
checkbox was added and nothing became required.

---

## 4. Honeypot — relevant to your §3 comparison

Only the DFW questionnaire had bot filtering. The other four submitting pages,
including the whole Austin side, accepted anything sent to them. All five feed
the same CRM.

That bears directly on the measurement: spam would inflate Austin's lead count in
exactly the Austin-versus-DFW comparison, making the market with the weaker bot
defence look like it converts better.

All five pages now carry the same hidden checkbox the DFW form uses, and both
handlers discard submissions that tick it. Verified on production in both
directions — a fully filled form with the field ticked produced zero CRM calls;
the same form untouched produced a successful submission.

---

## 5. Measurement plan — both prerequisites now met

```text
asset-versioning deployment      LIVE
Austin attribution fields        closed by owner decision
```

The 30–45 day window can open. The remaining input is the written definition of
"qualified conversation" — your metric 4.

Jake's direction is to run two weeks of observation first, then supply it. One
note for the file: the definition should be fixed before the comparative totals
are examined. That metric decides the comparison, and setting the threshold after
seeing which market scored better would make the result unfalsifiable.

---

## 6. Open items

```text
post-deploy Search Console export      ~11 October, once Google re-crawls
"qualified conversation" definition    after two weeks of observation
```

Nothing else is outstanding, and nothing is blocked.

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
