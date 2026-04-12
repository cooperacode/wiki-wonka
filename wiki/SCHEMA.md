# wiki/SCHEMA.md

This file defines the conventions for every page in the wiki. It is read by the
orchestrator and all skills. When in doubt about structure, naming, or formatting,
this file is the authority.

---

## Directory layout

```
wiki/
├── SCHEMA.md          ← this file
├── index.md           ← catalogue of all pages (owned by orchestrator)
├── log.md             ← append-only history (owned by orchestrator)
├── overview.md        ← synthesis of the full domain
├── sources/           ← one page per ingested source
├── entities/          ← people, orgs, models, datasets, products
└── concepts/          ← themes, techniques, theories, arguments
```

Never create pages outside these folders. Never rename or move these folders.

---

## File naming

- Lowercase, hyphenated slugs only: `attention-mechanism.md`
- No spaces, no underscores, no special characters
- Derive the slug from the canonical title:
  - "Attention Is All You Need" → `attention-is-all-you-need`
  - "Geoffrey Hinton" → `hinton-geoffrey` (lastname-firstname for people)
  - "OpenAI" → `openai`
- If a slug would collide, append a disambiguator: `python-language.md` vs `python-snake.md`
- Maximum 60 characters per filename (without extension)

---

## Frontmatter

Every page must begin with a YAML frontmatter block. Required fields vary by page type.

### Source page (`wiki/sources/`)

```yaml
---
title: "Full title of the source"
slug: source-slug
type: source
date_ingested: YYYY-MM-DD
original_file: raw/filename.ext
authors:
  - Lastname, Firstname
tags: []
related_concepts: []
related_entities: []
---
```

### Entity page (`wiki/entities/`)

```yaml
---
title: "Entity Name"
slug: entity-slug
type: entity
subtype: person | organization | model | dataset | product
tags: []
related_sources: []
related_concepts: []
related_entities: []
---
```

### Concept page (`wiki/concepts/`)

```yaml
---
title: "Concept Name"
slug: concept-slug
type: concept
tags: []
related_sources: []
related_entities: []
related_concepts: []
---
```

### Overview (`wiki/overview.md`)

```yaml
---
title: "Domain Overview"
type: overview
last_updated: YYYY-MM-DD
source_count: N
---
```

### Rules

- All field names are lowercase with underscores.
- List fields (`tags`, `related_*`) are always arrays, even when empty: `[]`
- Dates are always ISO 8601: `YYYY-MM-DD`
- `slug` must match the filename exactly (without `.md`)
- Do not add fields not listed here unless updating this SCHEMA.md first.
- Inferred values (filled in automatically) must be flagged: `slug: inferred-slug # inferred`

---

## Wikilinks

Internal links use double-bracket syntax: `[[slug]]` or `[[slug|display text]]`

```markdown
Self-attention [[self-attention]] was introduced by [[vaswani-ashish|Vaswani et al.]]
```

- Always link to the slug, not the filename: `[[self-attention]]` not `[[self-attention.md]]`
- Use display text when the slug alone would read awkwardly in prose
- Every concept and entity mentioned more than once across the wiki should have a page
- The first mention of an entity or concept on a page gets a wikilink; subsequent mentions do not

---

## Callouts

Use callouts to flag conditions that require human attention. Never resolve them silently.

```markdown
> [!contradiction]
> This source disputes [[concepts/positional-encoding]] on absolute vs relative positions.
> Sources: [[sources/rope-paper]] vs [[sources/attention-is-all-you-need]]

> [!outdated]
> This section predates [[sources/flash-attention]]. The complexity claim may no longer hold.

> [!gap]
> Mixture-of-experts variants are mentioned here but have no dedicated page.

> [!deprecated]
> This page was superseded by [[concepts/scaled-dot-product-attention]]. Kept for reference.
```

- Callouts are placed inline, immediately after the claim they annotate.
- Never delete a callout. Resolve it by updating content and removing the callout only after
  the human confirms the resolution.

---

## Page templates

### Source page body

```markdown
---
[frontmatter]
---

## Summary

2–4 paragraphs. What is this source about? What is its main argument or contribution?
Write for someone who will never read the original.

## Key claims

- Claim 1 — specific, include data or direct quotes where relevant.
- Claim 2

## Connections to existing wiki

What does this source confirm, challenge, or add nuance to?
Use [[wikilinks]] to reference existing pages.

> [!contradiction] if applicable

## Open questions

What does this source leave unanswered?

## Notable quotes

> "Direct quote." (p. N or timestamp)
```

### Entity page body

```markdown
---
[frontmatter]
---

## Who / what this is

One factual paragraph. Based only on wiki sources — no external knowledge.

## Role in this domain

How does this entity appear across ingested sources?

## Appearances

- [[sources/slug]] — context of appearance
- [[sources/slug]] — context of appearance
```

### Concept page body

```markdown
---
[frontmatter]
---

## Definition

One clear paragraph. What is this concept?

## How it works

Mechanism, process, or explanation.

## Evidence and claims

What do ingested sources say? Cite with [[wikilinks]].

> [!contradiction] if applicable

## Connections

Related concepts: [[slug]], [[slug]]
Related entities: [[slug]]

## Open questions
```

### Overview body

```markdown
---
[frontmatter]
---

## Current state of knowledge

3–5 paragraphs synthesising everything in the wiki into a coherent picture of the domain.
Updated after every ingest.

## Key themes

Bullet list of the 5–10 most important concepts across all sources, each with a [[wikilink]].

## Open tensions

Unresolved contradictions or debates across sources. Each item links to the relevant pages.

## Suggested next sources

What is the wiki missing? What would most expand coverage?
```

---

## index.md format

```markdown
# Index

_N pages across S sources, E entities, C concepts. Last updated: YYYY-MM-DD._

## Sources
- [[sources/slug]] — one-line summary. Ingested: YYYY-MM-DD.

## Entities
- [[entities/slug]] — one-line summary.

## Concepts
- [[concepts/slug]] — one-line summary.
```

- Entries are sorted alphabetically within each section.
- One line per page, no exceptions.
- The summary is extracted from the page's first sentence or frontmatter description.

---

## log.md format

Entries are prepended (newest first). Never edit existing entries.

```markdown
## [YYYY-MM-DD] ingest | Title of source
Pages touched: sources/slug, entities/x, concepts/y (N total)
New pages created: concepts/new-concept
Contradictions flagged: N

## [YYYY-MM-DD] query | Question asked
Answer filed as: concepts/slug (or "not filed")
Pages read: concepts/x, sources/y (N total)
Gaps identified: N

## [YYYY-MM-DD] lint | Full wiki scan
Issues found: N. Auto-fixed: N. Resolved: N. Deferred: N.
Contradictions outstanding: N
```

---

## What the LLM must never do

- Modify files in `raw/`
- Delete any wiki page (use `[!deprecated]` instead)
- Create pages outside `wiki/sources/`, `wiki/entities/`, `wiki/concepts/`
- Answer domain questions from memory without reading wiki pages first
- Add frontmatter fields not defined in this schema without updating this file first
- Resolve a `[!contradiction]` or `[!outdated]` callout without human confirmation
- Create duplicate pages for the same entity or concept — check `wiki/index.md` first