# Office-hours routing guide

Use this guide when `office-hours` has already clarified the pain, decision, and likely next owner, and you need to route into a deeper skill without losing signal.

## Before handing off

Do not route onward until you can state, at minimum:

- the real decision
- the user pain or operational pain that seems most credible
- the current workaround
- the proposed wedge or next cut
- the main open questions still worth pressure-testing

If you cannot state those yet, stay in `office-hours`.

## Destination guide

### `plan-ceo-review`

Use when the main question is product wedge, ambition, user value, scope shape, or whether the idea deserves expansion, narrowing, or rejection.

Handoff packet should emphasize:

- target user and pain intensity
- why the current idea may be too small, too broad, or pointed at the wrong problem
- the wedge worth pressure-testing
- the biggest product assumptions still unproven

### `plan-eng-review`

Use when the problem is clear enough and the main question is feasibility, architecture, sequencing, rollout safety, interfaces, or test strategy.

Handoff packet should emphasize:

- what outcome the team is trying to achieve
- scope boundaries already decided
- technical unknowns or dependency risks
- rollout or migration concerns already visible

### `review`

Use when there is already a concrete diff, PR, or implementation to inspect.

Handoff packet should emphasize:

- what change was attempted
- what behavior matters most
- known risky paths, assumptions, or missing tests
- files, commits, or PR links to inspect first

### `investigate`

Use when the system is already misbehaving and the root cause is unclear.

Handoff packet should emphasize:

- observed symptoms
- expected vs actual behavior
- when and where the issue appears
- logs, traces, metrics, repro steps, or suspect components

### `retro`

Use when the work already happened and the team needs lessons, patterns, or process change.

Handoff packet should emphasize:

- what happened
- what outcome was expected
- what broke in decision-making, execution, or coordination
- what pattern is worth preventing or repeating

## Anti-patterns

Do not route onward just because:

- the conversation feels stuck but the problem is still vague
- you want a more impressive answer shape
- the request mentions architecture before the product problem is clear
- there is pressure to look busy instead of deciding

If none of the deeper skills fit cleanly, keep `office-hours` as a short framing and decision aid rather than inventing a heavier process.
