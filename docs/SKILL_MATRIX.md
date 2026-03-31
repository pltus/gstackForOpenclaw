# gstack → OpenClaw Skill Matrix

This matrix decides which gstack workflows are worth carrying forward into an OpenClaw-native pack.

The goal is not to recreate every slash command.
The goal is to keep the workflows that meaningfully improve judgment, execution, and review **without** inheriting runtime baggage.

Baseline source for skill names: the public gstack README skill list reviewed during this planning pass.

## How to read this matrix

This file now separates two things that had drifted together:

- **historical planning priority** — what the repo originally thought was worth building first
- **current parity status** — what is actually true in the repo today

Use [PARITY_AUDIT.md](PARITY_AUDIT.md) as the source of truth for current-state vocabulary and rationale.
Use this matrix when you want both the original prioritization and the current status in one place.

## Current status buckets

Aligned to `docs/PARITY_AUDIT.md`:

- **implemented, reinterpreted** — present in this repo, but intentionally rebuilt for OpenClaw rather than copied literally
- **deferred** — not implemented yet because an honest OpenClaw-native version is not ready
- **absorbed** — the intent survives as general operating guidance or another skill, not as a direct port
- **rejected** — intentionally not a fit as a standalone port in this repo

## Historical planning priorities

These are retained only as planning-history context:

- **Build First** — highest early ROI, low runtime mismatch
- **Consider Later** — useful, but not first-wave critical
- **Postpone** — blocked by runtime gaps, browser dependence, or higher implementation risk
- **Reject / Absorb** — not worth porting as a standalone skill
- **Added later / unscored** — not explicitly bucketed in the earliest planning pass

## Matrix

| gstack skill | Historical planning priority | Current parity status | OpenClaw fit | Rationale / current stance | Likely native implementation |
|---|---|---|---|---|---|
| `plan-ceo-review` | **Build First** | **implemented, reinterpreted** | High | Product reframing and scope challenge translated cleanly to OpenClaw and remain one of the best fits for this repo. | `SKILL.md` + structured review output against briefs, PRDs, or repo docs |
| `plan-eng-review` | **Build First** | **implemented, reinterpreted** | High | Architecture, failure-mode, and test review map well to repo files and planning docs without runtime bluffing. | `SKILL.md` + references for architecture, risk, and test-matrix prompts |
| `review` | **Build First** | **implemented, reinterpreted** | High | Core review workflow still maps well to `read`, `exec`, git diff, and optional GitHub usage. | review skill with explicit must-fix / should-fix / questions structure |
| `investigate` | **Build First** | **implemented, reinterpreted** | High | Root-cause-first debugging is strongly aligned with OpenClaw’s tool model and disciplined diagnosis posture. | investigation skill using `exec`, targeted file reads, and optional sub-agents |
| `retro` | **Build First** | **implemented, reinterpreted** | High | Reflection and learning loops fit naturally with repo history, docs, and explicit writeups. | retro skill that synthesizes commits, incidents, and decisions into action items |
| `office-hours` | **Consider Later** | **implemented, reinterpreted** | Medium-high | Landed as a narrower front-door framing workflow, not a full gstack-style lifecycle orchestrator. | front-door planning skill with reusable framing and routing guidance |
| `document-release` | **Consider Later** | **implemented, reinterpreted** | Medium | Implemented as a thin documentation-oriented workflow tied to release summaries, not broad release automation. | documentation-oriented skill tied to release notes, changelogs, and rollout summaries |
| `ship` | **Consider Later** | **implemented, reinterpreted** | Medium | Landed in a deliberately narrow checklist-and-handoff form rather than a generic deployment machine. | thin release checklist with explicit handoff points, not "magic ship" automation |
| `benchmark` | **Consider Later** | **implemented, reinterpreted** | Medium | Implemented as a thin evidence-first performance workflow while keeping measurement-discipline caveats intact. | helper-oriented skill around repeatable benchmark commands and result summaries |
| `cso` | **Consider Later** | **implemented, reinterpreted** | Medium | Implemented in a constrained review shape with explicit confidence and threat-model boundaries. | security review skill with confidence thresholds and exploit-scenario reporting |
| `qa` | **Postpone** | **implemented, reinterpreted** | Medium | Now implemented in a narrower evidence-first form that stays honest about missing browser automation. | evidence-first QA built around diffs, repo-native tests, manual repro steps, and explicit limits |
| `qa-only` | **Postpone** | **implemented, reinterpreted** | Medium | Implemented as a report-only verification variant that shares `qa`'s honest runtime limits and avoids silent fixing. | non-mutating QA verification with bug reports, repro steps, and release guidance |
| `plan-design-review` | **Postpone** | **implemented, reinterpreted** | Medium-high | Landed as a narrow pre-build UX review grounded in plans, flows, wireframes, and missing-artifact callouts. | plan-level design review against specs, flows, wireframes, and state coverage |
| `design-review` | **Postpone** | **implemented, reinterpreted** | Medium | Implemented in an artifact-first form grounded in screenshots, mockups, recordings, and frontend evidence instead of fake live-site automation. | artifact-first design review using screenshots, mockups, recordings, and frontend diffs |
| `design-consultation` | **Consider Later** | **deferred** | Medium-low | The idea remains valuable, but a broad design research + direction + mockup workflow would still overpromise. | maybe later as a narrower design-direction or reference-synthesis workflow |
| `design-shotgun` | **Postpone** | **deferred** | Low | Multi-variant visual exploration is attractive, but still far from this repo’s current planning and review focus. | would require stronger generation + comparison tooling first |
| `land-and-deploy` | **Postpone** | **deferred** | Low-medium | Deployment flows remain too environment-specific and too easy to fake as a generic skill. | if ever added, should be template-driven and repo-specific |
| `canary` | **Postpone** | **deferred** | Low-medium | Depends on deployment maturity, telemetry, and rollback conventions this project does not standardize. | likely a workflow doc or script set, not an early generic skill |
| `browse` | **Postpone** | **deferred** | Low | This is a runtime capability question, not a planning-docs question. Porting early would create false expectations. | redesign later around actual available browser tooling |
| `connect-chrome` | **Postpone** | **deferred** | Low | Purely runtime-specific and outside the current OpenClaw-native scope. | none until browser integration is a real product requirement |
| `setup-browser-cookies` | **Postpone** | **deferred** | Low | Operationally sensitive and tightly coupled to a browser stack the repo is explicitly not recreating yet. | none for current scope |
| `setup-deploy` | **Postpone** | **deferred** | Low-medium | May be useful in some repos, but is still too environment-specific for an honest generic skill. | repo-local reference docs or scripts, not an early generic skill |
| `learn` | **Consider Later** | **deferred** | Medium | The compounding-memory idea is useful, but the repo still lacks a narrow, repeatable OpenClaw-native shape for it. | possible future skill once memory conventions are stable enough to describe honestly |
| `autoplan` | **Reject / Absorb** | **absorbed** | Medium | The intent survives across `office-hours`, `plan-ceo-review`, `plan-eng-review`, and `plan-design-review`; the standalone command shape is not needed. | absorb into planning patterns rather than port directly |
| `codex` | **Reject / Absorb** | **absorbed / rejected as standalone** | Medium | OpenClaw already has native sub-agent patterns, so a branded second-opinion wrapper would be redundant unless it adds real value. | use native sub-agent guidance, not a dedicated `codex` skill |
| `careful` | **Reject / Absorb** | **absorbed** | Medium | Safety posture matters, but it belongs in base instructions and scoped workflows more than in slogan-style command ports. | absorb into default operating guidance and high-risk skills |
| `freeze` | **Reject / Absorb** | **absorbed** | Low-medium | Edit-scope control is better represented as workflow policy or platform behavior than as a portable skill. | absorb into release policy docs or future platform conventions |
| `guard` | **Reject / Absorb** | **absorbed** | Low-medium | Same logic as `freeze`: the principle matters more than mimicking the original command surface. | absorb into safety and release conventions |
| `unfreeze` | **Reject / Absorb** | **absorbed** | Low-medium | Only makes sense if `freeze` exists as a runtime primitive; that is not the model here. | absorb into policy and ops procedures |
| `gstack-upgrade` | **Reject / Absorb** | **rejected** | Low | Specific to gstack’s own distribution/update model, which this project is not copying. | omit entirely |

