# Design plan review questions

Use these prompts to keep pre-build design critique concrete and implementation-aware.

## 1. Frame the intended experience

- What user problem or decision is this flow supposed to resolve?
- What is the primary user action, and what should feel easy?
- Which surfaces are in scope: a single screen, a multi-step flow, onboarding, settings, or a system pattern?
- What evidence exists beyond prose: wireframes, mocks, current screenshots, or component constraints?

## 2. Stress-test the flow before visuals

Ask:

- Can a user understand what to do first from the plan alone?
- Where might the flow branch, stall, or create hesitation?
- What assumptions does the plan make about prior user knowledge?
- Which steps feel overloaded, ambiguous, or likely to create abandonment?

## 3. Check hierarchy and content load

Look for:

- too many competing actions on one surface
- labels that sound like internal product language
- important status or guidance hidden too late in the flow
- missing prioritization between primary and secondary actions

## 4. Design the missing states early

Before implementation, ask:

- What happens when there is no data yet?
- What happens when validation fails or permissions are missing?
- What does loading look like if the action is slow?
- What success feedback is needed so the user trusts the result?
- What changes on small screens or with long content?

## 5. Tie recommendations to build reality

For each issue, clarify:

- whether it needs a product decision, a UX rewrite, or just a wireframe pass
- whether it implies a new component or can reuse an existing pattern
- whether fixing it now avoids expensive rework after build starts

A strong plan-design review should make the implementation clearer, not just more "designed."
