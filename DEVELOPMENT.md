# Music-Mix Development Rules

## Highest-priority rule
Never present an unverified claim as a fact.

Every development result must be classified as one of:

- Confirmed: supported by repository contents, GitHub API data, CI output, tests, or authoritative documentation.
- Inference: a reasoned conclusion that has not been fully verified.
- Unverified: insufficient evidence to make a reliable conclusion.
- Failed: an actual error or failing check was observed.

If something was not checked, say so. Do not guess.

## Development loop

1. Define one objective.
2. Define its architectural layer and dependencies.
3. Make the smallest necessary implementation.
4. Add or update tests.
5. Build and test.
6. Run CI.
7. Review the actual diff and results.
8. Only then proceed to the next objective.

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
