# Decision: defer `design-consultation` for now

## Status
Deferred after the current expansion pass.

## Why

`design-consultation` is one of the easiest skills to make sound impressive while quietly overpromising.

In upstream gstack, the concept stretches across design-system creation, landscape research, creative-direction exploration, and realistic mockup generation. In this OpenClaw-native repo, that scope is still too broad to package honestly as a thin operational skill.

The current repo can support:

- product framing via `office-hours`
- pre-build UX pressure-testing via `plan-design-review`
- artifact-first critique via `design-review`

What it cannot yet support credibly as a reusable generic skill is all of the following in one narrow workflow:

- broad design research with dependable source gathering
- generated mockup or visual-direction claims with consistent quality
- a reusable design-system-from-scratch workflow that fits arbitrary repos
- implied browser- or canvas-level design iteration parity

## Narrowing decision

Do **not** force `design-consultation` into the repo yet.

If this area is revisited later, it should probably be narrowed into one of these more honest shapes:

1. **Design direction brief**
   A planning skill that turns product context into a concise UX direction memo, without claiming mockups or visual system generation.
2. **Design reference synthesis**
   A research-and-comparison skill grounded in user-provided references and explicit source limits.
3. **UI concept critique**
   A follow-on skill for reviewing already-provided concepts, sketches, or mockups rather than inventing them from scratch.

## Revisit trigger

Revisit only if the repo gains stronger, repeatable support for at least one of:

- trustworthy design-reference gathering
- dependable artifact generation or user-supplied mockups as a standard input
- a clearer common output shape for design-direction work across multiple repos

Until then, `office-hours` + `plan-design-review` + `design-review` is the cleaner OpenClaw-native story.
