# Readiness Levels

This repo uses a small readiness vocabulary so `documented`, `implemented`, and `validated` do not get blurred together.

These are **status tags, not a maturity score**. A skill or workflow can carry more than one tag at the same time.

## Tags

### `documented`

The workflow, boundary, or decision is described in repo docs.

Use this when something is explained clearly enough to reason about, even if it is not yet shipped as a live skill.

### `implemented`

The skill or artifact exists in this repo in a form intended for real use.

For skills, that usually means a real `skills/<name>/SKILL.md` plus any referenced helper files.

### `validated-structure`

A lightweight repo-level check has confirmed the implementation shape is coherent.

Typical evidence:

- expected skill sections exist
- referenced helper files exist
- docs and status wording do not obviously drift
- trigger and boundary language is distinct enough to use safely

This is **not** a claim that the workflow has been exercised end-to-end in a live environment.

### `validated-workflow`

A workflow has been exercised at the behavior level, with evidence that the steps hold together in a real or representative execution path.

This tag should be used sparingly and only when the validation note names what was actually run or observed.

### `runtime-dependent`

Real confidence depends on environment-specific runtime conditions that the repo itself does not guarantee.

Typical examples:

- browser access
- deploy permissions or target infra
- external services, staging data, or credentials
- repo-specific commands that may not exist everywhere

This tag is a warning against overclaiming, not a failure state.

## How to read combinations

Common honest combinations in this repo:

- `documented` + `implemented` → the skill exists and is intended to be used
- `implemented` + `validated-structure` → the repo shape has been checked, but runtime claims remain limited
- `implemented` + `runtime-dependent` → the skill is real, but strong confidence depends on the environment
- `validated-workflow` + `runtime-dependent` → workflow evidence exists, but only for the named runtime context, not universally

## Current repo stance

Today, most of this repo should be read as:

- broadly **documented**
- materially **implemented**
- selectively **validated-structure**
- only rarely eligible for **validated-workflow** without a more explicit execution note

When in doubt, prefer the narrower claim.