# AGENTS.md

## Objective
Document and normalize this design system as structured metadata that is understandable by humans and AI systems.

This repository contains:
1. the MetaSpec contract,
2. the existing design system implementation,
3. and the generated metadata output.

Your job is to extract, structure, and update metadata with minimal invention.

---

## Source of truth priority

Always read sources in this order:

1. `/metaspec/ontology.yaml`
2. `/metaspec/component.schema.yaml`
3. `/metaspec/pattern.schema.yaml`
4. `/README.md`
5. `/docs/`
6. `/src/components/` or the implementation directories
7. `/tokens/` or foundations directories
8. Storybook or local docs if present

If implementation conflicts with docs:
- prefer explicit schema rules first,
- then prefer current implementation,
- then mark conflicts in `open_questions`.

Do not treat Figma or screenshots as source of truth unless explicitly stated.

---

## Working model

This project separates:
- **foundations**: design tokens and visual primitives
- **patterns**: reusable UX solutions
- **components**: implementable UI units
- **metadata**: structured documentation for AI consumption

Do not merge these levels.

Examples:
- A `button` is a component.
- `primary action trigger` is a pattern or intent-related concept.
- `color.primary.500` is a foundation/token.
- `multiple primary buttons in the same section` is an anti-pattern inside `usage`.

---

## Core rules

1. Do not create fields outside the schema.
2. Do not merge pattern and component definitions.
3. Do not invent business logic.
4. Do not present assumptions as facts.
5. Anti-patterns must always live inside `usage`.
6. If a value is not directly supported by evidence, mark it in `provenance`.
7. If confidence is low, add an `open_questions` entry.
8. Prefer extraction over invention.
9. Keep output concise, operational, and schema-aligned.
10. Do not modify schema files unless explicitly asked.

---

## Provenance rules

Use:

- `observed` for values directly visible in code, props, variants, docs, Storybook, tokens, or naming
- `inferred` for values that are likely but not explicitly documented
- `author_defined` only when the user explicitly provides the information

Never convert inferred information into author_defined.

---

## Output contract

When generating metadata:

- Output YAML only
- Generate one file per entity
- Use stable ids in dot notation
- Keep descriptions short and functional
- Preserve missing information as uncertainty instead of filling gaps aggressively

Component metadata must follow:
- `/metaspec/component.schema.yaml`

Pattern metadata must follow:
- `/metaspec/pattern.schema.yaml`

---

## Extraction order

When analyzing an existing design system, work in this order:

1. inventory components
2. inventory variants and props
3. detect composition/anatomy
4. detect states and interactions
5. detect token bindings if possible
6. capture accessibility evidence if present
7. capture usage guidance only if documented
8. infer intent only when strongly supported
9. record unresolved items in `open_questions`

Do not start by inventing patterns or intents from visual appearance alone.

---

## Directory map

Expected repository structure:

- `/metaspec/`
  - conceptual model and metadata schemas

- `/src/components/`
  - design system implementation source

- `/tokens/`
  - foundations and token definitions

- `/docs/`
  - human-readable documentation

- `/metadata/components/`
  - generated component metadata

- `/metadata/patterns/`
  - generated pattern metadata

- `/metadata/foundations/`
  - generated foundation metadata

If the actual structure differs, detect the nearest equivalent and state your assumption.

---

## Component-specific guidance

For each component, try to extract only what is observable:

- name
- category
- description from docs or code comments if available
- composition / anatomy
- variants
- states
- interactions
- accessibility evidence
- token bindings
- usage evidence

Do not invent:
- rationale
- business constraints
- intent
- anti-patterns

unless they are documented or explicitly requested.

If requested to propose them, clearly mark them as inferred.

---

## Pattern-specific guidance

Patterns are not the same as components.

Only create pattern metadata when:
- a reusable UX solution is clearly documented,
- or the author explicitly asks for a pattern definition.

Do not convert every component into a pattern automatically.

---

## Anti-pattern guidance

Anti-patterns must always be nested under `usage`.

Correct shape:

usage:
  anti_patterns:
    - scenario: ""
      reason: ""
      alternative: ""

Do not place anti-patterns as a top-level entity.

---

## Validation behavior

Before finalizing any generated metadata, check for:

- missing required fields
- fields outside schema
- invalid nesting
- mixed abstraction levels
- unsupported semantic claims
- ids that are unstable or ambiguous

If validation fails:
- do not silently patch with invented content
- surface the issue in `open_questions`

---

## Preferred task flow

For inventory tasks:
1. inspect the repo
2. list candidate components
3. group related files
4. extract observable metadata
5. write YAML files to `/metadata/components/`

For normalization tasks:
1. read existing metadata
2. compare against schema
3. fix structure
4. preserve meaning
5. do not enrich semantics unless asked

For documentation tasks:
1. use metadata as source
2. generate concise markdown
3. do not let markdown become the source of truth

---

## Prompt interpretation rules

When the user asks:
- "document this component" -> produce component metadata first
- "define the pattern" -> produce pattern metadata
- "audit this component" -> compare current metadata against schema and evidence
- "improve this description" -> preserve structure, only refine wording
- "infer intent" -> mark provenance as inferred unless explicitly given by the author

---

## Completion criteria

A task is complete only when:
- output matches the requested schema,
- uncertainty is made explicit,
- no unsupported facts are introduced,
- files are written to the correct directory when requested,
- and the result is understandable without extra narrative.