---
name: plan-design-review
description: Design-plan review for PRDs, product specs, wireframes, UX briefs, and concept docs that need a sharper interaction and experience critique before implementation starts. Use when the team wants to pressure-test a proposed UX direction, surface AI-slop planning gaps, and tighten the plan without pretending finished UI or browser validation already exists.
---

# Plan Design Review

Review the proposed product experience like a senior designer before code is written: protect user clarity, interaction quality, and product coherence while staying honest about missing artifacts.

## Do

1. Read the plan, PRD, spec, wireframes, user flows, and any supporting examples first.
2. Restate the intended user outcome and the proposed experience shape.
3. State what design evidence exists and what is still missing:
   - text-only plan
   - wireframes or lo-fi mockups
   - screenshots of comparable current UX
   - component or design-system constraints
4. Judge the plan at the right level:
   - user job and task flow
   - information hierarchy and screen structure
   - interaction model and state coverage
   - clarity of defaults, feedback, and failure handling
   - consistency with existing product patterns
5. Separate structural design problems from lower-confidence aesthetic suggestions.
6. End with a practical posture: **ready with minor UX edits**, **needs flow tightening**, **needs scope reduction**, or **blocked by missing design artifacts**.

## Review lenses

Check these in order:

- **User goal clarity**: is the actual user job clear, or is the plan still feature-language without a crisp user outcome?
- **Flow shape**: does the proposed sequence feel understandable, efficient, and resilient under real usage?
- **Hierarchy and information load**: what will be primary, secondary, hidden, or overloaded?
- **State coverage**: are empty, loading, validation, error, permission, and success states designed well enough to build?
- **Pattern fit**: does the plan align with existing product or design-system conventions, or does it quietly require a new pattern?
- **Buildability**: which design risks are cheap to resolve in the plan now versus expensive after implementation starts?

If you need sharper prompts, read `references/design-plan-questions.md`.

## Output format

Use this structure:

### Verdict
One short paragraph with the design posture and why.

### Intended experience
Describe the user workflow, key surfaces, and what good execution would feel like.

### What is solid
List the strongest parts of the current design plan.

### What is under-specified or risky
List the biggest UX, interaction, hierarchy, or state-coverage gaps.

### Critical states and edge cases
Call out the states, transitions, or content conditions that should be designed before build starts.

### Recommended design shape
Describe the flow, structure, or decision changes that would make the plan stronger.

### Next actions
Give 3-6 concrete design, product, or engineering follow-ups.

## Style

- Lead with the design verdict, not design theater.
- Ground the review in the actual plan artifacts that exist.
- Do not pretend visual polish can be fully judged from a text-only spec.
- Distinguish must-fix UX gaps from optional taste exploration.
- Prefer pre-build clarity that reduces rework later.
