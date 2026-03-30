# Shipping checklist

Use this checklist when launch readiness is unclear.

## Scope and review

- What exact change set is part of this ship?
- Has the risky behavior been reviewed by the right people?
- Are known exclusions documented so nobody assumes more is included?

## Verification

- Which automated tests passed?
- Which risky paths were checked manually?
- Is there any behavior that is still only assumed to work?

## Rollout

- Are flags, migrations, config changes, or operator steps required?
- Can the change be staged or rolled back cleanly?
- Who is responsible for watching the rollout?

## Post-ship safety

- What metrics, logs, or support signals should be watched first?
- What failure would hurt users fastest?
- What is the first action if the rollout goes badly?
