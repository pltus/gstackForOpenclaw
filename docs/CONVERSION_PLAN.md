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

Current truth-source note:

- [PARITY_AUDIT.md](PARITY_AUDIT.md) is the repo’s source of truth for current parity status and rationale.
- [SKILL_MATRIX.md](SKILL_MATRIX.md) preserves both historical prioritization and current status.
- This plan now treats the earlier tiers/phases mostly as implementation history rather than as an open-ended forward roadmap.

Still intentionally deferred: browser-parity, deployment-heavy, memory-explicit, and strongly environment-specific workflows. `plan-design-review`, `qa`, `qa-only`, and `design-review` are now live in narrower planning-first / evidence-first / artifact-first forms that do not promise browser parity or finished-design certainty. `land-and-deploy` remains deferred because deployment automation would still be too environment-specific.

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
2. bind them to OpenClaw-native tools and patterns
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
- use `exec` for local analysis and scripts
- use native sub-agent patterns when specialist parallel work is genuinely helpful
- use repo docs or explicit artifacts instead of inventing hidden workflow state
- use GitHub tooling where repository workflows already depend on GitHub

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

## 5. Historical Skill Selection Strategy

This section is kept as planning history.
It explains how the earlier implementation waves were prioritized.
For the repo’s **current** state, use `PARITY_AUDIT.md` and `SKILL_MATRIX.md`.

## Historical Tier 1: Build first

These were the highest-ROI, lowest-mismatch starting points.

### 1. `plan-ceo-review`

**Why first**
- strong value in product reframing
- low dependence on external tooling
- highly compatible with PM workflows

**OpenClaw fit**
- mostly conversation + document analysis
- can use `read`, `write`, and `exec` lightly

### 2. `plan-eng-review`

**Why early**
- architecture/test/failure-mode review is widely useful
- naturally follows product framing

**OpenClaw fit**
- works well with repo docs, diffs, and targeted file reads
- may optionally use sub-agents later for deeper analysis

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
- can leverage git history and explicit repo context

**OpenClaw fit**
- works without requiring browser or deployment machinery

## Historical Tier 2: Consider after core pack stabilizes

Several skills in this tier have now been implemented in narrower forms.
The tier is preserved here only to show the original sequencing logic.

### `office-hours`
Good fit, but originally needed careful tone and interaction design.
Now implemented in a narrower front-door framing form.

### `document-release`
Originally dependent on docs conventions and release process maturity.
Now implemented as a thin documentation-oriented workflow.

### `ship`
Originally seen as high value but risky to over-automate too early.
Now implemented as a narrow checklist/handoff skill, not generic deployment automation.

### `qa`
Originally worth implementing only as a narrower OpenClaw-native verification workflow.
That narrower evidence-first implementation now exists; full browser-led parity still does not.

### `qa-only`
Originally scoped as the report-only counterpart to `qa`.
That narrower non-mutating implementation now exists.

### `design-review`
Originally worth implementing only as an artifact-first visual and UX review workflow.
That narrower artifact-first implementation now exists; live-site browser audit parity still does not.

### `plan-design-review`
Originally worth implementing only as a pre-build UX and interaction-plan review against specs, wireframes, and user flows.
That narrower implementation now exists.

### `design-consultation`
Still deferred. The current repo can support product framing, plan-level UX review, and artifact-first critique, but not a broad design-system-plus-mockup-plus-research workflow without drifting into vague or fictional promises.

## Historical Tier 3: Postpone

These areas were postponed for runtime reasons, and that defer logic still largely holds.

### `browse`, `setup-browser-cookies`
These still depend heavily on a browsing/runtime story that should not be rushed.

### `careful`, `freeze`, `guard`
Conceptually useful, but in OpenClaw these are better expressed through instructions, policy, or future platform behavior than through slogan-skills.

### `codex`
Potentially useful as a second-opinion pattern, but OpenClaw already has native sub-agent patterns. It still does not justify a branded standalone skill.

---

## 6. Repository Structure Notes

The original planning pass used a **target-state sketch** here.
Some of that sketch was deliberately never created, and some parts were absorbed into simpler repo conventions.

### Historical sketch only, not current repo truth

The earlier target structure assumed items such as:

- a standalone `docs/ARCHITECTURE.md`
- `prototypes/` for experimental prompts/scripts
- per-skill helper `scripts/` in places like `skills/review/`

Those should be read as planning-era placeholders, not as claims about what exists in this clone today.

### Current repo shape in this clone

```text
gstackForOpenclaw/
├── README.md
├── docs/
│   ├── CONVERSION_PLAN.md
│   ├── IMPLEMENTATION_INVENTORY.md
│   ├── PARITY_AUDIT.md
│   ├── READINESS_LEVELS.md
│   ├── SKILL_MATRIX.md
│   ├── VALIDATION_SUMMARY.md
│   └── DECISIONS/
├── skills/
│   └── <implemented-skill>/
│       ├── SKILL.md
│       └── references/
└── scripts/
    └── validate-docs.sh
```

