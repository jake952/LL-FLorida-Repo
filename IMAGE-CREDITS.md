# Image credits and licenses

Provenance for every photograph in `assets/img/`. Keep this current: it is the
record that the imagery on a page carrying an NMLS ID is licensed for the use it
is being put to.

## Added 6 September 2026 — program hero photographs

Six photographs from [Unsplash](https://unsplash.com), each licensed under the
[Unsplash License](https://unsplash.com/license), which grants an irrevocable,
non-exclusive, worldwide copyright license to use the photograph free of charge,
**including commercially, with no attribution required**. Attribution is recorded
here anyway, because a provenance trail is worth more than the license requires.

Fetched from the Unsplash image CDN as WebP at 1920×1080 — no local re-encoding,
so nothing has been degraded twice.

| File | Page | Photographer | Source | Size |
|---|---|---|---|---|
| `hero-bank-statement.webp` | bank-statement-mortgages | Anastassia Anufrieva ([@antoie](https://unsplash.com/@antoie)) | [photo](https://unsplash.com/photos/a-woman-sitting-at-a-table-reading-a-paper-ecHGTPfjNfA) | 72 KB |
| `hero-1099.webp` | 1099-mortgages | Craft Kitties ([@craftkitties](https://unsplash.com/@craftkitties)) | [photo](https://unsplash.com/photos/person-marking-wooden-board-with-pencil-GfYA6q5ESLI) | 179 KB |
| `hero-home-loans.webp` | home-loans | Bailey Alexander ([@baileyal3xander](https://unsplash.com/@baileyal3xander)) | [photo](https://unsplash.com/photos/a-man-working-on-a-piece-of-wood-DfffcjQ106U) | 238 KB |
| `hero-dscr-investor.webp` | dscr-investor-mortgages | Vincent Vanden bossche ([@vinnyvici](https://unsplash.com/@vinnyvici)) | [photo](https://unsplash.com/photos/a-row-of-houses-_0GOO-BKqE8) | 172 KB |
| `hero-construction.webp` | construction-loans | Troy Mortier ([@troyscanon](https://unsplash.com/@troyscanon)) | [photo](https://unsplash.com/photos/a-house-under-construction-with-wooden-framing-kkdfOe0iRu8) | 279 KB |
| `hero-rsu-bonus.webp` | rsu-bonus-commission-mortgages | Fer Troulik ([@fertroulik](https://unsplash.com/@fertroulik)) | [photo](https://unsplash.com/photos/modern-office-interior-with-glass-walls-and-reflections-lIipHR8mi3o) | 191 KB |

### Two things worth knowing about the license

**It does not include model or property releases.** The Unsplash License covers
the photographer's copyright; it does not warrant that identifiable people or
private property in a photograph have consented to appear in an advertisement.
Two of the six contain a person:

- `hero-bank-statement.webp` — hands and documents only, no face visible. Low risk.
- `hero-home-loans.webp` — a man at a workbench, face partly visible.

For a regulated advertiser this is a residual right-of-publicity question rather
than a copyright one. The practice is common and the exposure is small.

**On 6 September 2026 the photograph with a visible face was moved off the 1099
page and onto home-loans**, and the 1099 page took a faceless replacement
(hands marking a board). Worth being precise about what that did and did not
achieve: it relocated the exposure, it did not remove it. The same image is
still published on the site, on a page that gets more traffic than the one it
left. If the intent was to carry none of this risk, that photograph has to come
off the site altogether — there are people-free alternatives in the same search,
and swapping it is a ten-minute job.

**No recognizable Dallas–Fort Worth location appears in any of them**, by
instruction. The copy has never claimed a DFW office — Eric's rules bar inventing
business locations — so the imagery must not imply one. Anything showing an
identifiable Dallas or Fort Worth landmark would need his sign-off first.

## Now serving both markets (7 September 2026)

Each photograph below is used on its DFW page **and** on the matching Austin
page. Austin previously shared two images across six product pages — a house at
dusk on the bank-statement and construction pages, one portrait across 1099,
self-employed and RSU, and the Austin skyline on the DSCR investor page. Since
the DFW work had already sourced a photograph per product, the Austin pages take
the one that matches their product rather than five more being licensed.

| Photograph | DFW page | Austin page |
|---|---|---|
| `hero-bank-statement.webp` | bank-statement-mortgages | `/bank-statement-loans` |
| `hero-1099.webp` | 1099-mortgages | `/1099-mortgage-loans` |
| `hero-dscr-investor.webp` | dscr-investor-mortgages | `/dscr-investor-loans` |
| `hero-construction.webp` | construction-loans | `/construction-loans` |
| `hero-rsu-bonus.webp` | rsu-bonus-commission-mortgages | `/bonus-commission-rsu-income-mortgage` |

Two Austin pages keep what they had, deliberately:
`/self-employed-mortgage-loans` keeps `self-employed-professional.webp` (it is
the self-employed portrait), and `/home-loans` keeps `hero-home.webp` (a house
suits a home-loans hub).

A visitor sees one market, so a photograph used once in each is not repetition as
anyone experiences it — `check-images.js` counts per market for that reason. If
the two markets should look visually distinct instead, that needs five new
photographs and is a separate job.

Contrast was re-measured under the Austin hero gradient, which is lighter than
the DFW one (`from-[#0A1628]/90 via-/70 to-transparent` against DFW's
`.94/.78/.32`). Worst-case white-on-ground contrast across all seven Austin
heroes is 8.1:1, against WCAG AA's 4.5.

## Added 8 September 2026 — closing-CTA background

One photograph from [Unsplash](https://unsplash.com) under the same
[Unsplash License](https://unsplash.com/license) as the program heroes above.

| File | Page | Photographer | Source | Size |
|---|---|---|---|---|
| `suburban-neighborhood-aerial.webp` | market home (closing CTA) | Ahnaf Tahsin ([@_ahnaf_rafi__](https://unsplash.com/@_ahnaf_rafi__)) | [photo](https://unsplash.com/photos/aerial-view-of-a-suburban-neighborhood-with-winding-streets-CNV8ytt7WD8) | 288 KB |

**Encoded smaller than the heroes, deliberately.** Fetched at 1600×900 and
quality 40 rather than 1920×1080 at 78. It is a full-bleed background behind a
flat `bg-[#0A1628]/80` overlay, so roughly a fifth of it is visible and none of
the detail survives the wash; at hero settings the same frame came to 803 KB,
because aerial foliage and roof texture compress badly. The shipped version was
compared against a quality-90 render under the real overlay and is
indistinguishable. 288 KB is also below the 300 KB of the file it replaces, so the
page got lighter rather than heavier.

**No release needed.** Photographed from above at a distance: no identifiable
people, no legible signage, no house presented as a subject. The frame is a
subdivision, not a property.

**It makes no location claim.** The photograph was taken in San Antonio, so it
is a real Texas subdivision — but nothing in it is identifiable, which is the
point. The alt text is "Aerial view of a suburban neighborhood of detached
homes": it names no market, because naming Dallas–Fort Worth would be inventing
a location, and Eric's rules bar DFW in closing-CTA language in any case.

**What it replaced, and why.** `austin-skyline-home.webp`, which despite its
filename contains no skyline: it is an aerial of waterfront estates on the Lake
Austin corridor, stone-and-tile houses with infinity pools. Three problems, and
only the first was about geography. It was Austin imagery on the one page whose
job is to read as Dallas–Fort Worth. It repeated the about-page hero. And the
price tier implied a product bracket nobody approved — multi-million-dollar
waterfront estates behind "Your Tax Returns Shouldn't Define Your Dreams" is
the kind of universal-product implication the copy rules bar in words, made in
a photograph instead, and it is badly matched to a self-employed
bank-statement audience.

## Added 14 September 2026 — No Ratio and Super Jumbo heroes

Two photographs from [Unsplash](https://unsplash.com) under the
[Unsplash License](https://unsplash.com/license), same free pool as
`suburban-neighborhood-aerial.webp`.

| File | Page | Source | Size |
|---|---|---|---|
| `hero-no-ratio.webp` | no-ratio-mortgages | [photo](https://unsplash.com/photos/aerial-view-of-a-suburban-neighborhood-with-a-road-6e86cd08053e) | 299 KB |
| `hero-super-jumbo.webp` | super-jumbo-mortgages | [photo](https://unsplash.com/photos/aerial-view-of-a-suburban-neighborhood-with-houses-and-streets-d1192cac9642) | 260 KB |

**Why aerials rather than a house.** A photograph of one specific home beside
mortgage copy can read as a property we were involved with — an implied outcome
claim nobody substantiated, and the same class of problem as the price tier
flagged in COPY-REVIEW.md section 4. An aerial of a subdivision gives context
without pointing at an address. It also avoids repeating the four
house-and-property photographs already on the site.

**Photographer names still to be recorded.** Unsplash renders the credit panel
in a way that returned empty to every extraction method tried, so the handles
were captured but not the display names. The licence is the free Unsplash
License — the same search pool and the same page pattern as the verified
`suburban-neighborhood-aerial.webp` entry above — but the attribution line
should be completed before launch, alongside the five pre-existing images whose
provenance is already outstanding.

## Pre-existing images — provenance not recorded

These were in the project before this record began. **Their licenses are
undocumented**, which is a gap worth closing before launch: if any came from a
source that does not permit commercial use, it is on a page carrying an NMLS ID.

| File | Used on | Size |
|---|---|---|
| `hero-home.webp` | home-loans, market home | 249 KB |
| `self-employed-professional.webp` | self-employed-mortgages | 105 KB |
| `austin-skyline-home.webp` | about | 300 KB |
| `consultation-meeting.webp` | about | 145 KB |
| `og-leahylending.jpg` | social preview, all 14 pages | 182 KB |
| `team-ryan-leahy.png` | about | 279 KB |
| `team-eric-bennett.png` | about | 179 KB |
| `team-james-bonacci.png` | about | 191 KB |
| `team-lacey-misch.jpg` | about | 115 KB |

The four team photographs came out of the compiled React bundle, so they are
Leahy Lending's own and need no external license. The other five are unaccounted
for — someone who was there when the Austin site was built should confirm where
they came from.

## Still repetitive

- **`og-leahylending.jpg` is the social preview on all 14 pages.** Every link
  shared from any DFW page shows the same card. Per-page social images would need
  fourteen composed graphics — a design job rather than a stock search.
- ~~**`austin-skyline-home.webp` is on the DFW market home.**~~ **Resolved
  8 September 2026.** It was an odd choice on a DFW-targeted page against a
  brief that avoids recognizable locations, and on closer look the photograph
  also implied a price tier nobody approved. The market home now uses
  `suburban-neighborhood-aerial.webp`; the file stays on the about page, where
  Austin imagery belongs, and stays in `assets/img/` regardless because the
  compiled React bundle references it.
- **`hero-home.webp` is now on the market home alone.** home-loans moved to
  `hero-home-loans.webp` on 6 September 2026, so no photograph on the DFW suite
  carries more than one page except where it is deliberate. Note that this file
  is NOT shipped in the upload: the host already has it at 1,050,174 bytes
  against our 255,428, and overwriting a live Austin asset is outside what this
  work is authorized to touch.
