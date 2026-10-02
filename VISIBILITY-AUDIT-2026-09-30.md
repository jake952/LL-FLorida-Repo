# Sitewide Visibility Audit — Search and AI Retrieval

**Date:** 30 September 2026
**Scope:** leahylending.com, all 23 indexable pages, audited live against production
**Prepared for:** Jake Bennett

---

## What this audit can and cannot tell you

**Can:** the technical and content state that determines whether the site is
*eligible* to surface, measured page by page against production.

**Cannot:** where you rank, or whether AI engines cite you. Google blocks
automated queries, and ChatGPT and Perplexity cannot be queried programmatically
from here. Ranking data comes from Search Console; your last export predates
these changes.

So: this establishes what you have built. It does not establish what it has
earned yet, and two days after deployment nothing could.

---

## 1. The headline finding

**The content investment is inverted against the traffic.**

| | Austin pages | DFW pages |
|---|---|---|
| Words | 556 – 1,054 | 2,213 – 2,852 |
| H2 sections | 2 – 4 | 6 – 8 |
| FAQ questions | 0 on six of eight | 5 – 7 on all nine |
| Schema | MortgageLender + PostalAddress | WebPage + FinancialService + FAQPage + City/State |

Set that against your own Search Console data:

```text
Austin homepage        9,087 impressions
Austin /about/            200
Austin /contact/          195
every DFW page          2 – 16 impressions each, 98 combined
```

**The pages carrying essentially all the impressions are the thin ones. The
richly built pages have almost no impressions.**

That is not a defect — the DFW cluster is new and has no history. But it means
the recent build effort went almost entirely to pages with roughly 1% of the
site's search exposure, while the pages actually competing for non-branded
queries were left at 556–1,054 words with no FAQ content.

---

## 2. Six Austin pages have no FAQ content at all

```text
/home-loans/                             694 words   0 FAQ
/1099-mortgage-loans/                    666 words   0 FAQ
/bank-statement-loans/                   762 words   0 FAQ
/bonus-commission-rsu-income-mortgage/   679 words   0 FAQ
/construction-loans/                     556 words   0 FAQ
/dscr-investor-loans/                    865 words   0 FAQ

/self-employed-mortgage-loans/         1,054 words   6 FAQ   [x]
/how-self-employed-borrowers-qualify/    852 words   5 FAQ   [x]
```

This was checked properly: there is no case of FAQ content present without
schema. The six pages genuinely have no question-and-answer content.

**Why it matters more than page length.** Your Search Console export shows the
site already appearing for question-shaped queries — 32 of them, including "who
provides investor construction loans with flexible draw schedules?" and "are
there specific austin brokers known for navigating complex mortgage situations
effectively?" Those are the retrieval surface AI assistants draw from, and they
are answered on the DFW pages and on two Austin pages. The six above are silent.

The DFW twins of five of these pages already carry 5–7 FAQs each. The content
exists; it has not been adapted to the Austin pages.

---

## 3. Entity signals are thin

What is present:

```text
MortgageLender schema on every Austin page
FinancialService + City/State on DFW pages
Person schema for Eric, with NMLS identifier 288376
areaServed declared
NAP consistent phone per market
```

What is absent:

```text
sameAs            no external profile corroboration anywhere on the site
aggregateRating   258 Google reviews exist and are not claimed in schema
openingHours      hours are displayed as text, not marked up
geo               no coordinates
author bylines    no content page attributes authorship to Eric
```

**`sameAs` is the significant one.** It is how a search or answer engine
corroborates that your entity is the same entity as your Google Business
Profile, your NMLS record, and your social profiles. Without it, each source is
an independent unverified claim. For a lender competing on trust, that is the
cheapest credibility signal available and it is currently empty.

**Eric's profile is linked from five pages** — the homepage, `/about/`, two
Austin program pages, and one DFW page. For an author-authority signal that is
light. No content page carries a byline or "reviewed by" attribution.

