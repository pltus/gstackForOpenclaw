# Implementation Inventory

This document is a compact current-state inventory for `gstackForOpenclaw`.

Use it when you want a quick operational answer to:

- what is actually implemented here
- what shape that implementation takes
- what has been validated so far
- what is still intentionally deferred
- which document is the source of truth for a given question

It is intentionally shorter than the parity audit and less historical than the conversion plan.

## Repo shape at a glance

### Implemented skill count

- **14 implemented skills** under `skills/`
- each implemented skill currently has:
  - `SKILL.md`
  - one `references/` helper file
- there are **no repo-level helper scripts** or command-router layers in the current pack

### Current implementation posture

The repo is strongest in **planning, review, diagnosis, release/docs handoff, and narrow evidence-first QA/design workflows**.

It is **not** a runtime-parity port of gstack. Current implementation is mostly:

- skill definitions
- reference checklists/prompts
- scope and parity documentation
- explicit defer decisions where OpenClaw-native parity would be weak or misleading

## Implemented skills by area

### Planning and framing

- `office-hours`
- `plan-ceo-review`
- `plan-eng-review`
- `plan-design-review`

Current reading:
- strong OpenClaw fit
- planning-first and artifact-aware
- `plan-design-review` is intentionally a **pre-build** UX/design review, not a broad design-generation workflow

### Review and diagnosis

- `review`
- `investigate`
- `retro`
- `cso`
- `benchmark`
- `design-review`

Current reading:
- this is the repo’s most credible implementation center of gravity
- `design-review` is intentionally **artifact-first**, not a guaranteed live browser audit/fix loop
- `cso` and `benchmark` are deliberately thin, evidence-first reinterpretations rather than broad automation wrappers

### Delivery and docs

- `document-release`
- `ship`
- `qa`
- `qa-only`

Current reading:
- these workflows exist in **narrow, explicit forms**
- `ship` is a release-readiness / handoff workflow, not generic deploy automation
- `qa` and `qa-only` are evidence-first verification skills, not blanket browser-led autonomous QA

## Notable reinterpretations to remember

These are the most important “don’t overread the skill name” cases:

- **`plan-design-review`** → plan-level UX critique against specs, flows, wireframes, and missing artifacts
- **`design-review`** → review of screenshots, mockups, recordings, frontend evidence, and visible UI artifacts
- **`qa` / `qa-only`** → repo-native and evidence-first verification with explicit runtime limits
- **`ship`** → release checklist and handoff posture, not one-command shipping
- **`benchmark`** → measurement discipline where commands/evidence exist, not universal browser-performance parity
- **`cso`** → scoped security review posture, not a promise of end-to-end security scanning coverage

In practice, most implemented skills should be read as **implemented and reinterpreted**, not as literal gstack parity.

## Validation state

### What the repo can honestly claim today

Documented validation in this repo is currently **lightweight and structural**, not broad runtime certification.

Documented checks currently include:

- implemented skill presence and repo shape
- existence of referenced helper files
- trigger/boundary clarity for the newer design/planning/testing wave
- documentation drift cleanup across README + planning/parity docs

### Specifically validated in a dedicated note

`docs/VALIDATION_SUMMARY.md` documents a smoke-test style pass over:

- `plan-design-review`
- `design-review`
- `qa`
- `qa-only`
- the docs that describe their current status

That validation pass explicitly describes itself as **documentation-and-structure validation**, not fake runtime testing.

### What is not yet represented as validated

This repo does **not** currently claim:

- end-to-end runtime verification for every skill
- browser-parity validation
- deploy automation validation
- a generalized automated test harness for all skills

## Deferred or intentionally non-ported areas

The main deferred areas remain:

- browser-driven workflows such as `browse`, `connect-chrome`, and `setup-browser-cookies`
- deployment-heavy flows such as `land-and-deploy`, `canary`, and `setup-deploy`
- broader design-generation / research flows such as `design-consultation`, `design-shotgun`, and `design-html`
- explicit memory-compounding work such as `learn`
- gstack-specific install/update/runtime machinery

The reason is consistent across the repo: if parity would require bluffing about runtime support, infra, browser control, or hidden state, it stays deferred, absorbed, or rejected.

## Source-of-truth map

Use the right document for the right question:

- **Current parity truth and rationale** → [`PARITY_AUDIT.md`](PARITY_AUDIT.md)
- **Historical priority vs current status** → [`SKILL_MATRIX.md`](SKILL_MATRIX.md)
- **Implementation history and repo stance** → [`CONVERSION_PLAN.md`](CONVERSION_PLAN.md)
- **Documented validation pass** → [`VALIDATION_SUMMARY.md`](VALIDATION_SUMMARY.md)
- **Why `claw-code` matters and what not to copy** → [`CLAW_CODE_NOTES.md`](CLAW_CODE_NOTES.md)

## Fast update checklist

When this repo changes, update this inventory if any of the following become true:

1. a skill is added, removed, or renamed
2. a deferred area becomes implemented or intentionally rejected
3. a new validation note materially changes confidence level
4. README status wording changes enough that this summary would drift
5. a skill gains scripts or other implementation artifacts that change repo shape

If there is any conflict between this file and the deeper docs, treat the deeper source-of-truth docs above as authoritative and then update this inventory.
