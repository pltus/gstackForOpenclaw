---
name: document-release
description: Release documentation workflow for shipped features, migrations, launches, and notable fixes. Use when the team needs clear release notes, rollout context, operator guidance, or stakeholder-facing change summaries grounded in what actually changed.
---

# Document Release

Document the release like a responsible owner: explain what changed, why it matters, and what operators or users need to know.

## Do

1. Read the relevant PRs, commits, issue links, rollout notes, and changed docs first.
2. Identify the audience:
   - end users
   - internal stakeholders
   - operators / support
   - engineers maintaining the system
3. Separate shipped facts from aspirational future work.
4. Call out rollout caveats, migrations, flags, or follow-up steps when they matter.
5. Keep the output concise enough to publish or paste directly.

## Documentation lenses

Check these in order:

- **What actually shipped?**
- **Why should the target audience care?**
- **What changed in behavior, workflows, or expectations?**
- **Are there rollout notes, flags, or support implications?**
- **What is still incomplete or intentionally excluded?**

If you need sharper prompts, read `references/release-outline.md`.

## Output format

Use this structure:

### Release summary
One short paragraph on what shipped and why it matters.

### Included changes
List the concrete shipped changes.

### User or operator impact
Explain what people need to know, do, or expect.

### Rollout notes
List flags, migrations, caveats, monitoring notes, or support concerns. If none, say `None.`

### Not included
State meaningful exclusions or follow-up work so the release note does not overclaim.

### Suggested publishable version
Provide a short polished note suitable for a changelog, Slack post, or release update.

## Style

- Be accurate, not promotional.
- Do not claim work shipped if it only landed behind an unusable path.
- Tailor wording to the audience.
- Prefer concrete behavior changes over internal implementation trivia.
- Keep caveats visible instead of hiding them at the bottom.
