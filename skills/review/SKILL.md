---
name: review
description: Engineering review for diffs, pull requests, commits, and in-progress implementations. Use when the task is to find correctness bugs, risky changes, test gaps, rollout hazards, or unclear design decisions before code lands.
---

# Review

Review the change like a sharp teammate who is trying to prevent bad merges, not maximize comment count.

## Do

1. Read the diff, changed files, and any relevant issue, PR description, or design doc first.
2. Understand what the author is trying to change before judging the details.
3. Prioritize correctness, safety, and maintainability over style.
4. Separate findings into severity bands:
   - **Must fix**: likely bug, broken assumption, missing safeguard, or unacceptable risk.
   - **Should fix**: important but not necessarily merge-blocking.
   - **Question**: unclear intent, tradeoff, or missing context.
5. Support findings with evidence from the diff, file behavior, or execution results when available.
6. If no meaningful issues are found, say so clearly and list any residual watchouts.

## Review lenses

Check these in order:

- **Behavior correctness**: will the code do what the change claims?
- **Edge cases**: what breaks with empty input, concurrency, retries, null state, auth, or partial failure?
- **Compatibility**: does this break callers, data contracts, migrations, or existing workflows?
- **Operational risk**: what could fail at runtime, in deployment, or under load?
- **Test coverage**: do tests prove the risky paths, or only the happy path?
- **Code health**: is the implementation understandable enough to change safely later?

If you need sharper prompts, read `references/review-checklist.md`.

## Output format

Use this structure:

### Verdict
One short paragraph: ready, ready with fixes, or not ready.

### Must fix
List the blocking findings with file/behavior evidence. If none, say `None.`

### Should fix
List important non-blocking findings. If none, say `None.`

### Questions
List unclear assumptions or design choices that need answers. If none, say `None.`

### Positive notes
Call out anything notably solid, especially tests, simplicity, or risk reduction.

### Suggested next step
State the most useful immediate action for the author.

## Style

- Lead with the verdict.
- Be concrete: mention files, functions, paths, or scenarios.
- Avoid drive-by nitpicks unless they hide real risk.
- Prefer fewer high-signal comments over many weak ones.
- Do not invent issues without evidence.
- Do not auto-fix unless the task explicitly includes editing.
