# gstack → OpenClaw Conversion Plan

## Status snapshot

Current implemented skills in this repo:

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

Still intentionally postponed: browser-parity, deployment-heavy, and strongly environment-specific workflows. `plan-design-review`, `qa`, `qa-only`, and `design-review` have been reintroduced in narrower planning-first / evidence-first / artifact-first forms that do not promise browser parity or finished-design certainty. `land-and-deploy` remains deferred because deployment automation would still be too environment-specific.

## 1. Purpose

This project converts the most valuable parts of [gstack](https://github.com/garrytan/gstack) into an OpenClaw-native skill pack.

The target is **not** to mirror gstack file-for-file.
The target is to preserve the decision quality and workflow leverage of gstack while rewriting the execution model for OpenClaw.

---

## 2. Problem Statement

gstack is opinionated, powerful, and workflow-rich, but it is built around a different runtime model:

- Claude Code / Codex / Factory-host assumptions
- setup scripts and generated skill docs
- custom browse binaries and install flows
- host-specific hooks, telemetry, and session state
- slash-command driven UX that does not map 1:1 onto OpenClaw

A naive port creates three problems:

1. **False promises** — README-level claims without runtime guarantees
2. **Runtime mismatch** — skills that assume tools, hooks, or directories that OpenClaw does not have
3. **Maintenance drag** — a cloned system that is harder to evolve than a native design

So the right approach is **reinterpretation**, not duplication.

---

## 3. Product Thesis

### Thesis

OpenClaw can benefit from gstack-style workflows most in the areas of:

- framing
- planning
- review
- investigation
- reflection

These workflows are mostly model-and-process problems, not browser-runtime problems.

That means the highest-ROI path is:

1. port the high-leverage thinking workflows first
2. bind them to OpenClaw-native tools
3. add execution helpers only where the runtime clearly supports them

### What to preserve from gstack

- role-based specialist framing
- staged software workflow
- explicit review gates
- strong prompts that force decisions, not vague brainstorming
- high-agency attitude toward completion

### What to discard or postpone

- host installers and setup systems
- telemetry and contributor-mode machinery
- runtime assumptions tied to Claude directories
- custom browser binaries as an initial dependency
- sprawling docs as a substitute for tested behavior

---

## 4. Conversion Principles

### 4.1 Native over translated

If OpenClaw already has a first-class capability, use it directly.

Examples:
- use `sessions_spawn` for sub-agent work
- use `gh` / GitHub skill for GitHub operations
- use `memory_search` / `memory_get` for durable context
- use `cron` for periodic reminders or scheduled reviews
- use `exec` for local analysis and scripts

### 4.2 Thin skills, rich behavior

Each skill should be concise and operational.

- keep `SKILL.md` focused
- move detailed checklists and long examples into `references/`
- add `scripts/` only when deterministic execution is actually useful

### 4.3 No fake automation

Do not claim that a skill is “fully automated” unless the OpenClaw runtime and the skill instructions actually make that realistic and repeatable.

Prefer:
- explicit steps
- clear boundaries
- known handoff points
- visible assumptions

over magical claims.

### 4.4 Start with leverage, not completeness

Port the skills that improve decision quality early in the lifecycle.

That means planning and review first, not full QA/browser parity first.

### 4.5 Preserve judgment, not exact wording

The goal is not to cosplay gstack.
The goal is to preserve useful judgment patterns in a voice and structure that fits OpenClaw.

---

## 5. Skill Selection Strategy

## Tier 1: Build first

These are highest ROI and lowest runtime mismatch.

### 1. `plan-ceo-review`

**Why first**
- strong value in product reframing
- low dependence on external tooling
- highly compatible with PM workflows

**OpenClaw fit**
- mostly conversation + document analysis
- can use `read`, `write`, `memory_search`, `exec` lightly

### 2. `plan-eng-review`

**Why early**
- architecture/test/failure-mode review is widely useful
- naturally follows product framing

**OpenClaw fit**
- works well with repo docs, diffs, and targeted file reads
- may optionally spawn sub-agents later for deeper analysis

### 3. `review`

**Why early**
- immediate developer value
- bridges planning and implementation

**OpenClaw fit**
- use local git diff + file reads + optional `gh`
- avoid pretending to be an auto-fixer unless edits are actually made

### 4. `investigate`

**Why early**
- strong operational value
- creates a disciplined debugging mode

**OpenClaw fit**
- can combine `exec`, `read`, and optional sub-agents well

### 5. `retro`

**Why early-ish**
- useful once the other workflows exist
- can leverage git history and memory

**OpenClaw fit**
- easy to schedule via `cron` later if desired

## Tier 2: Consider after core pack stabilizes

### `office-hours`
Good fit, but needs careful tone and interaction design.

### `document-release`
Useful, but depends on docs conventions and release process maturity.

### `ship`
Potentially high value, but risky to over-automate too early.
Should only land after review flows are credible.

### `qa`
Worth implementing only as a narrower OpenClaw-native verification workflow: diff-aware testing, evidence-backed bug reporting, and regression follow-up using the repo's real test surfaces. Full browser-led parity remains out of scope.

### `qa-only`
Worth implementing only as the report-only counterpart to `qa`: same verification rigor, same honest runtime limits, but no quiet code changes or auto-fix claims.

### `design-review`
Worth implementing only as an artifact-first visual and UX review workflow grounded in screenshots, mockups, and frontend diffs. The live-site browser audit + auto-fix loop remains out of scope.

### `plan-design-review`
Worth implementing only as a pre-build UX and interaction-plan review against specs, wireframes, and user flows. It should stay honest about missing visuals and avoid pretending text-only plans can answer every visual-polish question.

## Tier 3: Postpone

### `browse`, `setup-browser-cookies`
These still depend heavily on a browsing/runtime story that should not be rushed.

### `careful`, `freeze`, `guard`
Conceptually useful, but in OpenClaw these should be designed around actual tool constraints, not copied as slogans.

### `codex`
Potentially useful as a second-opinion pattern, but OpenClaw already has ACP/sub-agent patterns. Needs native design.

---

## 6. Target Repository Structure

```text
gstackForOpenclaw/
├── README.md
├── docs/
│   ├── CONVERSION_PLAN.md
│   ├── SKILL_MATRIX.md
│   ├── ARCHITECTURE.md
│   └── DECISIONS/
├── skills/
│   ├── plan-ceo-review/
│   │   ├── SKILL.md
│   │   └── references/
│   ├── plan-eng-review/
│   │   ├── SKILL.md
│   │   └── references/
│   ├── review/
│   │   ├── SKILL.md
│   │   ├── references/
│   │   └── scripts/
│   ├── investigate/
│   └── retro/
└── prototypes/
    ├── prompts/
    └── scripts/
```

Notes:
- `skills/` should contain only actual reusable skills
- `docs/` should capture design decisions and comparison work
- `prototypes/` is for experiments before promoting them into a stable skill

---

## 7. Execution Model Mapping

## gstack concept → OpenClaw-native equivalent

| gstack concept | OpenClaw-native approach |
|---|---|
| slash skill invocation | normal user request + skill triggering by description |
| host-specific setup | none by default, rely on existing OpenClaw runtime |
| browse binary | postpone or redesign later |
| telemetry / contributor mode | omit initially |
| workflow state files | prefer conversation state, memory, repo docs, or explicit artifacts |
| Codex external review | `sessions_spawn` / ACP when genuinely needed |
| CLI task automation | `exec` with clear boundaries |

### Important implication

We should not build a fake command router first.
The first-class unit is the **skill**, not a meta-wrapper around slash commands.

---

## 8. Deliverables by Phase

## Phase 0 — Planning and comparison

### Deliverables
- this conversion plan
- skill prioritization matrix
- architecture notes
- source-to-target mapping notes

### Exit criteria
- clear decision on first 3 skills
- explicit non-goals documented
- OpenClaw-native principles agreed

## Phase 1 — Core planning skills

### Deliverables
- `skills/plan-ceo-review/SKILL.md`
- `skills/plan-eng-review/SKILL.md`
- supporting references for both

### Exit criteria
- both skills are concise and operational
- both skills avoid Claude-specific assumptions
- both can be used against a real repo or planning doc

## Phase 2 — Engineering review loop

### Deliverables
- `skills/review/SKILL.md`
- review checklists / references
- optional helper scripts only if needed

### Exit criteria
- review skill can analyze a real diff with clear output structure
- scope boundaries and “must fix / should fix” framing are stable

## Phase 3 — Debugging and reflection

### Deliverables
- `skills/investigate/SKILL.md`
- `skills/retro/SKILL.md`

### Exit criteria
- investigate enforces root-cause-first behavior
- retro can produce a useful report from repository activity

## Phase 4 — Optional execution expansions

Potential candidates:
- office-hours
- document-release
- ship
- codex-style second opinion pattern

### Exit criteria
- only proceed if earlier skills prove valuable in real use

---

## 9. Success Criteria

A successful conversion should meet these standards:

### Product quality
- skills feel native to OpenClaw, not awkwardly transplanted
- claims match actual behavior
- skills improve decision quality, not just produce verbose output

### Operational quality
- minimal runtime assumptions
- minimal setup burden
- compatible with normal repo workflows

### Maintenance quality
- each skill is understandable in isolation
- no giant monolithic router is required
- references/scripts are added only when justified

### User value
- a user can get value from the first 1-3 skills without adopting the full pack
- planning and review loops become more structured and repeatable

---

## 10. Risks and Mitigations

### Risk 1: Porting too literally

**Failure mode**
- skills inherit Claude-specific phrases, assumptions, and workflow oddities

**Mitigation**
- rewrite from principles, not from filenames

### Risk 2: Overbuilding orchestration too early

**Failure mode**
- time spent on meta-framework instead of useful skills

**Mitigation**
- ship individual skills first
- only add orchestration after repeated pain shows the need

### Risk 3: Fake confidence / fake automation

**Failure mode**
- README promises executable magic, actual results are inconsistent

**Mitigation**
- write docs after behavior is tested
- keep claims concrete and narrow

### Risk 4: Browser rabbit hole

**Failure mode**
- project gets stuck reproducing gstack browse mode

**Mitigation**
- explicitly postpone browser-heavy skills until planning/review skills are solid

---

## 11. Immediate Next Steps

1. Create `docs/SKILL_MATRIX.md`
   - original gstack skill
   - keep / modify / postpone / reject
   - rationale

2. Draft `skills/plan-ceo-review/SKILL.md`
   - concise trigger description
   - workflow structure
   - output format

3. Draft `skills/plan-eng-review/SKILL.md`
   - architecture review lens
   - failure/test matrix expectations

4. Define a common report style
   - summary first
   - risks
   - evidence
   - next action

5. Test the first skill against a real repo or feature brief

---

## 12. Decision Record: Current Stance

### Decided
- do not directly port all of gstack
- do not start with a router/meta-skill
- do not start with browser parity
- start with planning/review skills
- optimize for OpenClaw-native behavior, not cosmetic similarity

### Not yet decided
- whether to add explicit scripts for diff parsing
- whether to maintain a root umbrella skill later
- whether `office-hours` belongs in Tier 1 or Tier 2
- whether `ship` should exist as a skill or as a documented workflow pattern first

---

## 13. Guiding Sentence

**Build the smallest OpenClaw-native skill pack that preserves gstack’s leverage without inheriting its runtime baggage.**
