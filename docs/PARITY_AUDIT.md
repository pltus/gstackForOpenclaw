# gstack → gstackForOpenclaw Parity Audit

This document is a reality check, not a marketing page.

Its job is to answer one question clearly:

**How much of original gstack has actually been carried into this repo, and how much has been intentionally changed, narrowed, deferred, absorbed, or rejected because OpenClaw is a different runtime?**

## Status vocabulary

- **implemented** — present as a real skill in this repo
- **reinterpreted** — preserved in spirit, but intentionally rebuilt around OpenClaw instead of direct parity
- **deferred** — not implemented yet because a credible OpenClaw-native version is not ready
- **rejected** — not a good fit as a standalone port in this repo
- **absorbed** — intent survives, but as default operating guidance or another skill rather than a direct port

In practice, most implemented skills here are also **reinterpreted**. That is deliberate.

## Source baseline

This audit uses the public gstack skill list and workflow descriptions as the comparison baseline:

- gstack README skill table
- gstack `docs/skills.md` deep-dive descriptions

It does **not** assume hidden internal behavior, unpublished tooling, or direct runtime equivalence.

## Summary at a glance

### Overall parity posture

- **Preserved well:** planning, engineering review, investigation, retrospective, documentation, and several narrow release / QA / design review workflows
- **Preserved with major narrowing:** QA, design review, ship, benchmark, CSO, and plan-design-review
- **Not carried over yet on purpose:** browser-driven workflows, deployment automation, design generation workflows, explicit memory management, and most runtime/setup utilities
- **Not treated as standalone skills here:** safety wrappers and branded meta-tools that fit better as OpenClaw defaults or repo policy

### Coverage snapshot

| Bucket | Count |
|---|---:|
| Implemented / reinterpreted | 14 |
| Deferred | 11 |
| Rejected / absorbed | 8 |
| Total audited original skills/areas | 33 |

## Area-by-area audit

