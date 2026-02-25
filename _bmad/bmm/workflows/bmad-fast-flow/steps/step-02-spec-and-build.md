---
name: 'step-02-spec-and-build'
description: 'Generate mini-spec, get quick confirmation, implement all tasks continuously'

nextStepFile: './step-03-verify.md'
templateFile: '../fast-spec-template.md'
specFile: '{implementation_artifacts}/fast-spec-{slug}.md'
---

# Step 2: Spec + Build

**Progress: Step 2 of 3** — Next: Verify

## RULES

- MUST follow exact instructions in order.
- MUST NOT skip ahead to future steps.
- YOU MUST ALWAYS communicate in `{communication_language}`.
- Generate the spec AND implement in the same step — this is the core of BMAD Fast.

## CONTEXT

- Variables from `workflow.md` and step-01 are available in memory.
- `{project_title}`, `{slug}`, problem, solution, scope, tech stack are all defined.
- Focus: Plan quickly, then build.

---

## EXECUTION SEQUENCE

### 1. Generate Mini-Spec

Using the captured understanding from step 01, generate a lean implementation plan:

a) **Task Breakdown**
- Break the project into discrete, ordered tasks
- Each task = one clear unit of work
- Order by dependency (foundations first)
- Include specific file paths for each task

Task format:
```markdown
- [ ] Task N: Clear action description
  - File: `path/to/file.ext`
  - Action: What to create/modify
```

b) **Acceptance Criteria**
- 3-8 acceptance criteria total (keep it lean)
- Given/When/Then format
- Cover: happy path + key error cases

c) **Dependencies**
- External libraries needed
- Environment requirements (API keys, services)

### 2. Present the Plan

Display the plan in ONE compact block:

```
Here's the plan for **{project_title}**:

**Tasks:**
1. {task 1}
2. {task 2}
...

**Success criteria:**
- {AC 1}
- {AC 2}
...

**Dependencies:** {list or "None"}

Ready to build? (y/n/adjust)
```

**HALT and wait for user input.**

- **y (or similar):** Proceed to implementation
- **n:** Ask what's wrong, adjust, re-present
- **adjust:** Incorporate specific feedback, re-present

### 3. Save Mini-Spec

Once the user confirms:

a) Copy template from `{templateFile}`
b) Fill in all sections with captured data
c) Write to `{specFile}`
d) Brief confirmation: "Spec saved to `{specFile}`. Building now..."

### 4. Execute Implementation

**Critical: Continue through ALL tasks without stopping for milestones.**

For each task in order:

a) **Load Context**
- Read files relevant to this task
- Review patterns from project-context or observed code

b) **Implement**
- Write code following existing patterns (or best practices if clean slate)
- Handle errors appropriately
- Follow conventions observed in codebase

c) **Test (if applicable)**
- Write tests if the project uses tests
- Run existing tests to catch regressions
- For scripts/quick tools: verify the code is syntactically correct

d) **Mark Complete**
- Update task in `{specFile}`: `- [x] Task N`
- Continue to next task immediately

### 5. Halt Conditions

**HALT and ask the user ONLY if:**
- 3 consecutive failures on the same task
- A blocking dependency is missing (e.g., missing API key)
- Ambiguity that fundamentally changes the approach

**Do NOT halt for:**
- Minor issues (note them, continue)
- Style preferences (follow existing patterns)
- Non-blocking warnings

---

## AUTO-CONTINUE

When ALL tasks are complete, **immediately** proceed:

Read fully and follow: `{nextStepFile}`

Do NOT present a menu. Do NOT ask what to do next. Just continue to verification.

---

## SUCCESS METRICS

- Mini-spec generated and confirmed by user
- Spec file saved to `{specFile}`
- All tasks implemented
- Code follows existing patterns or best practices
- No unnecessary halts during implementation
- Proceeded to step 03 without interruption
