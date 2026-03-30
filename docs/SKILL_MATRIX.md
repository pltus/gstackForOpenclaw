# gstack → OpenClaw Skill Matrix

This matrix decides which gstack workflows are worth carrying forward into an OpenClaw-native pack.

The goal is not to recreate every slash command.
The goal is to keep the workflows that meaningfully improve judgment, execution, and review **without** inheriting runtime baggage.

Baseline source for skill names: the public gstack README skill list reviewed during this planning pass.

## Decision buckets

- **Build First** — strong value, low runtime mismatch, should shape the first OpenClaw-native pack
- **Consider Later** — useful, but depends on stronger conventions or more proven core workflows
- **Postpone** — conceptually valid, but blocked by browser/runtime gaps or higher implementation risk
- **Reject / Absorb** — do not port as a standalone skill; either fold into base agent behavior or drop entirely

## Matrix

| gstack skill | Decision | OpenClaw fit | Rationale | Likely native implementation |
|---|---|---|---|---|
| `plan-ceo-review` | **Build First** | High | Product reframing and scope challenge translate cleanly to OpenClaw. High leverage with minimal tooling assumptions. | `SKILL.md` + structured review output against briefs, PRDs, or repo docs |
| `plan-eng-review` | **Build First** | High | Architecture, failure-mode, and test review are easy to ground in repo files and planning docs. | `SKILL.md` + references for architecture, risk, and test-matrix prompts |
| `review` | **Build First** | High | Core code review workflow maps well to `read`, `exec`, git diff, and optional GitHub usage. | review skill with explicit must-fix / should-fix / questions structure |
| `investigate` | **Build First** | High | Root-cause-first debugging is strongly aligned with OpenClaw’s tool model and sub-agent patterns. | investigation skill using `exec`, targeted file reads, and optional spawned helpers |
| `retro` | **Build First** | High | Reflection and learning loops fit naturally with repo history, docs, and memory. | retro skill that synthesizes commits, incidents, and decisions into action items |
| `office-hours` | **Consider Later** | Medium-high | Valuable for zero-to-one product shaping, but overlaps with `plan-ceo-review` until a stronger common report format exists. | likely a front-door planning skill or a reusable framing template rather than a heavy standalone flow |
| `document-release` | **Consider Later** | Medium | Useful once shipping and release conventions are stable, but premature before the first core skills land. | documentation-oriented skill tied to release notes, changelogs, and rollout summaries |
| `ship` | **Consider Later** | Medium | High user value, but easy to overpromise. Should follow once review boundaries and CI expectations are clear. | thin release checklist with explicit handoff points, not "magic ship" automation |
| `benchmark` | **Consider Later** | Medium | Performance review is useful, but only after the repo has stable workloads and measurement conventions. | helper-oriented skill around repeatable benchmark commands and result summaries |
| `cso` | **Consider Later** | Medium | Security review is important, but needs careful false-positive control and a documented threat-modeling style. | security review skill with confidence thresholds and exploit-scenario reporting |
| `land-and-deploy` | **Postpone** | Low-medium | Deployment flows are highly environment-specific and easy to fake. Not a safe early abstraction. | if ever added, should be template-driven and repo-specific |
| `canary` | **Postpone** | Low-medium | Depends on deployment maturity, telemetry, and rollback conventions that this project does not have yet. | likely a workflow doc or script set, not an early generic skill |
| `qa` | **Postpone** | Low | gstack’s QA value depends heavily on real browser/runtime capability. OpenClaw-native parity is not ready. | revisit only after a credible browser story exists |
| `qa-only` | **Postpone** | Low | Same runtime constraint as `qa`; report-only mode does not remove the browser dependency. | could later become a non-mutating testing/reporting variant |
| `browse` | **Postpone** | Low | This is a runtime capability question, not a planning-docs question. Early porting would create false expectations. | redesign later around actual available browser tooling |
| `connect-chrome` | **Postpone** | Low | Purely runtime-specific. Outside the first OpenClaw-native scope. | none until browser integration is a real product requirement |
| `setup-browser-cookies` | **Postpone** | Low | Operationally sensitive and tightly coupled to a browser stack that this project is explicitly not recreating yet. | none for early phases |
| `setup-deploy` | **Postpone** | Low-medium | May be useful in some repos, but too environment-specific for the first pass. | repo-local reference docs or scripts, not a generic early skill |
| `plan-design-review` | **Postpone** | Medium | The critique lens is valuable, but this repo should first prove product + engineering planning before adding a design review system. | later skill with references/checklists and maybe screenshot inputs |
| `design-review` | **Postpone** | Medium | Strong value when visuals exist, but it depends on artifact conventions and often browser/screenshot workflows. | could later combine static asset review with code-level UI inspection |
| `design-consultation` | **Postpone** | Medium-low | Too open-ended for an early pack that is trying to stay sharp, thin, and operational. | maybe later as a guided ideation/reference workflow |
| `design-shotgun` | **Postpone** | Low | Multi-variant visual exploration is attractive but far from this repo’s immediate planning and review goals. | likely requires stronger generation + comparison tooling first |
| `autoplan` | **Reject / Absorb** | Medium | The intent is useful, but the standalone command is less important than embedding planning rigor into the main planning skills. | absorb into `office-hours` / `plan-*` patterns instead of porting directly |
| `codex` | **Reject / Absorb** | Medium | OpenClaw already has native sub-agent / ACP patterns. A branded second-opinion wrapper is not the right primary abstraction. | use native sub-agent guidance, not a dedicated `codex` skill |
| `careful` | **Reject / Absorb** | Medium | Safety posture matters, but OpenClaw should express it through base instructions and scoped workflows, not slogan skills. | absorb into default operating guidance and high-risk skills |
| `freeze` | **Reject / Absorb** | Low-medium | Branch protection / workflow freeze is real, but better represented as policy or repo automation than a portable skill. | absorb into release policy docs or CI rules |
| `guard` | **Reject / Absorb** | Low-medium | Similar to `freeze`: better as repo policy, review gates, or platform behavior than a general-purpose skill. | absorb into safety/release conventions |
| `unfreeze` | **Reject / Absorb** | Low-medium | Same reasoning as `freeze`; not worth treating as a portable skill abstraction. | absorb into policy and ops procedures |
| `gstack-upgrade` | **Reject / Absorb** | Low | Specific to gstack’s own distribution/update model, which this project is not copying. | omit entirely |

