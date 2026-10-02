# Sitewide Audit — Method, Findings and Conclusions

**Date:** 30 September 2026
**To:** Eric Bennett
**From:** Jake Bennett / build
**Re:** Two independent audits of leahylending.com, what they agreed on, and what needs your decision

---

## 1. What was done

Two audits were run independently, by different means, and then compared against
each other.

**Perplexity** performed a public-web audit: competitor analysis, third-party
entity review, and query-level retrieval testing across Austin and DFW search
families. It tested what the outside world can see.

**This side** performed a direct production audit: every one of the 23 indexable
pages measured live for word count, heading structure, schema types, canonical
tags, robots directives, FAQ coverage and internal linking.

The two were then cross-checked against each other and against your Search
Console data. Each audit corrected the other.

---

## 2. Why the method difference matters

Perplexity's requests were intercepted by the host's bot protection, so it never
read the underlying HTML. It states this itself. The consequence was systematic:

```text
its DFW page word counts came in at roughly 45% of the real figures
three pages could not be retrieved at all
canonical tags, schema, meta directives could not be verified
```

That did not change its strategic conclusions — it made one of them stronger, as
the Austin/DFW gap is larger than it could measure. But its technical scores were
built on data it could not obtain, and have been set aside.

The direct measurements supersede them. Perplexity has accepted this.

---

## 3. What both audits concluded independently

These are the reliable findings — two different methods, same answer.

### The message problem is solved. Distribution is not.

The site now explains clearly what Leahy does and who it serves. That was the
problem six weeks ago and it is no longer the problem. Search and AI systems are
not consistently retrieving or corroborating it.

### The Austin pages are the primary gap — and they hold the audience

```text
                        Austin              DFW
words                   556 – 1,054         2,213 – 2,852
FAQ questions           0 on six of eight   5 – 7 on all nine
schema                  basic               FAQPage + FinancialService + City/State
```

Six Austin program pages have no question-and-answer content at all:
home-loans, 1099, bank-statement, RSU/bonus/commission, construction, DSCR.

Against your Search Console data:

```text
Austin homepage         9,087 impressions
every DFW page          2 – 16 impressions each
```

**The pages carrying the impressions are the thin ones.** Both audits rank
closing this first. The DFW twins already contain the FAQ content, so this is
adaptation rather than research.

### DFW is well built and unproven

Two DFW pages already rank on Google's first page — `/1099-mortgages/` at
position 3.25 and `/rsu-bonus-commission-income/` at 8. That is a genuine early
signal for a cluster with no history. But independent queries did not retrieve
it, and Bing has not indexed any of it.

### Reviews do not cause retrieval

This is the sharpest conclusion of the two audits and it is Perplexity's.

A lender must enter the candidate set before reviews matter. Competitors enter it
through exact-intent location pages, officer entities, calculators, detailed
guides and current third-party references. Reviews then help them win.

Leahy's 258 five-star reviews are a strong selection signal that is largely
unused, because the chain currently starts too late — at the evidence stage
rather than the discovery stage.

Your own data shows this precisely: **6,817 non-branded impressions producing
four clicks.** The site is being shown and not chosen.

### Off-site corroboration is the largest lever neither audit can fix on-site

```text
no sameAs anywhere on the site — nothing links the entity to its
  Google Business Profile, NMLS record or social profiles
Leahy Lending / Kyber Mortgage / Golden Empire coexist across
  LinkedIn, Expertise.com and Voyage Austin
```

This is Perplexity's strongest contribution and it is invisible from the site.

---

## 4. Where each audit was wrong, and corrected

Recorded because both corrections changed a recommendation.

**Perplexity withdrew:** its "crawl access 20/100 critical" score, its page-length
figures, its search-visibility score, the duplicate-legal-page concern (all four
are `noindex, follow` with self-canonicals), the founding-date inconsistency (the
site says "Since 2002" consistently; the discrepancy is in a third-party bio), and
its `/austin/*` URL restructure — which would have moved the pages currently
holding the impressions and history.

**This side withdrew:** a recommendation to claim the 258 reviews in
`aggregateRating` structured data. Perplexity is correct that this is against
Google's guidance — aggregate rating markup is for sites rating *other*
businesses, and self-serving use risks a manual action rather than stars. The
better implementation is a dated, platform-specific review display linked to the
live Google Business Profile.

**One earlier alarm resolved:** a report that the host was blocking AI crawlers
was escalated and then withdrawn. The challenge responses came from a
development address flagged by our own testing. Both audits now treat crawler
access as a verification item — one Search Console live test documents it — not
an emergency. Your ranking data already demonstrates Googlebot receives real
pages.

---

## 5. One finding that touches your approved scope directly

Cross-checking the two audits surfaced this, and it needs your decision because
it concerns you.

Your profile handoff bars **seller financing** and **wraparound mortgages** from
your approved Areas of Guidance. Your profile page complies — neither term
appears on it.

The `/about/` page says otherwise, in live copy:

> "As EVP of Leahy Lending, Eric specializes in creative finance and complex
> mortgage products — **including seller financing, wraparound mortgages**, and
> non-QM solutions."

Two live pages now describe your specialties differently. That is a governance
contradiction rather than a visibility issue, and it is the only item from either
audit that sits inside the boundaries you set.

Related, for context rather than decision: seller financing also appears on the
homepage and `/home-loans/`, the page your §8 excluded from scope. Those are
company-level offerings and are not attributed to you. No change is proposed to
either without your agreement to reopen that page.

---

## 6. Agreed priority

Both audits, merged and ordered by leverage:

```text
1. Expand the six thin Austin program pages to the DFW standard
   Ranked first by both audits. The content exists on the DFW twins.

2. Off-site entity corroboration
   Organization sameAs, Google Business Profile alignment, and resolving the
   Leahy / Kyber / Golden Empire fragmentation across third-party profiles.

3. Review evidence, implemented as dated and platform-specific
   Not aggregateRating markup.

4. Named officer authorship and reviewer attribution
   Your Person entity carries an NMLS identifier and is linked from five pages.
   No content page carries a byline.

5. Current Austin and DFW third-party mentions

6. Document crawler access once through Search Console, then close it

7. Fixed-query testing monthly, to measure whether any of it worked
```

Items 1 and 2 are where the movement is. Everything else supports them.

---

## 7. What is needed from you

1. **The `/about/` biography** — whether to remove seller financing and
   wraparound from your description, or to approve them and revise the profile
   governance to match. Either resolves it; leaving both live does not.
2. **Whether `/home-loans/` may be reopened**, if the seller-financing copy there
   is to be reviewed at all. Your §8 closed it and nothing has been changed.

Nothing else from either audit requires your input.

---

## 8. Timing

None of this is measurable yet. The current deployment is three days old, and the
Search Console baseline sets the first meaningful read at approximately 11
October. The Austin/DFW conversion comparison closes 4 November.

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
