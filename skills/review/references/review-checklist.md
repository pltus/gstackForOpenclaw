# Review checklist

Use these prompts when you need a more systematic pass over a code change.

## Change intent

- What user, operator, or developer outcome is this change trying to improve?
- Which files contain the real behavior change versus setup noise?
- What assumptions does the change make about existing system behavior?

## Correctness

- Does the code match the stated intent?
- Are there paths where state becomes inconsistent, stale, or partially updated?
- What happens on retries, duplicate events, race conditions, or reordered work?
- Are default values, empty inputs, and error returns handled safely?

## Safety and operations

- Could this leak data, skip auth, overrun limits, or break isolation boundaries?
- What will happen if dependencies time out, fail, or return malformed data?
- Does rollout require migrations, flags, or backfills that are not represented in the diff?
- Is there a failure mode that will be silent without logging or metrics?

## Tests

- Which risky behaviors are directly tested?
- Do tests prove the negative paths and boundary conditions?
- Are tests too mocked to catch the real integration risk?
- What is still unproven after the current test set?

## Maintainability

- Is the implementation simpler or more complex than necessary?
- Are important invariants obvious from the code?
- Will the next engineer understand why this was built this way?
- Is there a smaller refactor that would remove risk instead of documenting it?
