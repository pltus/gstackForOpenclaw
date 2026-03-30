# Security review prompts

Use these prompts when a change needs a sharper security pass.

## Assets and boundaries

- What data, credentials, systems, or privileged actions are worth protecting here?
- Which actors are trusted, semi-trusted, or untrusted?
- Where does data or control cross a trust boundary?

## Exploit paths

- How could an attacker influence input, state, or execution flow?
- What would privilege escalation, account takeover, data exfiltration, or remote execution look like here?
- Which controls fail open, rely on the client, or disappear under partial failure?

## Exposure and operations

- Can secrets or sensitive data leak through logs, traces, metrics, errors, or debug tooling?
- Do config or deployment changes widen network reachability or default permissions?
- If an exploit succeeded, what monitoring or containment would exist?

## Validation and mitigation

- Which risks can be demonstrated from code or config versus only suspected?
- What is the smallest fix that materially reduces the highest-risk path?
- What follow-up test, review, or runtime guard would raise confidence before ship?