| Original gstack skill / area | Current status in gstackForOpenclaw | What was preserved | What was intentionally narrowed or changed | Why the difference exists in OpenClaw |
|---|---|---|---|---|
| `office-hours` | **implemented, reinterpreted** | The front-door product reframing role, challenge-first questioning, and routing into downstream planning | The OpenClaw version is a narrower planning/front-door workflow, not a full gstack lifecycle orchestrator with persistent project artifacts | OpenClaw can support product framing cleanly, but the original project-wide state machinery should not be implied without matching runtime conventions |
| `plan-ceo-review` | **implemented, reinterpreted** | Founder-style reframing, scope challenge, ambition vs focus tradeoffs | Rewritten as an OpenClaw-native planning skill rather than a direct slash-command clone with gstack persistence assumptions | This repo aims to preserve judgment quality, not gstack's exact storage and command model |
| `plan-eng-review` | **implemented, reinterpreted** | Architecture review, edge cases, diagrams, failure-mode thinking, test posture | Narrower and more repo/doc grounded; no claim of gstack's exact dashboard or artifact flow parity | OpenClaw supports strong repo analysis, but repo-level documentation is more credible than pretending identical review state plumbing exists |
| `plan-design-review` | **implemented, reinterpreted** | Pre-build UX/design critique, state coverage, missing-artifact detection | Narrowed into a plan-level review against briefs, wireframes, flows, and explicit unknowns rather than a complete designer-in-the-loop system | Text plans and attached artifacts are accessible in OpenClaw; broad interactive design-system authorship would overpromise |
| `design-consultation` | **deferred** | The idea that design deserves an explicit upstream workflow and not just late polish | Not implemented as a full design-system, research, mockup, and direction-setting skill | Current OpenClaw usage in this repo does not yet justify broad design research + generation claims without stronger artifact and browser support |
| `design-shotgun` | **deferred** | The desire for multi-variant design exploration before implementation | Not ported as a visual generation/approval loop | This repo intentionally avoids claiming image generation + browser comparison workflows it has not made operational |
| `design-html` | **deferred** | The idea of design-to-implementation translation after approval | Not implemented at all | gstack's specific design-to-code flow depends on artifacts and tooling patterns this repo has not recreated, and faking parity would mislead future users |
| `review` | **implemented, reinterpreted** | Paranoid post-implementation review posture, production-failure thinking, structured findings | Implemented as an OpenClaw-native review workflow rather than a promise of the same auto-fix and cross-skill routing behavior gstack describes | OpenClaw maps well to repo review, but this repo avoids overstating autonomous mutation or hidden workflow coupling |
| `investigate` | **implemented, reinterpreted** | Root-cause-first debugging, anti-thrash posture, hypothesis-driven investigation | Focused on disciplined diagnosis using OpenClaw-native file and command tools; avoids implying all of gstack's guardrail side effects | Investigation translates well; automatic runtime guard behavior does not cleanly transfer as a portable claim |
| `design-review` | **implemented, reinterpreted** | Design/UX review after artifacts or UI exist, explicit critique lens, quality bar against visible output | Recast as artifact-first rather than live-site browser audit + fix loop; no fake claim of always-open browser control or atomic visual fix automation | OpenClaw can review screenshots, mockups, recordings, and frontend evidence honestly; universal browser-fix parity would be fake |
| `qa` | **implemented, reinterpreted** | Evidence-first verification, test thinking, bug reporting, runtime honesty | Narrowed away from the original browse-heavy auto-fix loop into repo-native testing and verification with explicit limits | The repo can support credible QA only where tests, diffs, commands, and artifacts are real; generic browser-led claims would overstate capability |
| `qa-only` | **implemented, reinterpreted** | Report-only QA posture with no hidden mutation | Same narrowing as `qa`, but with an explicit no-fixing boundary | This keeps the useful verification/reporting shape while staying within OpenClaw's honest execution envelope |
| `ship` | **implemented, reinterpreted** | Release-readiness mindset, checklist discipline, final-mile handoff | Reduced to a narrow checklist/handoff workflow rather than one-command release machine, test bootstrapper, and PR automation suite | Release behavior is highly repo-specific; broad automation claims are fragile unless the exact environment is known |
| `land-and-deploy` | **deferred** | The idea that release should continue through merge, deploy, and verification | Not implemented | Deployment automation is one of the easiest areas to fake and one of the most infra-specific; this repo deliberately refuses generic bluffing here |
| `canary` | **deferred** | Post-deploy monitoring as a distinct concern | Not implemented | Useful in principle, but depends on deploy surfaces, URLs, telemetry, and often browser/runtime access this repo does not standardize |
| `benchmark` | **implemented, reinterpreted** | Performance measurement discipline and before/after thinking | Implemented as a thin, evidence-first benchmark workflow rather than a guaranteed browser/CWV tracking system | OpenClaw can run real measurements where commands exist, but universal web-performance parity is not credible without standard infra |
| `cso` | **implemented, reinterpreted** | Security review posture, threat modeling, confidence control | Implemented in a constrained review form rather than a claim of end-to-end security scanning parity | Security review translates conceptually, but false-positive control and evidence boundaries matter more than breadth claims |
| `document-release` | **implemented, reinterpreted** | Documentation drift cleanup after shipping changes | Reduced to a thin release/documentation workflow, not a promise to update every stale doc automatically | This repo prefers explicit doc maintenance over inflated auto-update claims |
| `retro` | **implemented, reinterpreted** | Reflection, learning loops, and turning work history into improvements | Narrower than gstack's broader cross-project/team-aware retrospective story | Repo-local retros are credible; cross-tool/team/project analytics would need additional memory/state machinery |
| `browse` | **deferred** | The belief that some workflows need direct web/UI inspection | Not implemented as a core skill in this repo | Browser access is a runtime capability question, not something this conversion should imply by documentation alone |
| `setup-browser-cookies` | **deferred** | The need to handle authenticated browser workflows safely | Not implemented | Sensitive and tightly coupled to browser automation infrastructure this repo intentionally does not fake |
| `autoplan` | **absorbed** | The desire for staged plan review across multiple lenses | Not a standalone skill; the intent is split across `office-hours`, `plan-ceo-review`, `plan-eng-review`, and `plan-design-review` | OpenClaw benefits more from strong individual planning skills than from pretending there is a fully encoded meta-pipeline |
| `learn` | **deferred** | The idea that patterns and preferences should compound over time | No dedicated skill exists yet | OpenClaw has broader memory concepts, but this repo has not yet turned them into a gstack-style explicit memory management skill without over-scoping |
| `codex` | **absorbed / rejected as standalone** | The value of second opinions and specialist delegation | Not ported as a branded direct skill | OpenClaw already has native sub-agent patterns; this repo should not create a redundant wrapper unless it adds real value |
| `careful` | **absorbed** | Safety posture and caution around destructive work | Not a standalone skill in this repo | In OpenClaw, core safety guidance and skill boundaries are a better fit than slogan-style safety commands |
| `freeze` | **absorbed** | Constraining edit scope during risky work | Not a standalone skill | Directory/file scope control is better handled via agent instructions, repo workflow, or future platform policy rather than a shallow skill clone |
| `guard` | **absorbed** | Combined caution + edit restriction mindset | Not a standalone skill | Same reason as `careful` and `freeze`: the principle matters more than mimicking the original command surface |
| `unfreeze` | **absorbed** | Releasing temporary edit constraints | Not a standalone skill | Only makes sense if `freeze` exists as a runtime primitive; that is not the model here |
| `connect-chrome` | **deferred** | The idea of interactive browser co-presence | Not implemented | This is heavily runtime-specific and should only land when actual OpenClaw browser control conventions exist |
| `setup-deploy` | **deferred** | One-time deploy configuration as a precursor to automated release steps | Not implemented | There is no honest generic deploy-detection story in this repo yet |
| `gstack-upgrade` | **rejected** | Self-maintenance matters for real toolchains | Omitted entirely | This repository is not copying gstack's install/update/distribution model, so the original updater does not transfer |
| install/setup/host generation flow | **rejected** | None of the host-specific generation machinery was a core product goal here | Entirely omitted | gstack's setup, build, and host-targeted skill generation are runtime/distribution features, not required for an honest OpenClaw reinterpretation |
| browse daemon / Chrome side-panel / headed-browser workflow | **deferred** | Recognition that browser workflows can be powerful when real | Entire area omitted from the current implementation | The repo explicitly avoids pretending that OpenClaw today matches gstack's browser runtime |
| project-state artifacts under `~/.gstack/projects/` | **reinterpreted / mostly omitted** | The value of durable artifacts between phases | Replaced by repo docs and skill-local guidance rather than a copied state directory model | OpenClaw can use docs and memory patterns, but this repo has not standardized a gstack-style project state store |
| telemetry / analytics / contributor-mode support | **rejected** | None as a priority for this conversion | Omitted | The repo is about workflow reinterpretation, not porting gstack's surrounding product/distribution stack |