## What this means for Phase 0 → Phase 1

### Locked as first implementation targets

1. `plan-ceo-review`
2. `plan-eng-review`
3. `review`
4. `investigate`
5. `retro`

These are the best first candidates because they:

- improve decision quality early
- do not require fake browser/runtime promises
- can be tested against normal repos and planning docs
- fit OpenClaw’s existing tool model without a meta-framework

### Explicitly not in the first wave

The following should stay out of the first implementation phase unless runtime assumptions materially change:

- browser-heavy workflows (`browse`, `qa`, `qa-only`, `connect-chrome`, `setup-browser-cookies`)
- deployment-heavy workflows (`land-and-deploy`, `canary`, `setup-deploy`)
- policy-only wrappers (`freeze`, `guard`, `unfreeze`, `careful`)
- host-specific or brand-specific wrappers (`gstack-upgrade`, `codex`)

## Implementation notes

### 1. Prefer workflow primitives over command cosplay

If a workflow can be expressed as:

- a concise skill trigger
- a stable output format
- a small reference/checklist
- optional tool use with visible boundaries

then it is a good fit for this repo.

If it requires hidden runtime state, custom host install steps, or agent-brand-specific behavior, it should be postponed or absorbed.

### 2. Keep the first pack intentionally narrow

A smaller pack with clear behavior is better than a wide pack with fictional coverage.

That means early docs and skills should optimize for:

- planning discipline
- engineering judgment
- review quality
- investigation rigor
- learning loops

not breadth for its own sake.

### 3. Revisit later buckets only after real usage

The right time to promote a `Consider Later` or `Postpone` skill is after the first wave has been used on real tasks and its gaps are concrete.

Until then, this matrix should act as a scope control artifact, not a wishlist.
