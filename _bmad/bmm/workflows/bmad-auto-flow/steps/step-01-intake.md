---
name: 'step-01-intake'
description: 'Ask 3-5 smart questions to gather all information needed for fully autonomous execution'

nextStepFile: './step-02-plan.md'
---

# Step 1: Intake

**Progress: Step 1 of 5** — Next: Plan (autonomous)

**This is the ONLY interactive step.** After this, Turbo runs the entire BMAD methodology without stopping.

## RULES

- MUST follow exact instructions in order.
- YOU MUST ALWAYS communicate in `{communication_language}`.
- Ask ALL questions in a SINGLE message — do not drip-feed questions one by one.
- The quality of the intake determines the quality of everything that follows.

---

## EXECUTION SEQUENCE

### 1. Capture Baseline

**If Git repo exists** (`.git` directory present):
- Run `git rev-parse HEAD` and store as `{baseline_commit}`

**If NOT a Git repo:**
- Set `{baseline_commit}` = "NO_GIT"

### 2. Check for Existing Context

Before asking questions, do a quick scan:
- Check `{planning_artifacts}` and `{implementation_artifacts}` for existing documents
- Check for `**/project-context.md`
- Check for any existing codebase (package.json, requirements.txt, etc.)

If existing context is found, factor it into your questions (be specific about what you found).

### 3. Get the Idea

**If the user already provided a project description when launching the workflow:**
- Use it as the foundation — adapt your questions to fill the gaps in that description.

**If no description was provided:**
- Start with: "Hey {user_name}! Describe your project idea in a few sentences and I'll take it from there."
- Wait for response, then proceed to questions.

### 4. Ask Smart Questions

Present **3-5 questions in a single block**, tailored to what's missing from the user's description. Use this framework but ADAPT — skip questions the user already answered:

```
Before I go full autopilot, I need a few things:

1. **Problem & Users**: Who is this for, and what problem does it solve?
   (ex: "Teachers who need to track student progress")

2. **Key Features (MVP)**: What are the 3-5 must-have features?
   (ex: "Dashboard, student import, grade tracking, report export")

3. **Platform & Tech**: What kind of app? Any tech preferences?
   (ex: "Web app, React + Node" or "CLI Python script" or "let me choose")

4. **External Dependencies**: Any APIs, services, or data sources?
   (ex: "Google Sheets API" or "none")

5. **Success Criteria**: How do you know it works?
   (ex: "Teacher can import a class, enter grades, and export a PDF report")
```

**Adapt to `{user_skill_level}`:**
- Beginners: simpler language, provide examples, suggest defaults
- Intermediate/Advanced: more technical, fewer examples

**HALT and wait for user responses.**

### 5. Process Responses and Confirm

From the user's responses, extract and synthesize:

- `{project_name}` — Clear project name
- `{slug}` — URL-safe version (lowercase, hyphens)
- **Vision** — What the project does and for whom
- **MVP Features** — 3-5 key features
- **Platform** — Web, CLI, API, mobile, etc.
- **Tech Stack** — Languages, frameworks (chosen by user or by you)
- **External Dependencies** — APIs, services, data sources
- **Success Criteria** — How to know it works

Present a brief confirmation:

```
Got it! Here's what I'll build:

**{project_name}**
Vision: {vision_summary}
MVP: {features_list}
Stack: {tech_stack}
Dependencies: {dependencies}

I'm going full autopilot now. I'll generate:
1. Product Brief
2. PRD (requirements)
3. Architecture doc
4. Epics & Stories
5. Complete implementation

This will take a few minutes. See you at the finish line!
```

**Do NOT wait for confirmation.** Proceed immediately.

---

## AUTO-CONTINUE

Immediately after presenting the confirmation, proceed:

Read fully and follow: `{nextStepFile}`

Do NOT present a menu. Do NOT wait for user input. The autopilot has begun.

---

## SUCCESS METRICS

- `{baseline_commit}` captured
- `{project_name}` and `{slug}` defined
- Vision, features, tech stack, dependencies, success criteria captured
- All information needed for Brief, PRD, Architecture gathered
- Confirmation displayed and autopilot started immediately
