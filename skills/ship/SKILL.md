---
name: ship
description: Thin shipping readiness workflow for features, fixes, and releases that are close to going live. Use when the team needs a final go/no-go pass across scope, review status, rollout safety, and handoff steps without pretending deployment is fully automated.
---

# Ship

Treat shipping as a disciplined handoff, not a magic button.

## Do

1. Read the implementation summary, PRs, test results, rollout notes, and release context first.
2. State what is being shipped and who it affects.
3. Check whether the change is actually ready across review, verification, and rollout preparation.
4. Call out missing approvals, missing tests, migration steps, flags, or rollback gaps.
5. End with a clear recommendation: **ship now**, **ship with conditions**, or **do not ship yet**.

## Shipping lenses

Check these in order:

- **Scope clarity**: do we know exactly what is in and out of this ship?
- **Review readiness**: has the risky behavior been reviewed at the right depth?
- **Verification**: what tests, manual checks, or production guards prove this is safe enough?
- **Rollout mechanics**: are flags, migrations, sequencing, communication, and rollback covered?
- **Operational ownership**: who is watching the rollout and what signals matter?
- **Residual risk**: what could still go wrong even if we ship now?

If you need sharper prompts, read `references/shipping-checklist.md`.

## Output format

Use this structure:

### Recommendation
State `Ship now`, `Ship with conditions`, or `Do not ship yet`, with one short reason.

### Scope
Describe what is shipping and who it impacts.

### Readiness check
Summarize review status, verification status, and rollout preparation.

### Blocking gaps
List the things that must happen before ship. If none, say `None.`

### Risks to monitor
List the most important post-ship risks and signals.

### Immediate next steps
Give the concrete handoff or launch sequence.

## Style

- Be explicit about what is missing.
- Do not confuse merged code with ready-to-ship code.
- Keep deployment-specific steps visible instead of hidden in assumptions.
- Prefer clear handoffs over false automation claims.
- If the repo lacks release discipline, say so directly.
