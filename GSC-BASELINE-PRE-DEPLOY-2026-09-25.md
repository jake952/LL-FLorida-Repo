# Search Console Baseline — Pre-Deployment

**To:** Eric Bennett
**From:** Jake Bennett / build
**Date:** 25 September 2026
**Re:** Your §5 baseline and §6 item 9 — captured before Phase A deployment

**Source data:** Search Console exports taken 25 September 2026. Performance
covers the last 3 months, ending 23 September (GSC lags 2–3 days). Index coverage
covers 26 June – 20 September. Property: `leahylending.com`. Search type: Web.

**This measures production, which contains none of the P0 work.**

---

# 1. Headline numbers

```text
PERFORMANCE, 3 MONTHS
  clicks                171        (80 attributed to named queries)
  impressions        11,587
  average CTR          1.76% on the homepage; 1.8% US overall
  average position    12.93 (US)

COVERAGE, as of 20 September
  known URLs             79
  indexed                17
  not indexed            62

DEVICE            clicks   impressions
  desktop            119         7,651
  mobile              50         2,447
  tablet               2            15

SEARCH APPEARANCE      empty — the site currently earns no rich-result type
```

---

# 2. Branded vs non-branded — FMO's central claim, tested

FMO's audit states: *"100% of the visits Google sends you come from people
searching your name. Visits from searches for a lender, a loan type or a city:
none."*

**Measured against first-party data, that is close but not correct.**

```text
                 QUERIES   CLICKS            IMPRESSIONS
  branded             23   76  (95.0%)       423  ( 5.7%)
  non-branded        475    4  ( 5.0%)     6,968  (94.3%)
```

The four non-branded clicks:

```text
  1 click   306 imp   pos  5.99   "mortgage lender"
  1 click    17 imp   pos 33.88   "mortgage broker austin"
  1 click    11 imp   pos  3.00   "mortgage loan officer"
  1 click     3 imp   pos 21.00   "mortgage brokers in austin texas"
```

Two of those are exactly the category FMO said produced none — a lender search
and a city search. So the literal claim is wrong. **At four clicks in three
months, the substantive point stands.**

**The inverse split is the more useful finding, and FMO did not report it.**
Branded queries are 5.7% of impressions but 95% of clicks. Non-branded queries
are 94.3% of impressions and 5% of clicks. The site is being *shown* for
non-branded searches roughly 7,000 times a quarter and almost never clicked. That
is a different problem from invisibility, and it points at what the listing says
rather than whether it appears.

---

# 3. Your §5 query groups

```text
GROUP                QUERIES  CLICKS  IMPRESSIONS   LARGEST SINGLE QUERY
  self-employed           15       0           67   best mortgage lenders for 1099 employees (21)
  Bank Statement           1       0            1   bank statement loan texas (1)
  Asset Utilization        4       0           48   asset depletion mortgage lender in austin texas (35)
  No Ratio                 4       0            7   no ratio mortgage loan (4)
  DSCR                     0       0            0   — nothing at all
  investor                 3       0           16   investment property loans (8)
  Super Jumbo              7       0          122   jumbo construction loans texas (76)
  construction            34       0          301   jumbo construction loans texas (76)
  Austin                 104       2        1,619   turnkey lender austin (700)
  DFW                     16       0           60   10/99 loan in weatherford (35)
  Texas                   63       1          600   cash out refinance texas rates (93)
```

**Every product group is at zero clicks.** DSCR returns no query at all. Bank
Statement has a single impression across three months. These are the approaches
the business specializes in.

Austin has real volume — 1,619 impressions — but 700 of those come from a single
query, `turnkey lender austin`, at average position 45. That is a brand search
for a different company, not demand for Leahy Lending.

---

# 4. Duplicate hosts — a live condition, and a gap in the deployment package

**Both hosts serve 200 with no redirect between them. Verified live today:**

```text
  https://leahylending.com/            200
  https://www.leahylending.com/        200      ← same content, no redirect
  http://www.leahylending.com/         301 →  https://www.leahylending.com/
  https://www.leahylending.com/contact 200
  https://leahylending.com/contact/    200
```

Google has indexed both forms, and Search Console shows the split:

```text
  https://leahylending.com          15 urls    168 clicks    9,874 impressions
  https://www.leahylending.com       6 urls      3 clicks    1,711 impressions
  http://www.leahylending.com        1 url       0 clicks        2 impressions

  THE SAME PAGE UNDER TWO ADDRESSES
    /contact
      https://www.leahylending.com/contact      2 clicks    525 impressions
      https://leahylending.com/contact/         3 clicks    239 impressions
```

The `www` copy of `/contact` earns **more than twice the impressions** of the
canonical one. About 15% of all impressions land on `www` URLs.

