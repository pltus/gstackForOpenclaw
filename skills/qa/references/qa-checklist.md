# QA checklist

Use these prompts to keep QA concrete and evidence-based.

## 1. Define the target before testing

- What exactly changed?
- Which routes, APIs, jobs, components, or workflows are in scope?
- Is this QA pass tied to a diff, a bug report, a release candidate, or a staging environment?
- What does “good enough to pass” mean here?

## 2. Prefer the strongest available evidence

Start with the most repeatable verification the repo already supports:

1. targeted automated tests
2. integration or e2e flows
3. deterministic CLI or script-based checks
4. reproducible manual steps against a running app
5. screenshots, logs, traces, or captured outputs

If stronger evidence is unavailable, say that clearly instead of pretending the weaker evidence is enough.

## 3. Diff-aware QA prompts

When testing a change set, ask:

- Which files and code paths likely changed behavior for users or operators?
- What old assumptions may no longer hold?
- Which edge cases are easy to miss because the happy path still works?
- Did the change alter validation, permissions, async timing, caching, migrations, or defaults?
- Which adjacent flows deserve a smoke test because they share the same code path?

## 4. Bug reproduction prompts

For each issue you think you found:

- What exact steps reproduce it?
- What did you expect to happen?
- What actually happened?
- Can you attach a failing command, stack trace, screenshot, or output snippet?
- Is it always reproducible, intermittent, or environment-specific?
- How severe is it for a real user or operator?

## 5. Regression coverage prompts

After verification, ask:

- What existing test would have caught this?
- If no test exists, what is the smallest worthwhile regression test to add?
- Should coverage live at the unit, integration, or end-to-end layer?
- Is the failure better caught by assertions, fixtures, contract tests, or smoke checks?

## 6. Honest limits

Always call out what you could not verify, such as:

- authenticated flows without credentials
- browser-specific behavior without browser tooling
- mobile-specific UX without a mobile test surface
- deploy-only behavior without staging or production access
- flaky environments that invalidate the result

A narrow, honest QA report is better than a broad fictional one.
