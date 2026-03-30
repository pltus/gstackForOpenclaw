# Design review checklist

Use these prompts to keep design critique concrete, evidence-based, and implementation-aware.

## 1. Frame the review correctly

- What user job or workflow is this screen supposed to support?
- Is this a new concept, a refinement, a regression check, or a pre-ship audit?
- Which artifacts are available: screenshots, mocks, video captures, code, or diffs?
- What important context is missing?

## 2. Start with task clarity

Ask:

- Can a first-time user tell what this page or component is for?
- Is the primary action obvious?
- Does the layout guide attention in the right order?
- Are labels specific enough, or do they sound like placeholder product language?

## 3. Audit the visible system

Look for coherence across:

- typography scale and line length
- spacing rhythm and grouping
- color usage and contrast
- icon treatment and affordance cues
- card, panel, form, and button patterns
- empty, error, success, and loading states

Call out repeated patterns, not just isolated nitpicks.

## 4. Check interaction and accessibility risks

Even from static artifacts, ask:

- Where might keyboard focus or hover state be unclear?
- Which controls look too subtle, too dense, or too ambiguous?
- What breaks on narrow screens or with long translated text?
- Are contrast, tap targets, or status messaging likely to fail accessibility expectations?

## 5. Tie critique to implementation reality

When code or diffs are present, ask:

- Is this likely a local styling fix, a component contract problem, or a design-system gap?
- Which change is cheap polish and which needs broader redesign?
- Are there repeated findings that suggest missing tokens, layout primitives, or state patterns?

## 6. Prioritize findings honestly

For each finding, clarify:

- what the user impact is
- why the evidence is strong or weak
- whether it is blocking, important polish, or optional experimentation
- what the smallest sensible next step is

A tight, evidence-backed design review is better than a long list of aesthetic opinions.