## What this audit says plainly

### 1. This repo has strong **workflow parity**, not runtime parity

The implemented skills preserve a meaningful amount of gstack's thinking style:

- role-based review
- staged workflow
- challenge-first planning
- investigation discipline
- explicit output structure

But they do **not** recreate gstack's broader runtime story:

- browser daemon
- Chrome control
- deploy pipeline automation
- persistent project-state conventions
- host-specific setup/build/update flows

That difference is the main truth this repo should keep stating.

### 2. The strongest OpenClaw fit is still planning + review + diagnosis

The best-preserved areas are the same ones already prioritized in the repo:

- `office-hours`
- `plan-ceo-review`
- `plan-eng-review`
- `review`
- `investigate`
- `retro`

These translate cleanly because they depend more on judgment and artifact analysis than on runtime-specific automation.

### 3. QA and design parity exist only in narrowed form

This repo now has real `qa`, `qa-only`, `plan-design-review`, and `design-review` skills.
That is good progress.

But the honest framing is still:

- **plan-design-review** = pre-build design critique, not full design partnership
- **design-review** = artifact-first review, not guaranteed live-site browser audit/fix parity
- **qa / qa-only** = evidence-first verification, not generic browser-driven autonomous QA

Those distinctions are important and should remain visible.

### 4. The largest parity gaps are still deliberate, not accidental

The biggest missing areas are not oversights. They are explicit scope decisions:

- browser workflows
- deployment automation
- design generation pipelines
- explicit memory management
- installer/update/runtime support machinery

That is healthy. These are the easiest areas to oversell.

### 5. Two gaps deserve future revisits once the runtime story improves

If this repo expands again, the most sensible revisit candidates are:

1. **`learn`** — if OpenClaw memory patterns become stable enough for a real repo-facing skill
2. **some browser-adjacent review/QA layer** — but only when actual browser tooling is first-class and repeatable

`land-and-deploy` and `setup-deploy` should probably stay later than they first appear; infrastructure-specific bluffing is too risky.

## Recommended usage of this audit

Use this file as the repo's parity truth source when deciding whether to:

- add a new converted skill
- tighten a README claim
- explain why something was deferred
- decide whether a future skill is genuine parity, reinterpretation, or just wishful naming

If a future addition cannot state **what was preserved**, **what was narrowed**, and **why OpenClaw needs that difference**, it is probably not ready.
