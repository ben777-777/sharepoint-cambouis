---
name: 'step-04-build'
description: 'Implement all stories continuously — fully autonomous'

nextStepFile: './step-05-deliver.md'
---

# Step 4: Build

**Progress: Step 4 of 5** — Next: Deliver (autonomous)

**AUTONOMOUS STEP — NO user interaction. Implement ALL stories from the epics file.**

## RULES

- MUST NOT stop for user input between stories.
- MUST NOT present menus or checkpoints.
- MUST implement stories in order (respect dependencies).
- MUST follow architecture patterns and conventions from `{architecture_path}`.
- MUST mark tasks as complete in `{epics_path}` as they're done.
- MUST continue through ALL stories without stopping for milestones.
- YOU MUST ALWAYS communicate in `{communication_language}`.

---

## EXECUTION SEQUENCE

### 1. Load Context

Read completely:
- `{epics_path}` — All stories, tasks, ACs
- `{architecture_path}` — Tech stack, patterns, project structure, conventions
- `{project_context}` (if exists) — Project-specific rules

### 2. Setup Phase

Before coding stories, handle project initialization:

a) **Create project structure** as defined in architecture (directories, config files)
b) **Initialize dependency management** (package.json, requirements.txt, etc.)
c) **Install dependencies** if needed (npm install, pip install, etc.)
d) **Create base configuration files** (.env.example, tsconfig.json, etc.)

Display: "Project scaffolding complete. Implementing stories..."

### 3. Implementation Loop

**For each story in epic order:**

a) **Status Update**
Display: "Implementing Story {epic_num}.{story_num}: {title}..."

b) **Read Story Context**
- Extract tasks, ACs, and dev notes for this story
- Identify files to create/modify
- Review patterns from architecture

c) **Execute Tasks**
For each task in the story:
1. Read any files referenced in the task
2. Implement the change (create file, modify code, add test)
3. Follow architecture patterns and conventions strictly
4. Handle errors with the project's standard error handling approach
5. Mark task complete: `- [x] Task N`

d) **Write Tests (if applicable)**
- Follow the testing strategy from architecture doc
- Write unit tests for new functions/components
- Write integration tests for API endpoints or key workflows
- Ensure tests would pass (verify logic mentally)

e) **Mark Story Progress**
- Update tasks in `{epics_path}` to `[x]`
- Continue to next story immediately

### 4. Halt Conditions

**HALT and report to user ONLY if:**
- An external dependency is missing and impossible to mock (e.g., requires a real API key that wasn't provided)
- The same task fails 3+ consecutive times with different approaches
- A fundamental architectural contradiction is discovered

**Do NOT halt for:**
- Minor issues — note them and continue
- Style/preference decisions — follow architecture doc
- Non-blocking warnings — note in story dev notes
- Missing optional features — implement core path, note the gap

### 5. Progress Tracking

After each epic is complete, display a brief update:

```
Epic {N} complete: {epic_title}
  - Stories: {completed}/{total}
  - Files created/modified: {count}
```

---

## AUTO-CONTINUE

When ALL stories are implemented, display:

```
Implementation complete!
  - {total_stories} stories implemented
  - {total_files} files created/modified

Running verification...
```

Immediately proceed: Read fully and follow: `{nextStepFile}`

Do NOT stop. Do NOT wait for input.

---

## SUCCESS METRICS

- All stories implemented in dependency order
- Architecture patterns followed consistently
- Tasks marked complete in epics file
- Tests written where applicable
- Project structure matches architecture document
- Dependencies installed and configured
- No unnecessary halts during implementation
