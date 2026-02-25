---
name: 'step-02-plan'
description: 'Generate Product Brief + PRD + Architecture document — fully autonomous'

nextStepFile: './step-03-design.md'
briefFile: '{planning_artifacts}/product-brief.md'
prdFile: '{planning_artifacts}/prd.md'
architectureFile: '{planning_artifacts}/architecture.md'
---

# Step 2: Plan

**Progress: Step 2 of 5** — Next: Design (autonomous)

**AUTONOMOUS STEP — NO user interaction. Generate all 3 planning artifacts.**

## RULES

- MUST NOT stop for user input at any point during this step.
- MUST NOT present menus or checkpoints.
- MUST generate all 3 artifacts completely before proceeding.
- MUST document every assumption in a dedicated section within each artifact.
- MUST use web search for current framework/library versions when generating architecture.
- YOU MUST ALWAYS communicate in `{communication_language}`.
- Display a brief status update before each artifact: "Generating [artifact name]..."

---

## EXECUTION SEQUENCE

### Phase A: Product Brief

**Status update:** "Phase 2A: Generating Product Brief..."

**Generate and save to `{briefFile}`:**

```markdown
---
title: '{project_name} - Product Brief'
date: '{date}'
status: 'complete'
generated_by: 'bmad-auto'
---

# Product Brief: {project_name}

## Executive Summary
[2-3 paragraph summary: what the product is, who it serves, why it matters]

## Core Vision
### Problem Statement
[Clear articulation of the problem being solved]

### Proposed Solution
[High-level solution approach]

### Key Differentiators
[What makes this unique — even if it's simplicity]

## Target Users
### Primary Persona
[Name, role, needs, pain points, goals]

### User Journey
[Step-by-step of how the user interacts with the product]

## Success Metrics
[3-5 measurable outcomes that define success]

## MVP Scope
### In Scope
[Features included in MVP — from intake]

### Out of Scope
[Features explicitly deferred]

### MVP Success Criteria
[From intake: how to know it works]

## Future Vision
[Post-MVP possibilities — keep brief]

## Assumptions
[List every assumption made during generation with rationale]
```

**Save the file.** Store path as `{brief_path}`.

---

### Phase B: PRD (Product Requirements Document)

**Status update:** "Phase 2B: Generating PRD..."

**Read the Brief just generated, then generate and save to `{prdFile}`:**

```markdown
---
title: '{project_name} - Product Requirements Document'
date: '{date}'
status: 'complete'
generated_by: 'bmad-auto'
inputDocuments:
  - '{brief_path}'
---

# PRD: {project_name}

## Executive Summary
[Concise overview of requirements — built on the Brief]

## Product Vision
### Vision Statement
[One-sentence vision]

### Strategic Alignment
[Why this project matters — business context]

## Success Criteria
[Measurable success metrics with targets]

## User Journeys
[For each key workflow, describe the step-by-step user experience]
[Use format: Step N: User does X → System responds with Y]

## Functional Requirements
### Capability Contract
[This section defines EXACTLY what will be implemented. If it's not listed here, it won't be built.]

[For each feature from MVP scope:]
#### FR-{N}: {Feature Name}
- **Description:** What this feature does
- **User Story:** As a {role}, I want {action}, so that {benefit}
- **Acceptance Criteria:**
  - Given {context}, when {action}, then {result}
  - [Additional criteria]
- **Priority:** Must-have / Should-have / Nice-to-have

## Non-Functional Requirements
### Performance
[Response times, throughput, resource limits]

### Security
[Authentication, authorization, data protection]

### Reliability
[Error handling, data integrity, recovery]

### Scalability
[Growth expectations and technical approach]

## Assumptions
[List every assumption with rationale]
```

**Save the file.** Store path as `{prd_path}`.

---

### Phase C: Architecture Document

**Status update:** "Phase 2C: Generating Architecture..."

**CRITICAL:** Use web search to find current stable versions of chosen frameworks and libraries. Do not guess versions from training data.

**Read the PRD just generated, then generate and save to `{architectureFile}`:**

```markdown
---
title: '{project_name} - Architecture Document'
date: '{date}'
status: 'complete'
generated_by: 'bmad-auto'
inputDocuments:
  - '{brief_path}'
  - '{prd_path}'
---

# Architecture: {project_name}

## Tech Stack
[For each technology, include: name, version (verified via web search), purpose]

| Technology | Version | Purpose |
|-----------|---------|---------|
| {name} | {version} | {why} |

## Architecture Decisions
[Key architectural choices with rationale]

### ADR-1: {Decision Title}
- **Context:** Why this decision is needed
- **Decision:** What was chosen
- **Rationale:** Why this option over alternatives
- **Consequences:** Trade-offs accepted

## Project Structure
[Complete directory tree for the project]

```
{project_name}/
├── {directory structure}
```

## Code Patterns & Conventions
### Naming Conventions
[Files, variables, functions, classes]

### Code Organization
[How code is structured within files]

### Error Handling
[Standard error handling approach]

### Testing Strategy
[What to test, how, with what tools]

## API Design
[If applicable: endpoints, request/response formats]

## Data Model
[If applicable: entities, relationships, storage]

## Security Considerations
[Authentication, authorization, secrets management, input validation]

## Performance Considerations
[Caching, optimization, resource management]

## Dependencies
[Complete list of external dependencies with versions]

## Assumptions
[Architectural assumptions with rationale]
```

**Save the file.** Store path as `{architecture_path}`.

---

## STATUS UPDATE

After all 3 artifacts are saved, display:

```
Planning complete!
  - Product Brief: {brief_path}
  - PRD: {prd_path}
  - Architecture: {architecture_path}

Moving to epic and story design...
```

---

## AUTO-CONTINUE

Immediately proceed: Read fully and follow: `{nextStepFile}`

Do NOT stop. Do NOT wait for input.

---

## SUCCESS METRICS

- Product Brief generated and saved with all sections filled
- PRD generated with complete Functional Requirements (capability contract)
- Architecture generated with current versions (web-searched)
- Every artifact has an Assumptions section
- All 3 files saved to `{planning_artifacts}/`
- Brief status updates displayed for each phase