## Current implementation snapshot

Implemented in this repo today:

- `plan-ceo-review`
- `plan-eng-review`
- `plan-design-review`
- `review`
- `investigate`
- `retro`
- `office-hours`
- `document-release`
- `ship`
- `benchmark`
- `cso`
- `qa`
- `qa-only`
- `design-review`

Notes:

- `docs/PARITY_AUDIT.md` is the source of truth for status vocabulary, coverage framing, and current rationale.
- This matrix preserves **historical planning priority** alongside **current parity status** so readers can see what changed over time.
- `benchmark` and `cso` moved from earlier “later” thinking into real, deliberately thin implementations.
- `qa`, `qa-only`, `plan-design-review`, and `design-review` moved from planning-era hesitation into honest narrowed implementations rather than fake parity.
- Browser-heavy, deployment-heavy, memory-explicit, and other runtime-sensitive workflows remain deferred on purpose.
- Broader non-skill runtime areas such as project-state artifacts, browser daemon workflows, install/setup flows, and telemetry are tracked in the parity audit rather than expanded here as fake skills.

## Historical first-wave decisions that still look correct

The earliest build-first choices were:

1. `plan-ceo-review`
2. `plan-eng-review`
3. `review`
4. `investigate`
5. `retro`

That priority still makes sense because these workflows:

- improve decision quality early
- do not require fake browser/runtime promises
- can be tested against normal repos and planning docs
- fit OpenClaw’s tool model without needing a meta-framework

## Implementation notes

### 1. Prefer workflow primitives over command cosplay

If a workflow can be expressed as:

- a concise skill trigger
- a stable output format
- a small reference/checklist
- optional tool use with visible boundaries

then it is a good fit for this repo.

If it requires hidden runtime state, custom host install steps, or agent-brand-specific behavior, it should stay deferred, absorbed, or rejected.

### 2. Keep the pack intentionally narrow

A smaller pack with clear behavior is better than a wide pack with fictional coverage.

That means repo docs and skills should optimize for:

- planning discipline
- engineering judgment
- review quality
- investigation rigor
- learning loops where they can be described honestly

not breadth for its own sake.

### 3. Revisit deferred skills only when the runtime case is real

The right time to revisit a deferred skill is when the missing runtime story becomes concrete enough to explain clearly.

Until then, this matrix should act as a scope-control artifact, not a wishlist.
