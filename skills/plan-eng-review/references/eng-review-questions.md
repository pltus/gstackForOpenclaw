# Engineering review questions

Use these prompts when the plan needs a sharper technical challenge pass.

## Architecture and boundaries

- What are the main components or subsystems involved?
- Which boundaries become harder to maintain after this change?
- Is there a simpler shape that solves the same problem with less coordination?
- Which parts of the design are irreversible or expensive to change later?

## Data and correctness

- What state changes, writes, migrations, or caches are involved?
- Where can data drift, duplication, reordering, or partial success happen?
- What invariants must always remain true?
- What should happen on retries, concurrent requests, or replayed events?

## Failure handling

- What happens if dependencies are slow, down, or partially failing?
- What is the user-visible behavior under partial failure?
- How does the system recover after interruption or mid-flight rollback?
- Which failures will be silent unless explicit monitoring is added?

## Rollout and operations

- Can this ship behind a flag, staged migration, or shadow path?
- What metrics, logs, or alerts are required before rollout?
- Is there a clean rollback path?
- What manual operator steps exist, and can any be eliminated?

## Testing and execution

- Which paths deserve integration tests instead of only unit tests?
- What is the smallest vertical slice that proves the design?
- What should be validated in production or staging before broad rollout?
- Which open questions should be answered before coding versus during implementation?
