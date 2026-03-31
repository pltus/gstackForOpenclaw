# Notes from reviewing `claw-code`

This note is a planning artifact for `gstackForOpenclaw`.
It records what seems worth learning from the public `claw-code` repository **before** we copy any ideas into implementation.

## Scope and confidence

These notes are grounded only in publicly visible signals from the checked-out repo:

- `README.md`
- visible `src/` layout
- visible CLI surface in `src/main.py`
- visible tests in `tests/test_porting_workspace.py`

They do **not** assume hidden internals, production usage, or runtime quality beyond what the repo itself shows.

## What `claw-code` appears to be

At a public-repo level, `claw-code` looks less like a finished end-user harness and more like a **Python-first porting workspace / research scaffold** for a larger archived system.

What the repo visibly contains:

- a Python `src/` tree with a real CLI entrypoint
- a large amount of mirrored inventory metadata for commands, tools, and subsystem names
- placeholder packages that expose archive snapshot facts from JSON under `src/reference_data/`
- lightweight runtime-style shims for routing, bootstrap summaries, session persistence, permission filtering, and mode switching
- tests that mostly verify **inventory shape, summary output, and CLI/report behavior**, not deep runtime execution

In other words, the public repo seems strongest as:

1. a **catalog and mapping layer**
2. a **port-status / parity-reporting layer**
3. a **small simulation shell** around mirrored commands, tools, and sessions

It does **not** publicly read as a mature, full-parity replacement runtime yet.

## Public patterns that look relevant to `gstackForOpenclaw`

### 1. Inventory-first structure

`claw-code` is explicit about what exists:

- manifest of Python files (`port_manifest.py`)
- mirrored command inventory (`commands.py`)
- mirrored tool inventory (`tools.py`)
- parity / summary commands exposed through the CLI

This is relevant because `gstackForOpenclaw` is also a translation effort, not a greenfield product. A lightweight inventory layer can make scope decisions more visible and reduce hand-wavy parity claims.

### 2. Readiness reporting as a first-class output

The repo exposes status through commands like:

- `summary`
- `manifest`
- `parity-audit`
- `commands`
- `tools`
- `bootstrap`
- `setup-report`

That is useful for us conceptually. Even if we never copy this shape directly, the idea of **asking the repo to explain its own current state** is strong.

### 3. Separate metadata from executable behavior

A lot of `claw-code`'s current value comes from structured metadata rather than pretending everything is fully implemented. For example:

- command/tool snapshots are loaded from JSON
- placeholder subsystem packages expose counts and sample files
- command/tool execution paths return honest "mirrored ... would handle ..." style responses

That honesty matters. `gstackForOpenclaw` has the same risk: overclaiming future automation when the real deliverable is currently guidance, structure, and narrow workflows.

### 4. Validation focused on claims, not fantasy

The tests in `tests/test_porting_workspace.py` mostly verify that:

- the CLI runs
- summaries render
- inventories are non-trivial
- filters work
- session/report shims behave consistently

That suggests a practical validation posture: first validate the truth of the repo's public claims, then expand runtime ambition later.

### 5. Clear distinction between mirrored surface and real execution

Publicly, the repo seems careful to separate:

- mirrored command/tool surfaces
- bootstrap/routing summaries
- actual runtime equivalence

That distinction is directly useful to us. `gstackForOpenclaw` should keep distinguishing between:

- implemented OpenClaw skills
- parity-analysis docs
- future orchestration ideas
- runtime-dependent areas that are still deferred

## What seems less relevant or should not be copied

### 1. Do not copy the repo's broader origin-story framing

`claw-code`'s README is tied to a specific public backstory, publicity wave, and harness-rewrite narrative. That framing is not reusable for `gstackForOpenclaw` and should not influence our product posture.

### 2. Do not infer maturity from breadth of filenames

The repo has a broad-looking surface area, but the public code shows that much of this surface is mirrored metadata, placeholders, or report-generation support. We should not treat "many modules exist" as proof of runtime parity.

### 3. Do not copy command/tool counts as a goal by themselves

`claw-code` benefits from inventory breadth because it is explicitly a porting workspace. `gstackForOpenclaw` is different: high command count is not success. Credible, narrow skill quality matters more than mirrored surface area.

### 4. Do not import placeholder-heavy architecture unless it solves a real repo problem

Placeholder packages backed by snapshot JSON make sense for archive-porting work. They would be unnecessary baggage for us unless we decide to build a real inventory or audit layer.

### 5. Do not overread the small runtime shims

The public CLI exposes route/bootstrap/turn-loop/session behaviors, but the visible implementations are still lightweight. We should treat them as examples of shape and reporting, not as proof that this repo has already solved general multi-agent runtime design.

## Concrete ideas worth borrowing later

These are **follow-up candidates**, not this-stage implementation work.

### Idea A — add a small repo inventory / status surface

Potential artifact:

- `docs/IMPLEMENTATION_INVENTORY.md` or similar

What it would track:

- implemented skills
- narrowed skills
- deferred skills
- validation status per skill or per workflow family
- repo-level assumptions and limits

Why it may help:

- keeps parity truth separate from README positioning
- makes future expansion less ad hoc
- gives us a single place to record "real / narrow / deferred"

### Idea B — add readiness levels for skills

Potential structure:

- `documented`
- `implemented`
- `validated-structure`
- `validated-workflow`
- `runtime-dependent`

Why it may help:

- avoids binary "done vs not done"
- matches the way this repo already operates in practice
- makes it easier to explain honest confidence levels to future users

### Idea C — add lightweight validation contracts

Potential checks:

- every skill has a clear trigger boundary
- every referenced file exists
- every output format section exists
- deferred decisions link to rationale
- README/doc status statements do not drift

Why it may help:

- validates our actual promises
- catches documentation drift early
- gives future contributors a concrete definition of "repo is still honest"

### Idea D — make a small "what not to port" register

Potential artifact:

- `docs/NON_GOALS.md` or a section inside the parity audit

Focus:

- workflows that depend on browser/runtime/deploy assumptions
- patterns that are only branding wrappers in OpenClaw
- anything that would create fake parity if copied literally

Why it may help:

- keeps future scope decisions disciplined
- reduces repeat debates about obviously weak-fit features

## Recommendation for `gstackForOpenclaw`

The best lesson from `claw-code` is **not** "copy its structure."
The best lesson is:

> make repo truth inspectable, keep mirrored/partial status explicit, and validate public claims before chasing broader automation.

For our repo, that likely means:

1. keep skills and parity docs as the main product surface
2. consider adding one small inventory/readiness layer later
3. keep rejecting breadth that would only inflate apparent maturity

## Top follow-up ideas surfaced by this review

1. **Add a lightweight implementation inventory/readiness doc** so status is inspectable without bloating the README.
2. **Define readiness levels for skills** so "implemented" and "credible" are not treated as the same thing.
3. **Create repo-level validation checks for honesty/consistency** instead of only validating file presence informally.
