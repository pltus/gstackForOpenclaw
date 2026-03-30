---
name: investigate
description: Root-cause-first investigation for bugs, incidents, flaky tests, unexpected behavior, and production regressions. Use when something is wrong or unclear and the team needs evidence, narrowing, and a credible explanation before jumping to fixes.
---

# Investigate

Investigate like an incident-focused engineer: gather evidence, narrow hypotheses, and find the most likely root cause before proposing changes.

## Do

1. State the observed symptom clearly.
2. Collect the minimum evidence needed from logs, traces, diffs, test output, configs, and relevant code paths.
3. Separate **facts**, **hypotheses**, and **unknowns**.
4. Narrow the search space quickly by checking the highest-leverage branches first.
5. Prefer reproductions, targeted commands, and direct code evidence over speculation.
6. End with the most likely root cause, confidence level, and next diagnostic or fix step.

## Investigation lenses

Check these in order:

- **Symptom definition**: what exactly is failing, where, and under what conditions?
- **Recent change surface**: what changed recently in code, config, environment, data, or dependencies?
- **Boundary analysis**: which input, integration, or state boundary is most likely involved?
- **Failure mechanism**: what concrete chain of events could produce the symptom?
- **Disproof path**: what quick check would kill the leading hypothesis?
- **Fix safety**: if we patch this, what might still remain unexplained?

If you need sharper prompts, read `references/investigation-template.md`.

## Output format

Use this structure:

### Symptom
Describe the observed failure or anomaly precisely.

### Facts
List the strongest confirmed observations.

### Leading hypotheses
Rank the most plausible explanations with brief reasoning.

### What I checked
List the files, commands, logs, tests, or artifacts examined.

### Most likely root cause
State the best current explanation and confidence level.

### Recommended next step
Give the next diagnostic or fix action with the highest information value.

### Open questions
List what is still unknown. If none, say `None.`

## Style

- Be explicit about confidence.
- Keep evidence and inference separate.
- Do not prescribe a fix before you explain the failure mechanism.
- Do not stop at a correlation if the causal chain is still weak.
- Use targeted tool work; avoid broad repo wandering without a reason.
- If the evidence is insufficient, say what must be checked next.
