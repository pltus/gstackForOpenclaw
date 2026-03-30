# gstackForOpenclaw

OpenClaw 에 맞게 gstack 의 핵심 워크플로우를 재해석하고, 과장 없는 네이티브 skill pack 으로 재구성하기 위한 프로젝트다.

이 레포의 1차 목표는 곧바로 skill 을 배포하는 것이 아니라, **gstack → OpenClaw 변환 전략** 을 명확히 정의하고 점진적으로 구현하는 것이다.

## Goals

- gstack 의 강한 워크플로우 철학을 유지한다.
- Claude-centric / custom runtime 의존을 제거한다.
- OpenClaw 의 네이티브 도구 모델(`exec`, `sessions_spawn`, `memory`, `cron`, `gh`)에 맞춘다.
- 마케팅 문구보다 실제 동작 가능한 skill 을 우선한다.
- 처음부터 전체 포팅하지 않고, ROI 높은 skill 부터 순차적으로 이식한다.

## Non-goals

- gstack 전체를 1:1 복제하지 않는다.
- OpenClaw 밖의 별도 orchestration runtime 을 먼저 만들지 않는다.
- 브라우저 바이너리/telemetry/host install system 을 초기에 포팅하지 않는다.

## Current Implementation Status

### Implemented skills

- `plan-ceo-review`
- `plan-eng-review`
- `review`
- `investigate`
- `retro`
- `office-hours`
- `document-release`
- `ship`
- `benchmark`
- `cso`
- `qa`

### Current posture

- **Core first-wave skills are implemented**: planning, review, investigation, and retro flows are in place.
- **Selected second-wave skills are also implemented** as thin OpenClaw-native workflows where the scope stayed honest (`office-hours`, `document-release`, `ship`, `benchmark`, `cso`, `qa`).
- **Browser parity and deployment-heavy workflows remain intentionally out of scope** even though `qa` now exists in a narrower evidence-first form without fake browser promises.

## Project Docs

- [Conversion Plan](docs/CONVERSION_PLAN.md)
- [Skill Matrix](docs/SKILL_MATRIX.md)

## Working Principle

**Direct port is the wrong goal.**

The goal is to preserve the useful parts of gstack:
- role-based thinking
- staged workflow
- explicit review criteria
- high-agency execution

while rewriting the operating model for OpenClaw.