**What the P0 package does and does not fix.** Every canonical tag in the build
declares the non-www form, which is a strong signal and should help Google
consolidate. But **there is no `www` → non-www 301 in `.htaccess`**, so after
deployment the `www` addresses will still return 200.

**I have not added one.** Your prior direction was explicit that no redirect is
created or altered in P0, and this would be a new redirect rule affecting every
URL on the site. It is raised here as a finding for a separate decision, not
actioned.

Also noted: the "Force HTTPS" block in `.htaccess` is commented out, with a note
to enable it after activating SSL. SSL is plainly active and `http://` already
301s to `https://`, so that block appears redundant rather than pending. No
change made.

---

# 5. An anomaly I cannot explain from this data

Several generic head terms show a strong average position, substantial
impressions and **zero clicks**:

```text
  1,244 imp   pos  2.73   "home loans"
    293 imp   pos  1.71   "home lenders"
    201 imp   pos  1.12   "mortgage loans near me"
    198 imp   pos  1.00   "mortgage lenders near me"
    167 imp   pos  1.00   "portfolio loan"
    133 imp   pos  1.00   "home lenders near me"
    115 imp   pos  1.00   "mortgages near me"
    111 imp   pos  1.00   "mortgage pre approval"
     96 imp   pos  1.00   "non recourse mortgage lenders"
```

Position 1 across 198 impressions with no clicks is not normal organic behavior.
The Search Appearance export is empty, so GSC records no special result type that
would explain it. Possible causes include map-pack or Business Profile
impressions being attributed here, or appearances inside a SERP feature that is
rarely clicked. **I am not going to guess at which.** It is worth one session in
the Search Console UI filtering by search appearance and comparing the web-only
figures before anyone draws conclusions from these numbers — including any
conclusion an agency might draw.

---

# 6. Coverage detail

```text
  31  Soft 404                                  Website
  11  Discovered – currently not indexed        Google systems
   8  Alternate page with proper canonical tag  Website
   5  Not found (404)                           Website
   3  Excluded by 'noindex' tag                 Website
   2  Page with redirect                        Website
   2  Crawled – currently not indexed           Google systems
  --
  62  total
```

**The 31 soft 404s are the retired WordPress site**, not current product pages.
Verified earlier by fetching them: `/blog/`, `/services/`, `/project/`,
`/author/leahylending/`, `/calculators/`, `/loan-officers/`,
`/leadership-team/`, `/wp-content/uploads/*.pdf`. Each returns a 404 status with
the homepage as the response body. Most were crawled while the server still
returned 200 for everything, so much of this is historical and should clear on
Validate Fix rather than needing new content.

Two conditions in that list are genuinely still live and are addressed by the P0
`.htaccess`: `/index.html` serving 200 as a duplicate of the homepage, and 404s
returning the full homepage document instead of a small error page.

**Coverage percentage is not a useful health metric here**, because a large share
of the 62 not-indexed URLs are retired routes that should stay out. The number
worth tracking is **17 indexed against the 23 pages P0 intends to be indexable.**

Indexed count over the period ranged 1 to 17. Two events stand out: a collapse on
17 August (7 → 1 indexed, not-indexed 56 → 72), and a rise on 18 September
(7 → 17) that coincides with URLs being submitted manually for indexing.

---

# 7. What to re-measure, and when

Re-run at 2, 4, 8 and 12 weeks after the recorded deploy timestamp. The
extraction script is saved so each run is directly comparable.

```text
PRIMARY
  indexed count, against the 23 intended-indexable pages
  non-branded clicks — currently 4 per quarter
  clicks and impressions for the DSCR, Bank Statement, Asset Utilization and
    No Ratio groups — currently 0 clicks, 56 impressions combined
  www vs non-www impression split — currently 15% on www
  Search Appearance — currently empty; FAQ rich results would show here

SECONDARY
  soft 404 count after Validate Fix on the retired WordPress routes
  /index.html and the directory duplicates disappearing from the indexed set
  average position on the product query groups

NOT A SUCCESS MEASURE
  total impressions. They are dominated by generic head terms that convert at
  roughly zero, and one competitor's brand name.
```

---

## What this document does not say

This is a measurement record, not a forecast. No claim is made that deploying
P0, building the guide layer, or engaging an agency will change any figure in it.
The FMO audit's findings are theirs; the figures here are first-party Search
Console data and disagree with FMO's branded-traffic claim in the detail set out
in §2.

Automated content and build controls help enforce approved copy, structural
requirements, placeholder handling, and selected prohibited phrases. They do not
independently verify substantiation, product availability, legal compliance,
privacy compliance, licensing requirements, testimonial permissions, or
state-specific mortgage-advertising obligations.
