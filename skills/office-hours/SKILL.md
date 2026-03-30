---
name: office-hours
description: Front-door product and execution triage for messy ideas, early requests, ambiguous opportunities, half-formed plans, and unclear asks. Use when the team needs to turn raw context into a sharper problem statement, pain-first questioning path, wedge definition, current-workaround analysis, or a clean handoff into a deeper skill before committing to scope or implementation.
---

# Office Hours

Run this like a forcing-function working session, not a friendly brainstorm. The job is to reduce ambiguity until the next decision becomes obvious.

## Core stance

- Do not reward vague asks with vague strategy.
- Push toward the underlying pain, current behavior, and decision.
- If the request is still mushy, ask fewer sharper questions instead of generating more ideas.
- If a deeper skill should take over, leave a usable handoff packet instead of a loose suggestion.

## Default workflow

1. Read the available context first: request, notes, issue, PRD, roadmap item, repo docs, or recent discussion.
2. Restate the situation in plain language.
3. Identify the current mode:
   - **Startup mode**: the team is still deciding whether this problem matters, for whom, and where the wedge is.
   - **Builder mode**: the team roughly knows the problem and needs sharper scope, sequencing, or downstream routing.
4. Find the real decision hiding under the request.
5. Pressure-test the problem with pain-first questions.
6. Inspect the current workaround before discussing a new solution.
7. Define the wedge: the smallest differentiated move worth doing now.
8. Decide whether to stay in `office-hours` or hand off to a deeper skill. Read `references/routing-guide.md` when handoff is likely.
9. End with a recommendation, immediate next actions, and a crisp handoff packet if needed.

## Non-negotiable lenses

Check these in order.

### 1. Real decision

Name the actual decision, not the surface request.

Examples:

- not “should we build X?” but “is this pain important enough to justify a focused wedge now?”
- not “how should we implement this?” but “have we earned implementation review yet?”
- not “what features should we add?” but “what is the smallest move that changes user behavior?”

### 2. Pain first

Push on user pain before solution shape.

Ask the sharpest missing questions, such as:

- Who is feeling this pain most acutely?
- What are they trying to get done?
- What is slow, error-prone, expensive, stressful, or embarrassing today?
- How often does this happen?
- What happens if the team does nothing for the next month?
- Why is this painful enough to deserve attention now?

Do not ask all of these by default. Ask only the few that collapse the most uncertainty.

### 3. Current workaround

Always inspect what people do today. A workaround reveals severity, urgency, and adoption risk.

Determine:

- what users or operators currently do instead
- how bad that workaround actually is
- where time, money, reliability, or trust is being lost
- whether the workaround is “annoying but fine” versus “actively breaking work”
- whether a lighter fix to the workaround beats building a new surface

If no workaround exists, say so clearly. That can mean the problem is not real yet, or that it is blocked by something more basic.

### 4. Wedge definition

Do not leave with a broad aspiration. Define the wedge.

A credible wedge should answer:

- **User**: exactly who is this for first?
- **Moment**: when does the pain show up?
- **Job**: what are they trying to finish?
- **Relief**: what becomes materially easier or safer?
- **Why this cut**: why is this the smallest move that can matter now?

If you cannot define a wedge, do not pretend the idea is ready.

### 5. Route with intent

Choose the next skill only when the center of gravity is clear.

- stay in `office-hours` if the main need is still framing, prioritization, or decision clarity
- hand off to `plan-ceo-review` when the main question is wedge, ambition, scope shape, or product direction
- hand off to `plan-eng-review` when the problem is clear and the main question is technical shape, sequencing, or rollout risk
- hand off to `review` when there is already a diff or implementation to inspect
- hand off to `investigate` when something is failing and the root cause is unclear
- hand off to `retro` when the work already happened and the goal is learning

## Mode guidance

### Startup mode

Use this when the team is still asking “is this worth pursuing?”

Bias toward:

- sharper problem framing
- pain severity
- current workaround analysis
- user/value concentration
- wedge discovery
- kill / defer / narrow decisions when the signal is weak

### Builder mode

Use this when the team already believes the problem is real.

Bias toward:

- scope cuts
- sequencing
- hidden assumptions
- dependency on missing decisions
- the right downstream skill and handoff quality

If builder-mode discussion keeps collapsing back into “what problem are we solving?”, switch back to startup mode explicitly.

## Output format

Use this structure.

### Situation summary
Summarize the request, context, and why it matters now.

### Real decision
State the actual decision or ambiguity underneath the ask.

### What pain looks real?
State the user, job to be done, and evidence of pain. If pain is weak or speculative, say so.

### Current workaround
Describe what happens today and what that reveals about urgency and severity.

### Wedge
State the smallest useful move worth pursuing now. If no wedge is earned yet, say `Not earned yet` and explain why.

### Recommendation
Give the clearest next move and why.

### Immediate next steps
Give 3-5 concrete actions, questions, or cuts.

### Handoff packet
If routing onward, include:
- destination skill
- one-sentence brief
- decisions already made
- assumptions to pressure-test
- open questions that still matter
- artifacts or files the next skill should read first

If no handoff is needed, say `None.`

## Quality bar

A good `office-hours` outcome should do at least one of these clearly:

- reveal that the pain is weaker than the request makes it sound
- expose the current workaround as the real problem surface
- cut a bloated idea down to a believable wedge
- separate product framing from engineering review
- leave a later skill with better inputs than it started with

## Style

- Be crisp, direct, and unsentimental.
- Prefer a short sharp session over a long speculative memo.
- Do not invent certainty or user evidence.
- Do not turn brainstorming into fake validation.
- Do not hand off lazily; the next skill should inherit a cleaner problem.
