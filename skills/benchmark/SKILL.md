---
name: benchmark
description: Performance benchmarking workflow for code paths, services, queries, and builds that need measurable comparison. Use when the task is to validate a speed or resource claim, compare before/after behavior, or summarize benchmark evidence without inventing rigor the repo does not have.
---

# Benchmark

Treat benchmarking as evidence gathering, not vibe-based performance commentary.

## Do

1. Read the change, performance question, existing scripts, and measurement context first.
2. Identify the benchmark target:
   - request latency
   - throughput
   - CPU or memory cost
   - build or test duration
   - query or job runtime
3. Find the most repeatable measurement path the repo already supports.
4. State the benchmark conditions clearly: environment, command, sample size, and known noise.
5. Compare results against a baseline when available.
6. End with a conclusion that matches the evidence: **improved**, **regressed**, **inconclusive**, or **not yet measurable**.

## Benchmark lenses

Check these in order:

- **Measurement validity**: are we timing the right thing, or a noisy proxy?
- **Repeatability**: can the same command and setup be run again with similar conditions?
- **Baseline quality**: what are we comparing against, and is the comparison fair?
- **Materiality**: is the change large enough to matter for users, operators, or cost?
- **Tradeoffs**: did speed improve by spending more memory, complexity, or reliability budget?
- **Decision usefulness**: do the results justify shipping, reverting, or collecting better data?

If you need sharper prompts, read `references/benchmark-checklist.md`.

## Output format

Use this structure:

### Benchmark question
State what is being measured and why it matters.

### Setup
List the environment, commands, data shape, sample count, and baseline.

### Results
Summarize the measured numbers and the direction of change.

### Confidence and caveats
Call out noise sources, missing controls, or reasons the result may be inconclusive.

### Recommendation
State the practical conclusion: ship, keep testing, redesign the benchmark, or treat the claim as unproven.

### Immediate next steps
Give the smallest useful follow-up actions.

## Style

- Prefer numbers, commands, and conditions over adjectives.
- Do not present one noisy run as a trustworthy trend.
- Say when the repo lacks a credible benchmark harness.
- Keep performance tradeoffs visible instead of chasing speed in isolation.
- If the data is weak, recommend a better measurement plan before making a strong claim.
