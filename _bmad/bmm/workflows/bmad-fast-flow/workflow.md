---
name: fast-flow
description: 'Idea to working code in a single conversation. 3 steps, zero ceremony.'
main_config: '{project-root}/_bmad/bmm/config.yaml'
---

# BMAD Fast Flow

**Goal:** Transform an idea into working code in a single conversation through 3 lean steps.

**Designed for:** Scripts, MVPs, small web apps, automations, quick prototypes — any project small enough to build in one session.

---

## WORKFLOW ARCHITECTURE

This workflow uses **step-file architecture** with 3 streamlined steps:

1. **Understand** — Grasp the need, scan existing code, ask 2-3 sharp questions
2. **Spec + Build** — Generate a mini-spec, get confirmation, implement everything
3. **Verify** — Self-check, light review, propose commit

### Core Principles

- **Speed over ceremony** — No menus between steps, auto-continue when possible
- **Single conversation** — Spec and implementation happen in the same session
- **Lean artifacts** — One mini-spec file, not a full PRD
- **Smart defaults** — Skip escalation logic, this is for small projects by design

---

## INITIALIZATION

### Configuration Loading

Load config from `{main_config}` and resolve:

- `user_name`, `communication_language`, `user_skill_level`
- `planning_artifacts`, `implementation_artifacts`
- `date` as system-generated current datetime
- `project_context` = `**/project-context.md` (load if exists)
- YOU MUST ALWAYS communicate in `{communication_language}`

### Paths

- `installed_path` = `{project-root}/_bmad/bmm/workflows/bmad-fast-flow`
- `template_path` = `{installed_path}/fast-spec-template.md`

### State Variables

These persist throughout the workflow:

- `{baseline_commit}` — Git HEAD at start (or "NO_GIT")
- `{project_title}` — Name of the project/feature
- `{slug}` — URL-safe version of title
- `{spec_file}` — Path to the saved mini-spec

---

## EXECUTION

Read fully and follow: `steps/step-01-understand.md` to begin the workflow.
