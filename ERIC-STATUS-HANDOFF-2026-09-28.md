# Status Handoff — Your 28 September Handoffs

**Date:** 28 September 2026
**To:** Eric Bennett
**From:** Jake Bennett / build
**Re:** What has been completed and what needs your decision

---

## Summary

| Handoff | Status |
|---|---|
| Profile — Exact Approved Copy Correction (superseding) | **Complete in staging** · awaiting your approval |
| Profile — Exact Copy and Hero Correction (superseded) | Closed by the above |
| Austin Conversion Model clarification | **Complete**, except a deployment-scope point in §5 below |

Nothing has been deployed. Your status line requires a return package and
explicit approval, and neither the profile work nor anything else has shipped.

---

## 1. Profile copy correction — complete

Your superseding handoff reversed the earlier one: the descriptor you had
required beneath the name was never approved, both variants are barred, and no
replacement may be substituted.

**That descriptor is gone. Nothing replaced it.** The public title now follows
the name directly.

```text
"Mortgage Guidance" occurrences anywhere in the profile ....... 0
"Mortgage Guidance" occurrences anywhere else on the site ..... 0
builder source still able to emit it .......................... no
```

Every correction implemented:

```text
H1                 -> "Eric Bennett" alone, one H1, no separator, no descriptor
public title       -> Executive Vice President & Mortgage Loan Originator
entity statement   -> ampersand form
bio paragraph 1    -> "in 2000", not "December 2000"
bio paragraph 2    -> the Highland Village sentence, in your position
bio final          -> the U.S. Army paragraph, complete
Person jobTitle    -> ampersand form
image alt text     -> ampersand form (see §3)
```

**Verification — 54 clauses, audited individually:**

```text
§2  phrase removed completely ......... 3/3
§3  hero copy ......................... 10/10
§4  full bio .......................... 10/10
§5  Highland Village confinement ...... 9/9
§6  Areas of Guidance .................  2/2
§7  CTA rules ........................ 7/7
§8  canonical and schema .............. 13/13
```

This checked more than string presence: paragraph **order** and **position**,
that the About section contains exactly seven paragraphs with nothing extra, and
that the hero holds exactly five elements beneath the H1 in sequence.

**Areas of Guidance** contains exactly your five allowed concepts and no barred
claim. No substitution was needed, so none was invented.

**CTA behavior unchanged:** both labels verbatim, both destinations unchanged,
`data-crm-tags="dfw"` and `data-market-page` intact, neither CTA routes to the
Austin funnel. Lead ownership is unchanged.

---

## 2. Validation gates — negative-tested, as you required

A build gate now enforces every §9 assertion. All 23 were broken deliberately and
confirmed to fail:

```text
[x] descriptor element reintroduced
[x] unhyphenated phrase in visible copy
[x] hyphenated phrase in visible copy
[x] phrase in the title tag
[x] phrase in the meta description
[x] phrase in Open Graph text
[x] and-form returns to the image alt text
[x] phrase in image alt text
[x] a tagline inserted between the H1 and the title
[x] barred string returns ("December 2000")
[x] pipe returns to the public title
[x] a second H1 appears
[x] the Army paragraph goes missing
[x] the Highland Village paragraph goes missing
[x] a bio paragraph is reworded
[x] Highland Village leaks into the hero
[x] Highland Village leaks into image alt text
[x] Person jobTitle reverts to a pipe
[x] sameAs is added to Person schema
[x] canonical is changed
[x] a CTA label is changed
[x] DFW routing attribute removed
[x] a CTA is repointed at the Austin funnel

23 / 23 proven to fail when violated
```

"No descriptor beneath the H1" is asserted **structurally** — the element after
the H1 must be the public title — rather than by matching one phrase. That is why
the tagline case is included: a slogan under another name still fails.

**Three defects were found in our own work and are reported rather than
smoothed over:**

1. A negative test initially passed while proving nothing — its mutation did not
   match the real markup. Corrected and re-run.
2. When updating the barred list, a string replacement removed the hyphenated
   phrase from the *banned* list rather than the *required* list, because the same
   string sat in both. The gate briefly demanded the phrase it exists to forbid.
3. The builder verified the image alt against raw markup. That was correct only
   by accident, while the alt held no special characters; the moment it gained an
   ampersand it searched for `&` in a page containing `&amp;`. Now escaped
   properly.

---

## 3. Image alt text — changed under owner authorization

Your §3 bars `Executive Vice President and Mortgage Loan Originator`. The image
alt contained exactly that string.

The first return package reported it as a proposed diff rather than changing it,
because your §9 enforcement list did not include the "and" form and §8 restricts
metadata edits. **Jake authorized the change on 28 September**, so it is now:

```html
alt="Eric Bennett, Executive Vice President &amp; Mortgage Loan Originator at Leahy Lending"
```

`&amp;` is the HTML encoding of `&`. The "and" form is now in the gate's barred
list and negative-tested.

---

## 4. Reported, not changed

**Meta description and og:description** shifted from the pipe to the ampersand as
a consequence of correcting the entity statement, which §3 requires. Neither ever
contained the barred phrase. Reported per §8.

**The page title tag still contains a vertical bar** — `Eric Bennett | Leahy
Lending`. That separates page name from site name rather than being the public
job title, and §8 bars modifying the page title. Left unchanged, flagged so it is
not mistaken for an oversight.

---

## 5. Austin conversion model handoff — complete, with one scope point

Implemented and verified:

```text
Austin remains the short-form model, unchanged
DFW remains the scenario questionnaire, unchanged
spa-lead-forms.js NOT modified — the four context fields were not added
CTA labels, destinations, CRM tags, payloads, analytics untouched
30–45 day comparison plan delivered, with DFW-only metrics labeled as such
```

**The scope point.** Your §4 limited the next combined upload to asset URL
versioning, restoration of the profile route, and the directly required link,
sitemap, page-move and redirect changes.

The staged upload now also carries:

```text
Austin contact-CTA click tracking      (your §3 metric 1 was otherwise unmeasurable)
the CCPA rights anchor on /privacy/    (the Austin gap in your earlier §5)
551 internal links given trailing slashes, removing a 301 from every click
privacy disclosure added to /apply/ and the Austin homepage
six legacy redirects corrected from two hops to one
this profile copy correction
```

Each is something you asked for in substance. None was in the deployment scope
you wrote. **Raising it for your acknowledgment rather than assuming it**, since
the same drift happened on the previous upload and was flagged then too.

---

## 6. What is needed from you

1. **Approval of the profile return package**, so it can deploy. Full package:
   `ERIC-PROFILE-COPY-RETURN-V2-2026-09-28.md`, amended by §3 and §4 above.
2. **Acknowledgment of the widened deployment scope** in §5, or direction to
   split it.

---

## Build controls and their limits

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.

A passing build is not a compliance clearance and is not a production approval.
No production deployment has been made.

---

*Kyber Mortgage Corporation dba Leahy Lending · NMLS 2653540*
