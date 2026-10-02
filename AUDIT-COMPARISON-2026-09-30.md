# Audit Comparison — Perplexity vs Direct Measurement

**Date:** 30 September 2026
**Comparing:** Perplexity's public-web audit against measurements taken directly from production
**Prepared for:** Jake Bennett

---

## Summary

Perplexity's audit is substantially right about **strategy** and substantially
unreliable about **the site's technical state** — for a reason they state
themselves: their requests were challenged, so they never read the HTML.

Their strongest contribution is the off-site work I could not do: competitor
architecture, third-party entity fragmentation, and query-level retrieval
testing. Their weakest is every score derived from data they could not retrieve.

One finding emerged only from cross-checking the two, in §5.

---

## 1. Where we independently agree

These conclusions hold from both directions, which makes them the reliable ones:

```text
Austin program pages are thin and are the weak point
The DFW cluster is well built and not yet retrieving
Entity corroboration (sameAs / third-party) is the main off-site gap
Reviews alone do not produce category retrieval
Thin legacy pages compete with richer pages
The message problem is largely solved; distribution is not
```

My measurement, their conclusion, same answer. Where an audit reaches a
conclusion twice by different routes, it is worth acting on.

---

## 2. Where their audit is not reliable, and why

Perplexity states plainly: *"the audit environment could not retrieve the actual
contents of robots.txt, /sitemap.xml, or /wp-sitemap.xml; each direct request was
challenged"* and *"this audit could not independently validate canonical tags,
meta robots directives, meta descriptions, Open Graph tags, JSON-LD validity..."*

Everything downstream of that inherits the limitation.

### Their word counts are roughly half the real figures

| Page | Perplexity | Measured |
|---|---|---|
| Homepage | 765 | **1,386** |
| /bank-statement-loans/ | 361 | **762** |
| /1099-mortgage-loans/ | 421 | **666** |
| /construction-loans/ | ~300 | **556** |
| /dscr-investor-loans/ | 654 | **865** |
| DFW self-employed | 1,304 | **2,852** |
| DFW 1099 | 915 | **2,409** |
| DFW bank statement | 1,094 | **2,291** |
| DFW No Ratio | 1,035 | **2,321** |
| DFW Super Jumbo | 1,098 | **2,416** |

On DFW pages they captured roughly **45%** of the actual content.

**This makes their central strategic point stronger, not weaker.** The Austin/DFW
asymmetry they identified is larger than they measured: DFW pages are 2,200–2,850
words, not 900–1,300.

### Pages they could not retrieve at all

```text
/bonus-commission-rsu-income-mortgage/     "Challenge encountered"
/texas/dallas-fort-worth/dscr-investor-loans/   "Challenge encountered"
/texas/dallas-fort-worth/contact/          "Challenge encountered"
```

All three return HTTP 200 with full content when measured directly.

### Scores that rest on unretrieved data

| Their score | Basis | Direct measurement |
|---|---|---|
| **Crawl/access 20/100 "Critical"** | Their own requests were challenged | Google has 17 pages indexed with DFW pages at **positions 3.25 and 8**; Bing has 10 paths. A page cannot rank at 3.25 if the crawler receives a captcha. |
| **Search-index visibility 28/100** | One provider's site-restricted results | Google Search Console shows 17 indexed and 9 DFW pages carrying impressions |
| Metadata/schema "could not be verified" | Blocked | 23/23 self-canonical, 23/23 `index, follow`, FAQPage on 12 pages, all measured |

**Their crawl-access finding is the one already settled.** You confirmed with them
that the original "AI blocked" conclusion was incorrect research. Their revised
wording — *"does not prove verified crawlers are blocked"* — is the corrected
position, not a new alarm.

### Concerns already handled that they flagged as open

```text
"Duplicate legal pages should be canonicalized or consolidated"
  -> /privacy/, /terms/ and the DFW twins are ALL noindex, follow with
     self-referencing canonicals. No duplicate-content exposure exists.

"Founding-date inconsistency, 2002 vs 2006"
  -> the site says "Since 2002" consistently on /, /about/, /texas/ and
     /contact/. No 2006 anywhere. The inconsistency is in a third-party bio,
     not on the site.

"Golden Empire Mortgage legacy entity"
  -> zero occurrences on /about/. Kyber appears 4 times. Again a third-party
     profile issue, not a site issue.
```

Each of those is still worth fixing **off-site**. None is a site defect.

---

## 3. Where they are right and my audit was wrong

**`aggregateRating`.** I recommended claiming the 258 Google reviews in structured
data. Perplexity is correct that this is against Google's guidance: aggregate
rating markup is intended for sites publishing reviews *about other businesses*,
not for a business rating itself. Self-serving `aggregateRating` risks a manual
action rather than stars.

Their alternative is better and I withdraw my recommendation in favour of it:

