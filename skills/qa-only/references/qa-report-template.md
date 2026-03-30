# QA-only report prompts

Use these prompts to keep report-only QA crisp, reproducible, and easy to hand off.

## 1. Define the pass clearly

- What exact diff, build, branch, fix, or environment is being verified?
- Is this a release gate, a bug re-check, or a focused regression pass?
- What is explicitly out of scope for this run?

## 2. Capture strong evidence

For every finding, include:

- repro steps
- expected result
- actual result
- environment or command used
- any log, screenshot, trace, or output snippet available

If a finding is only suspected, move it to watchouts instead of confirmed findings.

## 3. Keep handoff quality high

Ask:

- Could an engineer reproduce this without another meeting?
- Is the severity clear enough for release triage?
- Which file, route, API, or workflow does this likely touch?
- What is the smallest regression test that would keep this from coming back?

## 4. Be honest about limits

Always call out:

- missing credentials or environment access
- browser or device gaps the runtime could not cover
- flaky or non-deterministic results
- important adjacent flows that were not exercised

The output should help the next person act quickly, not guess what the QA pass really did.
