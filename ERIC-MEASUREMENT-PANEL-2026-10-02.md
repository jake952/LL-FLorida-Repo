# Measurement Panel

**Generated:** 2026-10-02
**Panel:** 12 queries x 6 platforms = 72 observations per market

---

## Why it is fixed

Both earlier audits chose their queries as they went, which is why they
disagreed about things that should not have been in dispute. The value of this
panel is that it does not change: the question is never "did Leahy appear", it
is "did Leahy appear more often than last time, for the same eleven questions,
on the same six surfaces".

Run each query in a **fresh session**, more than once. One favourable answer is
not a result — repeated inclusion in the candidate set is.

Record the query exactly as written. A prompt reworded to match our own page
proves only that the page exists, and the `broad_or_mirrored` column exists to
catch that happening by accident.

---

## The queries

### Austin

```text
q01  best mortgage lender for self-employed borrowers in Austin
q02  bank statement mortgage lender Austin
q03  non-QM mortgage lender Austin
q04  mortgage when tax returns understate my income Austin
q05  business write-offs reduced my income can I still get a mortgage Austin
q06  mortgage for someone with multiple businesses Austin
q07  profit and loss statement mortgage Austin
q08  1099 income mortgage Austin
q09  asset utilization mortgage Austin
q10  DSCR loan for investment property Austin
q11  super jumbo mortgage with complex income Austin
q12  Austin mortgage expert for K-1 income and distributions
```

### Dallas–Fort Worth

```text
q01  best mortgage lender for self-employed borrowers in Dallas Fort Worth
q02  bank statement mortgage lender Dallas Fort Worth
q03  non-QM mortgage lender Dallas Fort Worth
q04  mortgage when tax returns understate my income Dallas Fort Worth
q05  business write-offs reduced my income can I still get a mortgage Dallas Fort Worth
q06  mortgage for someone with multiple businesses Dallas Fort Worth
q07  profit and loss statement mortgage Dallas Fort Worth
q08  1099 income mortgage Dallas Fort Worth
q09  asset utilization mortgage Dallas Fort Worth
q10  DSCR loan for investment property Dallas Fort Worth
q11  super jumbo mortgage with complex income Dallas Fort Worth
q12  Dallas Fort Worth mortgage expert for K-1 income and distributions
```

### Florida

```text
q01  best mortgage lender for self-employed borrowers in Florida
q02  bank statement mortgage lender Florida
q03  non-QM mortgage lender Florida
q04  mortgage when tax returns understate my income Florida
q05  business write-offs reduced my income can I still get a mortgage Florida
q06  mortgage for someone with multiple businesses Florida
q07  profit and loss statement mortgage Florida
q08  1099 income mortgage Florida
q09  asset utilization mortgage Florida
q10  DSCR loan for investment property Florida
q11  super jumbo mortgage with complex income Florida
q12  Florida mortgage expert for K-1 income and distributions
```

## The platforms

```text
google      Google organic
google-ai   Google AI results
chatgpt     ChatGPT search
perplexity  Perplexity
copilot     Microsoft Copilot / Bing
claude      Claude web search
```

Google organic and Google AI are one page and two surfaces. Record them
separately — they answer differently and cite differently.

---

## Maturity, per market

Scored from the run, not from impression counts. Each level names a different
thing to fix, which a single score would not.

```text
0  Absent                  no meaningful pages or retrieval
1  Eligible                pages exist, are crawlable, and are indexed
2  Exact-intent            surfaces for highly specific product and market queries
3  Category                surfaces for broad bank-statement, non-QM or self-employed queries
4  Recommended             frequently enters unbranded lender recommendation lists
5  Corroborated authority  frequently recommended and supported by first- and third-party citations
```

**Where each market should be starting.** Austin is strong on brand and weak on
category queries. DFW shows exact-intent visibility on two pages. Florida has no
history at all, which is exactly what makes it the clean test — so a baseline
run taken *before* anything is published is worth more than one taken after.

---

## Checkpoints

Counted from the day a market goes live: day 7, day 14, day 30, day 60, day 90.

Austin is the control until 4 November 2026 and should be measured but not
changed. Running the panel does not alter a page, so measuring it now is safe.

---

## Recording

One blank row per observation is already generated:

```text
measurement/austin-2026-10-02.csv          72 rows
measurement/dfw-2026-10-02.csv          72 rows
measurement/florida-2026-10-02.csv          72 rows
```

Every column matters for comparability, but three are the ones usually left
blank and most worth having:

- `stated_rationale` — why the model said it chose what it chose. This is the
  only direct evidence of what would need to change.
- `competitor_urls_cited` — which specific page won. More useful than the
  competitor name.
- `evidence` — a screenshot or saved output. A result nobody can re-read is a
  memory, not a measurement.

---

*Kyber Mortgage Corporation dba Leahy Lending · NMLS 2653540*