```text
Link "Google reviews" directly to the live Google Business Profile
Display "5.0 Google rating based on 258 reviews as of [month year]"
Keep Google, Yelp and Zillow separate rather than combined
```

---

## 4. What they contributed that I could not

Genuinely valuable, and outside what any on-site audit can produce:

**Competitive architecture.** LendFriend has exact Austin *and* Dallas
bank-statement pages with suburb coverage, documentation periods, expense-factor
process, and a bank-statement calculator. Adam Styer has person-level entity
signals, author attribution, and exact-intent pages. That is a concrete
description of what the candidate set looks like.

**Third-party entity fragmentation.** Leahy Lending / Kyber Mortgage / Golden
Empire coexisting across LinkedIn, Expertise.com and Voyage Austin. Real, and
invisible from the site.

**Query-level retrieval testing.** Nine query families with named competitors
retrieved ahead. I could not produce this — Google blocks automated queries.

**The retrieval-chain framing** is the sharpest idea in their audit: a lender must
enter the candidate set *before* reviews matter, and Leahy's chain currently
starts too late, at "review and longevity evidence."

---

## 5. A finding neither audit made alone

Cross-checking surfaced this.

Perplexity lists **seller financing** among Leahy's programs. Eric's profile
handoff (§6) explicitly **bars** "Seller financing" and "Wraparound mortgages"
from his approved Areas of Guidance, and his earlier §8 excluded seller financing
from scope entirely.

Both appear in live visible copy:

```text
/          "Our DSCR loans, 2nd lien cash-outs, and seller financing
            solutions are unmatched."
/          "Seller Financing (MORE) — Don't drop your price, outsmart the market."
/home-loans/  "Seller Financing (MORE Platform) — Exclusive"
/about/    "Eric specializes in creative finance and complex mortgage products —
            including seller financing, wraparound mortgages, and non-QM solutions."
```

Three separate issues:

1. **The `/about/` bio contradicts Eric's approved profile.** His profile may not
   list seller financing or wraparound as areas of guidance; `/about/` says he
   specializes in exactly those two.
2. **"unmatched" and "Exclusive" are superlatives**, which Eric's §1.4 barred from
   new page copy. These are pre-existing, so not a breach of that instruction —
   but they are the claim type he has been tightening.
3. **The "MORE platform" is named as a product** on two pages. Whether that name
   and its positioning are approved is unknown to me.

Perplexity treated seller financing as an asset to promote. Eric has been
steering away from it. Those two positions need reconciling before either audit's
recommendations are acted on.

---

## 6. Where their recommendations conflict with your constraints

**`/austin/*` URL structure.** They recommend ten new pages under `/austin/`.
Your Austin program pages currently live at root (`/bank-statement-loans/`), and
those are the URLs holding your impressions and history. Moving them means
redirects and losing accrued signal; adding `/austin/` versions alongside creates
the near-duplicate canonical contest that `/texas/dallas-fort-worth/` is already
held back to avoid.

**Expanding the existing root pages is the lower-risk route to the same outcome**
and keeps the history. Their content recommendations are right; the URL
restructure is the expensive way to get there.

**City-level pages** for Plano, Frisco, Southlake and so on — they caveat this
themselves. Your standing rule is that no business location or service area may
be invented. City pages must reflect genuine licensed service relevance.

---

## 7. Combined priority

Where both audits agree, ordered by value:

```text
1. Bring the six thin Austin program pages up to the DFW standard
   Both audits identify this as the primary gap. The DFW twins already
   contain the FAQ and depth — adapting it is copy work, not research.

2. Off-site entity work
   Organization sameAs, Google Business Profile alignment, resolving the
   Kyber / Golden Empire fragmentation across third-party profiles.
   Perplexity's strongest contribution; nothing on-site addresses it.

3. Review evidence, implemented their way
   Dated, linked, per-platform. Not aggregateRating markup.

4. Reconcile the seller-financing position (§5) before acting on either audit

5. Author attribution — Eric's Person entity is linked from five pages and
   no content page carries a byline
```

**Not urgent:** crawl access. Ranking data already demonstrates Googlebot and
Bingbot receive real HTML. A Search Console URL Inspection live test closes it
definitively in two minutes if you want it documented.

---

## 8. Honest note on both audits

Perplexity's environment was blocked and it produced confident scores anyway —
including a "Critical 20/100" for crawl access derived entirely from its own
blocked requests.

My audit had the opposite exposure: I measured the site accurately and cannot
see the competitive or off-site picture at all. My recommendation to claim
reviews in structured data was wrong, and their correction is right.

**The overlap is where to act.** Both audits, reached independently, say the same
thing: the Austin pages are thin, the DFW cluster is strong but unproven, and the
gap is corroboration rather than content.

---

*Kyber Mortgage Corporation dba Leahy Lending · NMLS 2653540*
