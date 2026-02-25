---
name: auto-flow
description: 'Full BMAD methodology on autopilot. Brief + PRD + Architecture + Epics + Stories + Code — all autonomous after intake.'
main_config: '{project-root}/_bmad/bmm/config.yaml'
---

# BMAD Auto Flow

**Goal:** Execute the complete BMAD methodology autonomously after a brief intake, producing all artifacts and implementing the full codebase.

**Designed for:** Projects that deserve full methodology rigor (Brief, PRD, Architecture, Epics, Stories) but without the interactive overhead. After 3-5 intake questions, Turbo runs the entire pipeline without stopping.

---

## WORKFLOW ARCHITECTURE

This workflow uses **step-file architecture** with 5 phases:

1. **Intake** — Ask 3-5 smart questions (ONLY interactive step)
2. **Plan** — Generate Product Brief + PRD + Architecture
3. **Design** — Generate Epics + Stories
4. **Build** — Implement all code
5. **Deliver** — Verify, summarize, propose commit

### Core Principles

- **Full autonomy after intake** — Steps 2-5 run without ANY user interaction
- **Smart assumptions** — When information is missing, make a reasonable choice and document it
- **Complete artifacts** — Every BMAD artifact is generated (Brief, PRD, Architecture, Epics)
- **Auto-continue** — Each step flows into the next without menus or checkpoints
- **Documented decisions** — Every assumption and decision is recorded in the artifacts

---

## INITIALIZATION

### Configuration Loading

Load config from `{main_config}` and resolve:

- `project_name`, `user_name`, `communication_language`, `user_skill_level`
- `planning_artifacts`, `implementation_artifacts`
- `document_output_language`
- `date` as system-generated current datetime
- `project_context` = `**/project-context.md` (load if exists)
- YOU MUST ALWAYS communicate in `{communication_language}`

### Paths

- `installed_path` = `{project-root}/_bmad/bmm/workflows/bmad-auto-flow`

### State Variables (persist throughout)

- `{baseline_commit}` — Git HEAD at start (or "NO_GIT")
- `{project_name}` — Name of the project
- `{slug}` — URL-safe version of project name
- `{brief_path}` — Path to generated Product Brief
- `{prd_path}` — Path to generated PRD
- `{architecture_path}` — Path to generated Architecture doc
- `{epics_path}` — Path to generated Epics file

### Output Paths

- Product Brief: `{planning_artifacts}/product-brief.md`
- PRD: `{planning_artifacts}/prd.md`
- Architecture: `{planning_artifacts}/architecture.md`
- Epics: `{implementation_artifacts}/epics.md`

---

## EXECUTION

Read fully and follow: `steps/step-01-intake.md` to begin the workflow.
