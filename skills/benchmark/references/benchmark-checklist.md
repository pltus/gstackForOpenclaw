# Benchmark checklist

Use this when a performance claim needs a sharper measurement plan.

## Scope and metric

- What user or system behavior is actually being measured?
- Which metric matters most: latency, throughput, CPU, memory, cost, build time, or something else?
- Is the metric directly tied to the decision, or only a weak proxy?

## Measurement setup

- What exact command, script, or workflow produced the numbers?
- What environment details matter: machine shape, data size, cache state, concurrency, flags?
- How many runs were taken, and were warmup runs separated from measured runs?

## Comparison quality

- What baseline are we comparing against?
- Is the before/after comparison fair, or did multiple variables change at once?
- Are the results stable enough that the delta is larger than the noise?

## Interpretation

- Is the measured delta material for users, operators, or cost?
- What tradeoff got worse while the headline metric improved?
- What evidence would be needed before treating the result as rollout-worthy?
