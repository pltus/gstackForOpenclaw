---
name: qa
description: Evidence-first QA workflow for feature branches, bug fixes, staging checks, and release candidates that need credible verification without pretending OpenClaw has built-in browser automation. Use when the goal is to turn a diff, test surface, or target URL into a concrete bug list, verification summary, and regression follow-up.
---

# QA

Treat QA as disciplined verification, not a vague request to “test it a bit.”

## Do

1. Read the request, diff, bug report, test results, and relevant docs first.
2. Identify the QA surface:
   - changed code paths in the current diff
   - an existing bug fix that needs re-verification
   - a local or staging environment with explicit access instructions
   - a release candidate that needs focused readiness checks
3. State what can actually be tested with the available tools and what cannot.
4. Prefer repo-native verification first: unit, integration, e2e, lint, smoke scripts, fixtures, and reproducible manual steps.
5. If a URL or running app is available, use the tools the runtime truly has; do not imply hidden browser automation.
6. Separate confirmed failures from unverified suspicions.
7. End with a practical QA verdict: **pass**, **pass with watchouts**, **fails verification**, or **not yet testable**.

## QA lenses

Check these in order:

- **Diff coverage**: which user-visible paths, APIs, jobs, or data flows changed?
- **Testability**: what can be verified right now from the repo, environment, and access provided?
- **Failure evidence**: which issues were reproduced directly, and how?
- **Regression protection**: what existing or missing automated tests would keep this from coming back?
- **Environment realism**: are results from local, CI, staging, or production-like conditions?
- **Release relevance**: which findings are blockers versus watchouts?

If you need sharper prompts, read `references/qa-checklist.md`.

## Output format

Use this structure:

### QA target
State what build, diff, feature, fix, or environment was tested.

### Test surface and method
List the commands, environments, fixtures, URLs, manual steps, and limitations.

### Confirmed findings
List reproduced bugs, broken expectations, or failing checks with evidence. If none, say `None.`

### Watchouts and unverified areas
List risky paths that were not fully tested or need different access/tooling. If none, say `None.`

### Regression coverage
State what automated coverage already exists and what should be added or tightened.

### QA verdict
State `Pass`, `Pass with watchouts`, `Fails verification`, or `Not yet testable`, with one short reason.

### Immediate next steps
Give the smallest useful follow-up actions for engineering, product, or release owners.

## Style

- Prefer concrete evidence, commands, and repro steps over generic “seems good” language.
- Do not equate “tests passed” with “QA complete” when important paths were not exercised.
- Do not claim browser, device, or production verification unless it actually happened.
- Keep blocker findings separate from lower-confidence suspicions.
- If the repo lacks a credible QA harness, say so directly and propose the minimum useful upgrade.
