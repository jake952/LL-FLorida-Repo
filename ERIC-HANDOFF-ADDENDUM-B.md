> **SUPERSEDED — 17 September 2026.**
>
> Everything in this addendum is now carried in **Revision 3** of
> `ERIC-CONSOLIDATED-HANDOFF.md`, which reads start to finish as one document.
> Read that instead. This file is kept only so that a copy already sent does
> not read as current.

---
# Addendum B — Owner-Directed Changes After the Consolidated Handoff

**To:** Eric Bennett
**From:** Jake Bennett
**Date:** 15 September 2026
**Reads with:** `ERIC-CONSOLIDATED-HANDOFF.md` (Revision 2). This does not replace
it — it covers only what changed after it was written.

---

## Read this first

Revision 2 reported a build in which every compliance control passed. **That is
no longer the description.** Since it was written, the DFW homepage has taken on
a set of owner-directed changes that deliberately override eight controls across
four gates, including one claim from the §4.1 standing prohibited list.

Nothing here is hidden, disabled, or quietly exempted. Every override is listed
in one file, printed on every build, and carried into the claim inventory. But
the honest summary of this round is: **the build now passes because it has been
told to pass, not because the copy clears the rules.**

The page remains `noindex`. Nothing is published.

**Status labels** are your §7.2 six. One distinction is load-bearing throughout:

- **Owner-directed** — Jake asked for it, it is built, compliance has not cleared it
- **Owner-approved** — you decided it

Everything in Sections 1–3 is the first, not the second.

---

# 1. Tenure wording changed to "25+ Years of Experience"

**Owner-directed. Implemented in staging.**

The global footer and homepage hero tile now read **25+ Years of Experience**,
replacing **25+ Years in Business**, on all 16 DFW pages.

The reason is sound and it closes a contradiction Revision 2 flagged: 2002 to
2026 is 24 years, so "25+ Years in Business" disagreed with the founding date the
site states elsewhere.

**What it reverses.** Your homepage handoff §5 said:

> "Do not call company history '25+ years of experience' if the verified claim is
> business tenure. Use the canonical wording exactly."

That instruction is what had changed this tile *from* "20+ Years of Experience"
*to* "25+ YEARS IN BUSINESS". It has now been changed back. Your §1.2 of
15 September also said "Do not make further global footer-copy changes at this
time"; this is one.

**Both concerns are real and they pull opposite ways.** Yours: "experience"
overstates if the verified claim is business tenure. Jake's: "in business"
contradicts 2002. Changing the wording settles neither — **neither figure has
evidence in this repository**, so it remains *Pending
product/compliance/legal/privacy review* under §1.3 and §5.3, exactly as before.

Four instances were deliberately left alone, all on the About page your §2.10
puts out of scope:

| Instance | Why it was left |
|---|---|
| H1 "…**for Over Two Decades**" | §2.10: do not modify the About-page H1 |
| Expertise card "**Over two decades** of specialized experience" | §2.10 scope; already experience framing |
| Team card "**20+ Years Experience**" | a named individual's credential (NMLS# 288376) |
| Bio "brings over **20 years of experience**" | same individual |

The last two are a person's stated professional history. Restating them as 25+
would be inventing a fact about someone, not rewording a company claim.

---

# 2. The DFW homepage hero rebuilt to match the Austin hero

**Owner-directed. Implemented in staging. This is the section that needs you.**

The DFW hero was missing the gold marquee bar and the bottom pop-up and did not
match the Austin hero. The conflict was put to Jake before anything was built,
with the barred strings named. The direction was to use the Austin copy.

### What was added

| Piece | Detail |
|---|---|
| Gold marquee | above the hero, Austin's strings with DFW market name and `(214) 531-6416` |
| Five-star row | between the qualifier and the CTAs |
| Customer testimonial | below the stat tiles |
| Sticky bottom bar | rebuilt to Austin's arrangement, visible at load |
| Right-panel badge | replaced the seven-item options list |

Hero body copy and the four stat tiles were not touched.

### The eight controls this overrides

Each still runs and still matches. None was edited or deleted — they are listed
in `_build/owner-directed-hero.js` and printed on every build:

```text
WE SAY YES WHEN OTHERS SAY NO      §1.4, and homepage §2 CTA language
LEAHY LENDING SAYS YES             homepage §4 removal list
SINCE 2002 / Serving Texas Since…  §1.3 no tenure in new page copy
258 Five-Star Reviews              §6 no review counts until substantiated
OVER $1 BILLION IN LOANS FUNDED    unsubstantiated volume claim
the Michael R. testimonial         §6 no testimonials until substantiated
$1.4M inside that testimonial      names a borrower and a loan amount
No Tax Returns Required            §4.1 STANDING PROHIBITED LIST
market name count (4, allowed 2)   homepage §1
```

Remove the copy and every one of these goes quiet on its own. Nothing has to be
un-done, and a stale-entry check reports any exception that outlives the copy it
excuses.

### Three items I would not sign off on myself

**2.1 — "No Tax Returns Required" is on the §4.1 standing prohibited list.**

This is different in kind from the other seven. §4.1 says *"continue to exclude
the following absent a separate owner/product/compliance approval"* and names it
alongside "No income required" and "Guaranteed approval". It is one of the seven
claims that list exists to keep off the site — not an unapproved phrasing of a
true thing. It is now the second line of the hero panel badge, in the first
screenful of the DFW homepage.

It was raised before the badge was built and the direction was reaffirmed. It is
built, declared, and flagged here because it is the single item on this page most
likely to matter in a mortgage-advertising review.

