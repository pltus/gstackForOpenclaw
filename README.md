# gstackForOpenclaw

`gstackForOpenclaw` is an OpenClaw-native reinterpretation of the most useful workflows from [gstack](https://github.com/garrytan/gstack).

The goal is **not** to clone gstack file-for-file or pretend OpenClaw has the same runtime model. The goal is to preserve the parts of gstack that create leverage, role-based thinking, staged workflow, sharp review posture, and high-agency execution, while rewriting them for OpenClaw in a way that is honest, maintainable, and actually usable.

## Credit to the original project

This project is directly inspired by **[gstack](https://github.com/garrytan/gstack)**, the open-source workflow and skill pack created by **[Garry Tan](https://x.com/garrytan)**.

If you want the original source material, philosophy, and workflow design, start here:

- **Original repository:** https://github.com/garrytan/gstack
- **Skill deep dives:** https://github.com/garrytan/gstack/blob/main/docs/skills.md
- **Architecture notes:** https://github.com/garrytan/gstack/blob/main/ARCHITECTURE.md
- **Builder ethos:** https://github.com/garrytan/gstack/blob/main/ETHOS.md

This repository does **not** claim authorship of the original gstack concepts. It is a conversion effort: selecting which ideas survive the move to OpenClaw, which need to be narrowed, and which should be deferred or rejected.

## Why this repository exists

gstack is powerful, but it assumes a different operating model:

- Claude/Codex-centric host assumptions
- generated skill docs and custom setup flows
- browser/runtime capabilities that do not map cleanly to OpenClaw
- workflow expectations that can become misleading if copied too literally

A naive port would create three problems:

1. **Runtime mismatch**
2. **fake automation claims**
3. **high maintenance overhead**

So this repository takes a different approach:

- preserve the useful workflow patterns
- redesign them around OpenClaw-native tools
- stay narrow where the runtime is narrow
- defer anything that would otherwise become hand-wavy or dishonest

## Project goals

- Preserve the strongest parts of gstack's workflow philosophy
- Rebuild skills around OpenClaw-native tools such as `exec`, `sessions_spawn`, `memory`, `cron`, and `gh`
- Prefer credible, evidence-first skill behavior over marketing language
- Port in waves, starting with the highest-ROI skills
- Keep skill files thin and operational
- Document explicit deferrals where OpenClaw parity would be fake or premature

## Non-goals

This project does **not** aim to:

- reproduce all of gstack 1:1
- recreate Claude-specific setup, telemetry, or host install machinery
- promise browser parity where OpenClaw does not yet support it credibly
- front-load a giant orchestration framework before the core skills are solid
- hide uncertainty behind broad claims like "fully automated"

## Current implementation status

### Implemented skills

The following OpenClaw-native skills are currently implemented:

#### Planning and framing
- `plan-ceo-review`
- `plan-eng-review`
- `plan-design-review`
- `office-hours`

#### Review and diagnosis
- `review`
- `investigate`
- `retro`
- `cso`
- `benchmark`
- `design-review`

#### Delivery and docs
- `document-release`
- `ship`
- `qa`
- `qa-only`

### Current posture

- **Core first-wave skills are implemented.**
  Planning, review, investigation, and retrospective flows are in place.

- **Selected second-wave skills are implemented in narrowed form.**
  Skills like `plan-design-review`, `qa`, `qa-only`, and `design-review` exist, but in OpenClaw-native planning-first, evidence-first, or artifact-first forms rather than fake browser-parity versions.

- **Some original gstack areas remain intentionally deferred.**
  Browser-heavy and deployment-heavy flows are still treated carefully because generic versions would overpromise.

## What is intentionally deferred

Some skills or areas are still deferred or reinterpreted because they are too environment-specific or too runtime-dependent to implement honestly right now.

Examples include:

- `land-and-deploy`
- `design-consultation`
- `browse`
- `setup-browser-cookies`
- full browser-driven live-site automation parity
- generic deploy/rollback/health-check automation across unknown infra

In other words: if it cannot be made OpenClaw-native **without bluffing**, it stays out or stays narrow.

## Repository docs

- [Conversion Plan](docs/CONVERSION_PLAN.md)
- [Skill Matrix](docs/SKILL_MATRIX.md)
- [Decision: defer `design-consultation`](docs/DECISIONS/design-consultation-defer.md)
- [Validation Summary](docs/VALIDATION_SUMMARY.md)

These docs explain:

- what was kept vs modified vs deferred
- why certain gstack skills were reinterpreted rather than copied
- what the phased implementation strategy looks like
- what the latest lightweight validation pass checked and cleaned up

## Working principle

**Direct port is the wrong goal.**

The right goal is to preserve the useful parts of gstack:

- role-based thinking
- staged workflow
- explicit review criteria
- high-agency execution

while rewriting the operating model for OpenClaw.

## How to read this repository

If you are new here, the best order is:

1. Read this `README.md`
2. Read [docs/CONVERSION_PLAN.md](docs/CONVERSION_PLAN.md)
3. Read [docs/SKILL_MATRIX.md](docs/SKILL_MATRIX.md)
4. Then inspect the implemented skills under `skills/`

## Project stance in one sentence

**Build the smallest OpenClaw-native skill pack that preserves gstack's leverage without inheriting gstack's runtime baggage.**
