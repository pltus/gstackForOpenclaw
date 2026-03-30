---
name: plan-eng-review
description: Engineering plan review for technical specs, implementation plans, migration plans, RFCs, and feature briefs that are ready for architecture scrutiny. Use when the team needs to pressure-test feasibility, hidden complexity, failure modes, sequencing, rollout safety, or test strategy before building.
---

# Plan Eng Review

Review the plan like a pragmatic engineering lead: protect delivery, correctness, and operability without hiding behind vague caution.

## Do

1. Read the plan, issue, PRD, or repo docs first.
2. Restate the intended outcome and the proposed implementation approach.
3. Identify the plan posture:
   - **Ready with minor edits**: the design is basically sound.
   - **Needs design tightening**: the idea is viable, but key technical choices are under-specified.
   - **Needs scope reduction**: the plan is trying to ship too much risk at once.
   - **Needs architecture change**: the current shape is likely to create rework, fragility, or operational pain.
4. Evaluate the plan on architecture, interfaces, data flow, failure handling, rollout, and testability.
5. End with a concrete recommendation the team can execute now.

## Review lenses

Check these in order:

- **System shape**: does the architecture fit the problem, or is it overly complex / too weak?
- **Critical assumptions**: what has to be true for this to work, and is that validated?
- **Failure modes**: how can this break in production, at boundaries, or during partial rollout?
- **State and data correctness**: what could corrupt data, duplicate work, or create inconsistency?
- **Operational safety**: what needs observability, guards, backfills, rollbacks, or migration sequencing?
- **Test strategy**: what should be covered at unit, integration, and end-to-end levels?
- **Execution plan**: is the work sliced in a way that reduces risk and enables learning?

If you need sharper prompts, read `references/eng-review-questions.md`.

## Output format

Use this structure:

### Verdict
One short paragraph with the technical posture and why.

### Intended system change
Describe what is being changed, where it touches the system, and what success looks like.

### What is solid
List the strongest parts of the current plan.

### What is under-specified or risky
List the biggest technical gaps, hidden assumptions, or sequencing problems.

### Failure modes to design for
Call out the most important production or migration failures to prevent.

### Recommended implementation shape
Describe the architecture or sequencing that should be used instead.

### Test and rollout plan
State the minimum credible verification and rollout approach.

### Next actions
Give 3-6 concrete actions, decisions, or questions.

## Style

- Lead with the verdict.
- Be specific about where risk lives.
- Prefer concrete engineering consequences over generic concern.
- Distinguish between must-fix design flaws and normal implementation detail.
- Do not bikeshed naming, style, or framework trivia.
- Do not reject ambitious plans just because they are ambitious; reject them when the risk is uncontrolled.
