# Patient Monitoring Development Skill

## When this skill activates
Activate this skill when working in this repository on the centralised patient monitoring system project.

This skill is designed to enforce disciplined phase-based development and to protect the canonical domain model.

## Human Interaction Language
When communicating directly with me:
- Ask all clarification questions in Traditional Chinese Cantonese (繁體中文廣東話).
- Give progress updates, decision requests, warnings, review findings and approval questions in Traditional Chinese Cantonese.
- Keep the communication concise and natural rather than using formal written Chinese.
- Technical terms such as Encounter, DailyLog, EF Core, SQL Server, foreign key, migration and index may remain in English where clearer.

This rule applies only to conversation with me. It must not change the language of repository artifacts.

Unless explicitly requested otherwise, continue using English for:
- source code;
- class/method/property/variable names;
- filenames and folder names;
- database table/column/constraint names;
- SQL and DBML;
- code comments;
- test names;
- configuration files;
- README and project documentation;
- architecture/design documents;
- commit messages;
- pull request text;
- application UI copy;
- generated technical outputs.

When showing terminal/build/test output, preserve the original output language rather than translating it.

In short: Talk to me in Traditional Chinese Cantonese; build and document the project in English.

## Required workflow
The required development cycle is:

Understand → Plan → Implement → Test → Review → Document → Verify → Commit

## One phase at a time
Work on only one numbered development phase at a time. Do not start the next phase until the current phase is complete, verified and documented.

## Before implementing a phase
Before implementing a phase, complete all of the following:

1. Read AGENTS.md.
2. Read docs/canonical-solution.md.
3. Read docs/DEVELOPMENT_PLAN.md.
4. Read docs/DECISIONS.md.
5. Inspect the existing repository state.
6. State the phase objective and acceptance criteria.

## During implementation
- Keep the scope narrow and focused on the active phase.
- Do not quietly change domain assumptions.
- Preserve the canonical domain terminology: Hospital, Patient, Encounter and DailyLog.
- Add or update tests that match the phase being implemented.
- Prefer explicit validation and database constraints over implicit assumptions.
- Do not introduce unnecessary frameworks, dependencies or broad refactors.

## Before marking a phase complete
Before marking a phase complete, complete all of the following:

1. Run the appropriate build/tests/checks.
2. Inspect the diff.
3. Confirm canonical-domain consistency.
4. Confirm documentation is current.
5. Perform an independent review pass.
6. Record progress and evidence.
7. Commit the completed phase.
8. Push the completed phase.
9. Verify the working tree is clean.
10. Record the resulting commit SHA in docs/PROGRESS.md.

## Verification rules
- Never fake verification evidence.
- Never claim a test passed unless it was actually run.
- If the verification evidence is missing, the phase is not complete.
- If a domain decision needs to change, update the canonical design first and record the decision.

## Review expectations
- Review for correctness, data integrity, security/privacy, validation, regression risk and needless complexity.
- Confirm the work stays within the active phase.
- Check that README and project documentation remain aligned with the implemented behaviour.

## Completion standard
Only mark a phase complete when the code, tests, documentation and evidence are all aligned. The repository must remain disciplined and portfolio-ready.