**2.2 — "DALLAS–FORT WORTH'S TRUSTED MORTGAGE SPECIALIST" asserts market standing.**

Also different in kind. It does not phrase something awkwardly; it claims Leahy
Lending *is* DFW's trusted specialist. Leahy Lending is an Austin company with no
DFW office, which is why the build has a dedicated DFW-presence check that this
trips.

The page's own eyebrow already reads **"DALLAS–FORT WORTH NON-QM MORTGAGE
SPECIALISTS"** — descriptive rather than possessive, visually identical in the
bar, and claiming no standing. If you want one change out of this document, this
is the cheapest one to make.

**2.3 — The testimonial names a borrower and a loan amount.**

*"I had been turned down by three banks. Leahy Lending got me into my $1.4M home
using bank statements." — Michael R., Business Owner, Texas.* §6 bars publishing
testimonials until substantiated and approved, and written permission from the
person quoted is a separate requirement from substantiation.

### One behaviour kept from §2

Your §2 had replaced exactly this sticky-bar arrangement as CTA fatigue and
required "one action only". The bar is now Austin's four-element version, visible
at load. The rule that was protecting something is kept: it still hides whenever
the scenario form is in view, so it can never cover the submit button, and a
dismissal still lasts the session.

---

# 3. The two placeholder figures supplied — and what that lifted

**Owner-supplied. Implemented in staging.**

```text
258  FIVE-STAR REVIEWS      (was [CURRENT VERIFIED])
14   STATES LICENSED        (was [CURRENT VERIFIED])
```

**This lifted a build-level block, which is why it needs your attention rather
than just your notice.** §6 required promotion to be blocked while unresolved
placeholders remained. That gate now reports zero unresolved placeholders and no
longer stops anything on that ground.

**Supplied is not substantiated.** §6 bars publishing review counts and
licensed-state counts *"until they are substantiated and approved"*. An owner
stating a number is the first of those, not the second. Both remain in
`PUBLIC-CLAIMS.md` pending evidence.

Two further notes:

- The star row had said "500+ Five-Star Reviews", carried over from the Austin
  hero. Once the real figure arrived, "500+" became a number known to be wrong
  sitting inches from a tile stating the true one. Both now read 258.
- The licensed-state figure has history: the earlier page said **19**, the Austin
  site says **14**, and the claim scanner had already flagged the disagreement.
  Jake's own words were "let's go with 14 **for now**", recorded as an explicit
  hedge rather than presented as settled.

---

# 4. Card-grid layout

**Owner-directed. Implemented in staging. No claim, copy or link changed.**

Four cards now render 1×4 instead of a 3 + 1 orphan; five render three on top and
two centred below; six stay 2×3.

A `.program-grid-4` rule already existed and had been applied by hand to the one
page whose handoff asked for it, so four other four-card grids kept the orphan. A
build pass now counts the cards in each grid and writes the matching class, so
the layout follows if a card is ever added or removed.

Measured after letting the reveal animation settle, at 1440 / 768 / 375: correct
row counts at every width, 205px of equal gap either side of the centred pair, no
horizontal overflow.

This one is purely structural and needs nothing from you.

---

# 5. What I am asking you to decide

| # | Item | Suggested resolution |
|---|---|---|
| 1 | `No Tax Returns Required` in the hero badge (§4.1 prohibited) | Approve in writing, or give replacement wording |
| 2 | `DALLAS–FORT WORTH'S TRUSTED MORTGAGE SPECIALIST` | Swap to the page's own descriptive eyebrow wording |
| 3 | The Michael R. testimonial | Confirm written permission and substantiation, or pull it |
| 4 | `WE SAY YES WHEN OTHERS SAY NO` / `LEAHY LENDING SAYS YES` | Confirm the §1.4 and §4 reversal, or pull them |
| 5 | Tenure wording, and `SINCE 2002` in the marquee | Supply the evidence, or approve a final form |
| 6 | 258 reviews and 14 states | Substantiate; resolve 19 vs 14 |
| 7 | `OVER $1 BILLION IN LOANS FUNDED` | Substantiate or pull |

Items 1–3 are the ones I would not ship to a production, indexable page without
your written answer.

---

# 6. Build state

| Control | Result |
|---|---|
| Build steps | 36, all passing |
| Overrides declared and printed each run | 9 in the shared list, 6 at builder level |
| Change-log entries | 42, each with a revert path (§7.3 fields) |
| Public claims tracked | 27 |
| Unresolved placeholders | 0 |
| Responsive | 9 pages × 3 widths, no horizontal overflow |
| Indexable pages | 0 |

Every gate was negative-tested — made to fail on purpose and confirmed to report
the right failure.

**Where "all passing" is misleading and I would rather say so:** six of those
steps pass only because the owner-directed exception list tells them to. Reading
"36 steps, all passing" as "the copy clears the rules" would be wrong, and that
is precisely the misreading this document exists to prevent.

---

# 7. Limits

> Automated content and build controls help enforce approved copy, structural
> requirements, placeholder handling, and selected prohibited phrases. They do
> not independently verify substantiation, product availability, legal
> compliance, privacy compliance, licensing requirements, testimonial
> permissions, or state-specific mortgage-advertising obligations.

A passing build is not a compliance review and must not be reported as one. That
was true when every control passed honestly. It is more true now that six of them
pass by instruction.

Nothing moves from staging/noindex to production until the items in
`LAUNCH-BLOCKERS.md` and Section 5 above are resolved by their owners.
