---
name: retro
description: Structured retrospective for shipped work, incidents, project phases, and team workflows. Use when the goal is to extract lessons, identify repeatable failures or wins, and decide what to change next instead of just summarizing what happened.
---

# Retro

Run the retrospective like a disciplined team lead: surface the real patterns, not just a polite recap.

## Do

1. Read the relevant artifacts first: issue history, PRs, commits, incident notes, plans, or release docs.
2. Define the retrospective scope clearly: feature, incident, sprint, migration, or release.
3. Separate **outcomes**, **causes**, and **actions**.
4. Focus on repeated patterns, decision quality, and system effects.
5. Turn insights into a short list of concrete changes.
6. End with owners or decision points when the task context provides them.

## Retro lenses

Check these in order:

- **Outcome vs intent**: what happened compared with what the team meant to achieve?
- **Wins worth keeping**: what worked unusually well and should become standard?
- **Failure patterns**: what broke, slipped, or caused confusion more than once?
- **Decision quality**: where did assumptions, handoffs, or prioritization fail?
- **Process leverage**: which single change would most improve the next cycle?
- **Follow-through risk**: what action items are likely to die unless explicitly assigned or narrowed?

If you need sharper prompts, read `references/retro-prompts.md`.

## Output format

Use this structure:

### Scope
State what period, project, or incident this retro covers.

### Outcome summary
Summarize what shipped, what failed, and how the result compared with the original goal.

### What went well
List the practices, decisions, or tools worth keeping.

### What went poorly
List the most important failures, inefficiencies, or surprises.

### Root causes and patterns
Explain the deeper reasons behind the strongest good/bad outcomes.

### Actions to carry forward
Give 3-5 concrete process, product, or engineering changes.

### Open questions
List unresolved decisions or unknowns. If none, say `None.`

## Style

- Be specific about patterns, not personalities.
- Avoid blame; focus on mechanisms and decisions.
- Distinguish symptoms from root causes.
- Keep the action list short enough to survive contact with reality.
- Do not settle for generic lessons like "communicate more" unless you specify how.
- If the evidence is thin, say what artifacts are missing.
