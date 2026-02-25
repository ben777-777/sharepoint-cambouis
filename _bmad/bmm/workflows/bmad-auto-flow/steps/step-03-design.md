---
name: 'step-03-design'
description: 'Generate Epics and Stories from PRD + Architecture — fully autonomous'

nextStepFile: './step-04-build.md'
epicsFile: '{implementation_artifacts}/epics.md'
---

# Step 3: Design

**Progress: Step 3 of 5** — Next: Build (autonomous)

**AUTONOMOUS STEP — NO user interaction. Generate complete Epics and Stories.**

## RULES

- MUST NOT stop for user input.
- MUST NOT present menus or checkpoints.
- MUST read the PRD and Architecture generated in step 02 before starting.
- MUST create stories that are implementation-ready (a dev agent could pick them up and code them).
- MUST include specific file paths and actions in every task.
- YOU MUST ALWAYS communicate in `{communication_language}`.

---

## EXECUTION SEQUENCE

### 1. Load Planning Artifacts

Read completely:
- `{prd_path}` — Extract all Functional Requirements (capability contract)
- `{architecture_path}` — Extract tech stack, project structure, patterns, conventions

### 2. Design Epics

**Status update:** "Phase 3: Designing Epics and Stories..."

Break the project into epics organized by user value:

- Each epic = a logical group of features that deliver value together
- Order epics by dependency (foundational epics first, then features, then polish)
- Typical pattern:
  - Epic 1: Project Setup + Core Infrastructure
  - Epic 2-N: Feature Epics (one per major feature area)
  - Final Epic: Integration + Polish

### 3. Design Stories

For each epic, create detailed stories:

**Story format:**

```markdown
### Story {epic_num}.{story_num}: {story_title}

**Status:** ready-for-dev

**Story:** As a {role}, I want {action}, so that {benefit}

**Acceptance Criteria:**
- [ ] AC-1: Given {context}, when {action}, then {result}
- [ ] AC-2: Given {context}, when {action}, then {result}
[...]

**Tasks:**
- [ ] Task 1: {action description}
  - File: `{specific/file/path.ext}`
  - Action: {what to create or modify}
- [ ] Task 2: {action description}
  - File: `{specific/file/path.ext}`
  - Action: {what to create or modify}
[...]

**Dev Notes:**
- Architecture: {relevant architectural decisions and patterns}
- Patterns: {code patterns to follow from architecture doc}
- Dependencies: {what must be done before this story}
- Testing: {what tests to write and how}
```

### 4. Story Quality Rules

Every story MUST be:
- **Actionable:** Every task has a specific file path and clear action
- **Ordered:** Tasks within a story follow dependency order
- **Testable:** Every AC follows Given/When/Then and covers happy path + key edge cases
- **Complete:** All context a dev agent needs is included — no placeholders, no "TBD"
- **Self-contained:** A fresh agent can implement the story without reading the full PRD

### 5. Save Epics File

**Generate and save to `{epicsFile}`:**

```markdown
---
title: '{project_name} - Epics and Stories'
date: '{date}'
status: 'complete'
generated_by: 'bmad-auto'
inputDocuments:
  - '{prd_path}'
  - '{architecture_path}'
total_epics: {count}
total_stories: {count}
---

# Epics and Stories: {project_name}

## Overview

| Epic | Title | Stories | Description |
|------|-------|---------|-------------|
| E1 | {title} | {count} | {brief description} |
[...]

---

## Epic 1: {title}

{epic description}

### Story 1.1: {title}
[full story content as defined above]

### Story 1.2: {title}
[...]

---

## Epic 2: {title}
[...]
```

Store path as `{epics_path}`.

---

## STATUS UPDATE

```
Design complete!
  - Epics: {total_epics} epics
  - Stories: {total_stories} stories
  - Saved to: {epics_path}

Starting implementation...
```

---

## AUTO-CONTINUE

Immediately proceed: Read fully and follow: `{nextStepFile}`

Do NOT stop. Do NOT wait for input.

---

## SUCCESS METRICS

- All Functional Requirements from PRD mapped to stories
- Stories follow architecture patterns and project structure
- Every task has a specific file path
- Every AC is testable (Given/When/Then)
- Stories ordered by dependency
- Epics file saved to `{implementation_artifacts}/`