Notes:
- `skills/` should contain only actual reusable skills
- `docs/` should capture design decisions and comparison work
- `scripts/validate-docs.sh` is a lightweight structural check, not a runtime certification harness
- if a future `prototypes/` area is added, it should be described as an experiment area at that time rather than implied in current-reference docs

---

## 7. Execution Model Mapping

## gstack concept → OpenClaw-native equivalent

| gstack concept | OpenClaw-native approach |
|---|---|
| slash skill invocation | normal user request + skill triggering by description |
| host-specific setup | none by default, rely on existing OpenClaw runtime |
| browse binary | postpone or redesign later |
| telemetry / contributor mode | omit initially |
| workflow state files | prefer repo docs, explicit artifacts, or visible working context |
| Codex external review | native sub-agent patterns when genuinely needed |
| CLI task automation | `exec` with clear boundaries |

### Important implication

We should not build a fake command router first.
The first-class unit is the **skill**, not a meta-wrapper around slash commands.

---

## 8. Deliverables by Phase

## Phase 0 — Planning and comparison *(complete)*

### Deliverables
- this conversion plan
- skill prioritization matrix
- architecture notes
- source-to-target mapping notes

### Exit criteria
- clear decision on first 3 skills
- explicit non-goals documented
- OpenClaw-native principles agreed

## Phase 1 — Core planning skills *(complete)*

### Deliverables
- `skills/plan-ceo-review/SKILL.md`
- `skills/plan-eng-review/SKILL.md`
- supporting references for both

### Exit criteria
- both skills are concise and operational
- both skills avoid Claude-specific assumptions
- both can be used against a real repo or planning doc

## Phase 2 — Engineering review loop *(complete)*

### Deliverables
- `skills/review/SKILL.md`
- review checklists / references
- optional helper scripts only if needed

### Exit criteria
- review skill can analyze a real diff with clear output structure
- scope boundaries and “must fix / should fix” framing are stable

## Phase 3 — Debugging and reflection *(complete)*

### Deliverables
- `skills/investigate/SKILL.md`
- `skills/retro/SKILL.md`

### Exit criteria
- investigate enforces root-cause-first behavior
- retro can produce a useful report from repository activity

## Phase 4 — Narrow execution and review expansions *(complete for the current scope)*

Completed or substantially completed candidates in this wave:
- office-hours
- document-release
- ship
- benchmark
- cso
- plan-design-review
- design-review
- qa
- qa-only

Still **not** promoted from this wave into implementation:
- `design-consultation`
- browser-heavy workflows
- deployment-heavy workflows
- explicit memory-management skill work
- branded second-opinion wrapper skills

### Exit criteria
- implemented expansions stay narrow, honest, and tool-realistic
- deferred areas remain explicitly deferred instead of being hand-waved into scope
- validation confirms trigger clarity, workflow coherence, and internal consistency across the newer skills

### Current interpretation

There is no committed “Phase 5” broadening wave today.
The current strategy is to keep the repo honest, tighten docs, and revisit deferred areas only when the runtime case becomes concrete.

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

## 11. Current Next Steps

1. Keep validating the implemented pack at the repo level
   - documentation shape
   - trigger clarity
   - workflow coherence
   - cross-link and reference integrity

2. Keep tightening docs when planning-era wording drifts behind implementation reality
   - phase labels
   - status buckets
   - defer logic
   - current-state source-of-truth references

3. Revisit deferred skills only when the runtime story becomes concrete enough to describe honestly
   - stronger browser support
   - clearer deployment conventions
   - repeatable design-input bundles
   - stable memory patterns if `learn` ever becomes real

4. Prefer small credibility upgrades over broad scope expansion
   - sharper docs
   - clearer boundaries
   - better validation notes
   - no new broad implementation wave without a concrete runtime reason

---

## 12. Decision Record: Current Stance

### Decided
- do not directly port all of gstack
- do not start with a router/meta-skill
- do not start with browser parity
- start with planning/review skills
- optimize for OpenClaw-native behavior, not cosmetic similarity
- treat the current implemented pack as broadly complete for this scope, with selective deferred revisits only when justified

### Not yet decided
- whether `learn` should ever exist as an explicit skill rather than remain an implicit pattern
- whether any browser-adjacent review layer becomes honest enough to promote beyond defer status
- whether deployment workflows, if ever added, should be repo-specific templates rather than generic skills

### Newly reaffirmed
- `design-consultation` stays deferred until there is a narrower, repeatable, OpenClaw-native shape for it
- the current repo has enough coverage in planning/design/QA to prioritize validation and documentation cleanup over new broad skills
- the parity audit should stay the source of truth when README or matrix wording starts drifting

---

## 13. Guiding Sentence

**Build the smallest OpenClaw-native skill pack that preserves gstack’s leverage without inheriting its runtime baggage.**
