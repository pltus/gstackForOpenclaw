# Investigation template

Use this template when the problem is ambiguous and you need a disciplined debugging pass.

## 1. Symptom framing

- What failed, for whom, and since when?
- Is the issue deterministic, flaky, or environment-specific?
- What is the exact error, bad output, or missing behavior?

## 2. Fast narrowing

- What changed most recently in code, config, infra, data, or dependencies?
- Which subsystem owns the first observable failure?
- Can the issue be reproduced locally, in tests, or with a targeted command?

## 3. Evidence log

Track findings as:

- **Fact** — directly observed from code, logs, commands, or tests
- **Hypothesis** — plausible explanation not yet proven
- **Unknown** — important gap that blocks confidence

## 4. Disproof questions

- What quick check would eliminate the top hypothesis?
- What evidence would prove the symptom comes from a different subsystem?
- What looks suspicious but is probably incidental noise?

## 5. Exit condition

An investigation is ready to hand off when you can state:

- the most likely root cause
- why it explains the observed symptom better than alternatives
- what next step should confirm or fix it
