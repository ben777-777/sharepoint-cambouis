---
name: 'step-01-understand'
description: 'Grasp the need, scan existing code, ask sharp questions, capture scope'

nextStepFile: './step-02-spec-and-build.md'
---

# Step 1: Understand

**Progress: Step 1 of 3** — Next: Spec + Build

## RULES

- MUST follow exact instructions in order.
- MUST NOT skip ahead to future steps.
- YOU MUST ALWAYS communicate in `{communication_language}`.
- Keep this step FAST — under 2 minutes of interaction.

## CONTEXT

- Variables from `workflow.md` are available in memory.
- If the user already provided a project description when launching the workflow, use it as initial input (skip the greeting question).
- Focus: Understand what to build and identify constraints.

---

## EXECUTION SEQUENCE

### 1. Capture Baseline

**If Git repo exists** (`.git` directory present):
- Run `git rev-parse HEAD` and store as `{baseline_commit}`

**If NOT a Git repo:**
- Set `{baseline_commit}` = "NO_GIT"

### 2. Get the Idea

**If user already provided a description:** proceed to section 3 with that description.

**Otherwise:** Ask one simple question:

"Hey {user_name}! What are we building?"

Wait for response.

### 3. Quick Orient Scan

Do a rapid scan (under 30 seconds) to understand the landscape:

a) **Check for existing context:**
- Check `{implementation_artifacts}` and `{planning_artifacts}` for planning documents
- Check for `**/project-context.md` — if it exists, skim for patterns and conventions
- Check for any existing code related to the user's request

b) **If user mentioned specific code/features:**
- Search for relevant files/classes/functions
- Note: tech stack, file locations, obvious patterns
- Do NOT deep-dive — just enough to ask informed questions

### 4. Ask Informed Questions

Ask **2-3 sharp questions maximum** — informed by what you found in the scan.

Instead of generic questions, ask specific ones:
- "I see you have X — should we extend that or build separately?"
- "Your project uses Y framework — should we stick with that?"
- "Any specific constraints? (API keys, specific libraries, target platform)"

**Adapt to `{user_skill_level}`:** technical users get technical questions, beginners get simpler ones.

**If clean slate (no existing code):**
- Ask about preferred tech stack or let you choose
- Ask about target platform (web, CLI, API, etc.)
- Ask about any hard constraints

### 5. Capture Core Understanding

From the conversation, extract:

- **`{project_title}`**: Clear, concise project name
- **`{slug}`**: URL-safe version (lowercase, hyphens, no spaces)
- **Problem**: What problem are we solving? (1-2 sentences)
- **Solution**: High-level approach (1-2 sentences)
- **In Scope**: What's included (bullet points)
- **Out of Scope**: What's explicitly NOT included (bullet points)
- **Tech Stack**: Languages, frameworks, tools

Present a brief summary to the user:

```
Got it! Here's what I understand:

**{project_title}**
Problem: {problem}
Solution: {solution}
Stack: {tech_stack}

Does that sound right? (y/adjust)
```

**Wait for confirmation.**

- **y (or similar):** Proceed to next step
- **adjust:** Incorporate feedback, re-present summary, wait again

---

## AUTO-CONTINUE

Once the user confirms, **immediately** proceed:

Read fully and follow: `{nextStepFile}`

Do NOT present a menu. Do NOT ask what to do next. Just continue.

---

## SUCCESS METRICS

- `{baseline_commit}` captured
- `{project_title}` and `{slug}` defined
- Problem, solution, scope captured
- Tech stack identified
- User confirmed understanding
- Proceeded to step 02 without menu interruption
