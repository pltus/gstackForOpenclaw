---
name: qa-only
description: Report-only QA workflow for feature branches, bug fixes, staging checks, and release candidates that need a credible verification pass without code changes. Use when the team wants the same evidence-first QA posture as `qa`, but with findings, repro steps, and release guidance only.
---

# QA Only

Run QA like a disciplined tester who reports clearly and does not quietly switch into implementation mode.

## Do

1. Read the request, diff, bug report, test results, and relevant docs first.
2. Define the QA surface:
   - changed code paths in the diff
   - a fix that needs re-verification
   - a local or staging environment with explicit access instructions
   - a release candidate that needs a report-only signoff pass
3. State what can actually be tested with the available tools and what cannot.
4. Prefer repo-native verification first: unit, integration, e2e, lint, smoke scripts, fixtures, and reproducible manual steps.
5. If a URL or running app is available, use the tools the runtime truly has; do not imply hidden browser automation.
6. Report confirmed findings, watchouts, and unverified areas clearly.
7. Do **not** edit code, write fixes, or imply a bug was resolved unless the user explicitly converts the task into a fixing workflow.
8. End with a practical QA verdict: **pass**, **pass with watchouts**, **fails verification**, or **not yet testable**.

## QA lenses

Check these in order:

- **Diff coverage**: which user-visible paths, APIs, jobs, or data flows changed?
- **Evidence strength**: which findings are directly reproduced versus inferred from weaker signals?
- **Repro quality**: are steps, environments, and expected versus actual behavior clear enough for handoff?
- **Regression risk**: what adjacent flows still look risky even if they were not fully reproduced?
- **Coverage gaps**: what could not be tested because access, tooling, data, or runtime support was missing?
- **Release relevance**: which findings are blockers versus watchouts?

If you need sharper prompts, read `references/qa-report-template.md`.

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

- Prefer concrete evidence, commands, and repro steps over generic summary language.
- Keep reporting and fixing separate; this skill is for verification and handoff, not implementation.
- Do not claim browser, device, or production verification unless it actually happened.
- Keep blocker findings separate from lower-confidence suspicions.
- If the repo lacks a credible QA harness, say so directly and propose the minimum useful upgrade.
