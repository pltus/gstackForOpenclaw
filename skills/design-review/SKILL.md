---
name: design-review
description: Artifact-first design review for screenshots, mockups, storybook captures, frontend diffs, and shipped UI surfaces that need a sharp UX and visual critique without pretending OpenClaw can run an autonomous browser fix loop. Use when the team wants concrete design findings, prioritization, and implementation guidance grounded in visible evidence.
---

# Design Review

Review the product like a strong designer who can read both visuals and implementation tradeoffs.

## Do

1. Read the available visual evidence first: screenshots, mockups, recordings, design docs, component code, or frontend diffs.
2. State what artifacts were reviewed and what was missing.
3. Evaluate the UI at the right level:
   - user journey and information hierarchy
   - layout, spacing, typography, and contrast
   - interaction clarity and state transitions
   - responsiveness, accessibility, and implementation constraints
4. Separate high-confidence visual problems from taste-level suggestions.
5. If code is included, connect the critique to likely implementation hotspots without claiming fixes were applied unless they really were.
6. End with a practical design posture: **ready**, **ready with polish follow-ups**, **needs UX fixes**, or **blocked by missing artifacts**.

## Review lenses

Check these in order:

- **Task clarity**: can a user tell what to do first and why it matters?
- **Hierarchy and layout**: do emphasis, spacing, grouping, and density support the intended flow?
- **Visual consistency**: are typography, color, iconography, and component patterns coherent?
- **Interaction states**: are hover, focus, loading, empty, error, and success states clear enough?
- **Accessibility and resilience**: what looks fragile for keyboard users, low vision, narrow screens, or long content?
- **Implementation realism**: which improvements are cheap polish versus structural redesign?

If you need sharper prompts, read `references/design-review-checklist.md`.

## Output format

Use this structure:

### Review target
State the screen, flow, artifact set, and product goal being reviewed.

### Evidence reviewed
List the screenshots, mockups, code files, diffs, or docs used in the review, plus any important gaps.

### High-confidence findings
List the clearest UX or visual issues with impact and evidence. If none, say `None.`

### Lower-confidence polish ideas
List optional improvements or taste-level experiments. If none, say `None.`

### Implementation notes
Call out likely components, styles, assets, or design-system areas involved.

### Design posture
State `Ready`, `Ready with polish follow-ups`, `Needs UX fixes`, or `Blocked by missing artifacts`, with one short reason.

### Immediate next steps
Give the smallest useful actions for design, product, or engineering.

## Style

- Ground the critique in visible evidence, not generic design commandments.
- Do not invent screenshots, interactions, or browser behavior you did not actually inspect.
- Keep accessibility and state coverage visible instead of focusing only on static aesthetics.
- Distinguish user-harming issues from subjective taste tweaks.
- If the inputs are too thin for a serious review, say so directly and request the missing artifacts.