*Note: `sameAs` was deliberately excluded from Eric's Person schema by his own
handoff. That instruction was specific to his profile. It does not cover
Organization-level `sameAs` on the homepage, which is a separate question and
currently unaddressed.*

---

## 4. Index coverage — what is actually in each index

**Google** (from your Search Console export, pre-deploy):

```text
23 sitemap URLs · 17 indexed · 62 not indexed of 79 known
DFW pages ARE present — 9 of them carrying impressions, two on page one
  /texas/dallas-fort-worth/1099-mortgages/           position 3.25
  /texas/dallas-fort-worth/rsu-bonus-commission/     position 8
```

**Bing / DuckDuckGo** (checked live today):

```text
10 paths visible · ZERO DFW program pages · only /texas/ from that cluster
```

So Google has discovered the DFW cluster and Bing has not. Bing also still lists
two retired WordPress URLs — `/category/uncategorized/` and
`/project_category/calculators/`. Both correctly return 404, so they will drop
out on their own. No action needed.

---

## 5. Technical foundation — sound

Nothing here is blocking anything.

```text
23 / 23 pages          HTTP 200
23 / 23                self-referencing canonical
23 / 23                index, follow
0                      internal links that redirect
robots.txt             User-agent: *  Allow: /   nothing blocked
sitemap.xml            23 URLs, current
FAQ answers            present in raw HTML, readable without JavaScript
asset versioning       live, so returning visitors get current files
```

The FAQ point matters for AI retrieval specifically: most AI crawlers do not
execute JavaScript, and your answers are in the served HTML rather than injected
at runtime. That was worth getting right and it is right.

---

## 6. Smaller items worth fixing

```text
/contact/                          title 23 chars — too thin to describe the page
/loan-officers/eric-bennett/       title 28 chars; meta description 251 chars, truncates
/texas/dallas-fort-worth/rsu-...   title 88 chars, truncates in results
/texas/                            meta description 229 chars, truncates
schema streetAddress               "Ste 390" on Austin, "Suite 390" on DFW
```

The address inconsistency is small but it is exactly the kind of mismatch local
search uses to decide whether two references describe the same business.

---

## 7. What would move the needle, in order

**1. Bring the six Austin pages up to the DFW standard.** They hold the
impressions and they are the weakest assets on the site. Their DFW twins already
contain the FAQ content — adapting it is copy work, not research. This is the
single highest-value item and it is not close.

**2. Add Organization-level `sameAs`.** Google Business Profile, NMLS Consumer
Access, and any social profiles. Cheap, one-time, and it is the main entity
corroboration you currently lack.

**3. Claim the review signal.** 258 Google reviews at 5.0 are real and unclaimed
in structured data. This needs approval before implementation — review markup has
specific rules and Eric has been explicit about rating claims.

**4. Author attribution.** Eric has a Person entity with an NMLS identifier and
almost nothing links to it. Bylines or "reviewed by" on the program pages would
connect the content to a credentialed person.

**5. Mark up hours and location** — displayed as text today. Requires approved
data only; no values should be invented.

---

## 8. Honest read on where you stand

**The foundation is genuinely good.** Crawlable, indexable, structured, fast to
correct, with no technical barrier to retrieval. Two days ago several of these
things were not true.

**The DFW cluster is well built and unproven.** Two pages already rank on page
one in Google, which is a real early signal for a cluster with no history.

**The Austin side is the weak point**, and it is the side with the audience. Your
own data says it plainly: 6,817 non-branded impressions producing four clicks.
The site is being shown and not chosen. That is a content and credibility
problem, not a technical one — and nothing in the recent work addressed it,
because the recent work was aimed elsewhere.

**Nothing here can be measured yet.** The deployment is two days old. The first
meaningful read is the Search Console export around 11 October, and the
Austin/DFW comparison closes 4 November.

---

*Kyber Mortgage Corporation dba Leahy Lending · NMLS 2653540*
