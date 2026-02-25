---
name: 'step-03-verify'
description: 'Self-check implementation, light review, present summary, propose commit'

specFile: '{implementation_artifacts}/fast-spec-{slug}.md'
---

# Step 3: Verify

**Progress: Step 3 of 3** — Final Step

## RULES

- MUST follow exact instructions in order.
- YOU MUST ALWAYS communicate in `{communication_language}`.
- This is the final step — be thorough but fast.

## CONTEXT

- Variables from `workflow.md`, step-01, and step-02 are available in memory.
- All tasks have been implemented in step 02.
- `{specFile}` contains the mini-spec with task completion status.
- `{baseline_commit}` is available for diff construction.

---

## EXECUTION SEQUENCE

### 1. Self-Check Audit

Quickly verify against the spec:

a) **Tasks Complete**
- All tasks from `{specFile}` marked `[x]`
- No tasks skipped without reason

b) **Acceptance Criteria**
- Walk through each AC mentally
- Verify implementation satisfies each one
- Note any AC that may not be fully met

c) **Code Quality Quick Scan**
- Follows existing patterns in codebase
- Error handling is reasonable
- No obvious bugs or missing imports
- Files are properly structured

d) **Tests (if applicable)**
- Existing tests still pass
- New tests written if the project uses tests

### 2. Construct Diff Summary

**If `{baseline_commit}` is a Git commit hash:**

```bash
git diff --stat {baseline_commit}
```

Capture the list of files changed, insertions, deletions.

**If `{baseline_commit}` is "NO_GIT":**

List all files you created or modified during step 02.

### 3. Light Review

Perform a quick self-review of the changes:

- Any security issues? (exposed secrets, SQL injection, etc.)
- Any performance concerns? (infinite loops, N+1 queries, etc.)
- Any missing error handling for critical paths?
- Any hardcoded values that should be configurable?

If issues found, fix them immediately before presenting the summary.

### 4. Update Spec Status

Update `{specFile}`:
- Set status to `completed`
- Ensure all tasks are marked `[x]`

### 5. Present Final Summary

Display a clean summary:

```
**Done! Here's what was built:**

**{project_title}**

**Files created/modified:**
- {file list with brief description}

**What it does:**
- {brief functional summary}

**Acceptance criteria status:**
- [x] {AC 1} ✓
- [x] {AC 2} ✓
...

**Spec saved:** `{specFile}`
```

### 6. Propose Next Actions

```
**What's next?**

[C] Commit changes
[T] Run tests
[R] Review a specific file
[F] Fix something
[D] Done — nothing else needed
```

**HALT and wait for user selection.**

#### Menu Handling Logic:

- **[C] Commit:** Stage all changes and commit with message: "feat: {project_title}" — ask user to confirm message first
- **[T] Run tests:** Execute the project's test suite and report results, then re-display menu
- **[R] Review:** Ask which file, display it, then re-display menu
- **[F] Fix:** Ask what to fix, apply fix, then re-display menu
- **[D] Done:** Display final message and exit

#### EXECUTION RULES:

- ALWAYS halt and wait for user input after presenting menu
- After T, R, or F: return to this menu
- After C or D: workflow is complete

---

## COMPLETION

When user selects [D] or after commit:

"All done! {project_title} is ready. The spec is at `{specFile}` for reference."

---

## WORKFLOW COMPLETE

This is the final step. The BMAD Fast Flow is now complete.

## SUCCESS METRICS

- All tasks verified complete
- All AC verified satisfied
- Code quality checked
- Diff summary presented
- User has clear next actions
- Spec file updated to completed status
