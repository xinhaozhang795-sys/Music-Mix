# Music-Mix Development Rules

## Highest-priority rule
Never present an unverified claim as a fact.

Every development result must be classified as one of:

- Confirmed: supported by repository contents, GitHub API data, CI output, tests, or authoritative documentation.
- Inference: a reasoned conclusion that has not been fully verified.
- Unverified: insufficient evidence to make a reliable conclusion.
- Failed: an actual error or failing check was observed.

If something was not checked, say so. Do not guess.

## Mandatory post-action project review
After **every development action or repository operation**, perform a project-wide review of the current repository state before proceeding.

The review must check, as applicable:

- architecture and dependency direction
- changed files and their interactions with existing code
- compile/build correctness
- test coverage and test integrity
- CI configuration and current verification state
- API/platform assumptions
- dead, duplicated, unreachable, or placeholder code
- naming, paths, visibility, concurrency, and Swift language correctness
- unnecessary complexity, regressions, and maintainability risks

If an error, regression, inconsistency, or unnecessary complexity is found, fix or optimize it before moving on. Do not knowingly carry a discovered defect into the next stage unless it is explicitly documented as blocked and cannot safely be fixed yet.

A project-wide review means checking the whole current project, not only the files changed in the immediately preceding action.

## Mandatory progress report
After **every development action or repository operation**, report all of the following before starting the next action:

1. What was actually done.
2. What was actually verified.
3. What the overall project review found.
4. Every discovered error, risk, inconsistency, or questionable design choice.
5. What was fixed or optimized, and why.
6. What remains unverified or unresolved.
7. What the next step is.
8. Why the next step is necessary.
9. What result and effect the next step is expected to have.

Never report an operation as complete merely because the requested file was changed. Completion requires the post-action project review and an explicit status report.

## Development loop

1. Define one objective.
2. Define its architectural layer and dependencies.
3. Make the smallest necessary implementation.
4. Add or update tests.
5. Build and test.
6. Run CI.
7. Review the actual diff and results.
8. Perform the mandatory project-wide review.
9. Fix discovered problems and re-verify as needed.
10. Only then proceed to the next objective.

## CI rules

- `main` must remain buildable and testable.
- Do not disable, skip, or weaken tests to obtain a green build.
- Do not create meaningless changes solely to manufacture a CI result.
- A green CI result only validates the code actually built and tested by that run.

## Architecture rules

- `MusicMixCore` must not depend on MusicKit or app-specific playback APIs.
- Platform integrations belong in adapter modules.
- Production implementations and test doubles must remain clearly separated.
- New files must have a defined module, layer, dependency direction, and purpose.

## Change discipline

- Keep commits focused on one logical change.
- Avoid speculative abstractions.
- Do not add a feature before the current stage is verified.
- When an error is found, fix the cause rather than hiding the symptom.
- Do not knowingly leave a discovered defect unfixed when it can be safely fixed in the current stage.
