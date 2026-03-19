# MetaSpec DS

Meta especificación para documentar y estructurar un design system existente como metadata entendible por IA.

## Purpose

This repository defines a structured metadata model for documenting a design system consistently across components, patterns, and foundations.

It is intended to help:
- normalize existing design system knowledge
- separate semantic structure from implementation details
- support AI-assisted documentation workflows
- reduce ambiguity in how the design system is described

## Repository structure

- `AGENTS.md`  
  Operational guide for AI agents working in this repository.

- `metaspec/ontology.yaml`  
  Conceptual model of the metadata system.

- `metaspec/component.schema.yaml`  
  Metadata schema for components.

- `metaspec/pattern.schema.yaml`  
  Metadata schema for UX patterns.

- `docs/`  
  Human-readable documentation and notes.

- `metadata/components/`  
  Component metadata output.

- `metadata/patterns/`  
  Pattern metadata output.

- `metadata/foundations/`  
  Foundation metadata output.

## Workflow

1. Define or refine the MetaSpec files in `/metaspec`.
2. Use those schemas to document existing design system assets.
3. Generate or curate one metadata file per component or pattern.
4. Mark uncertainty explicitly through `provenance` and `open_questions`.
5. Keep structural rules in schemas and operational rules in `AGENTS.md`.

## Core principles

- Schemas are the structural source of truth.
- Components and patterns must remain separate.
- Anti-patterns belong inside `usage`.
- Inferred information must be marked explicitly.
- Missing information should be surfaced, not invented.

## Status

This project is in its initial setup phase.

Current focus:
- establishing the metadata model
- validating schemas with real components
- preparing the repository for AI-assisted documentation

## Example

A component metadata file typically includes:
- `id`
- `name`
- `category`
- `description`
- `intent`
- `composition`
- `variants`
- `behavior`
- `usage`
- `accessibility`
- `token_bindings`
- `provenance`