# Patient Monitoring Development Skill

## When this skill activates
Activate this skill when working in this repository on the centralised patient monitoring system project.

This skill is designed to enforce disciplined phase-based development for a presentation-first portfolio case study. It protects the canonical domain model while keeping the work focused on design artifacts, diagram source, presentation materials and portfolio packaging.

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
- Produce the expected design artifacts for the active phase: DBML, Draw.io sources, wireframe notes, slide content or review documentation.
- Prefer explicit validation, relational reasoning and design clarity over speculative implementation.
- Do not introduce unnecessary frameworks, dependencies, or application scaffolding.
- Do not create .NET, API, frontend or authentication implementation unless it is explicitly approved in a separate phase.

## Before marking a phase complete
Before marking a phase complete, complete all of the following:

1. Inspect the diff.
2. Verify the canonical-domain model has not changed.
3. Verify no application code was introduced.
4. Run the relevant repository checks.
5. Confirm documentation is current.
6. Perform an independent review pass.
7. Record progress and evidence.
8. Commit the completed phase.
9. Push the completed phase.
10. Verify the working tree is clean.
11. Record the resulting commit SHA in docs/PROGRESS.md.

## Verification rules
- Never fake verification evidence.
- Never claim a test passed unless it was actually run.
- If the verification evidence is missing, the phase is not complete.
- If a domain decision needs to change, update the canonical design first and record the decision.

## Review expectations
- Review for correctness, data integrity, privacy and presentation clarity.
- Confirm the work stays within the active phase.
- Confirm the repository remains aligned with a presentation-first, design-driven portfolio case study.
- Confirm the design artifacts are consistent across ERD, UML, wireframe and presentation materials.

## Completion standard
Only mark a phase complete when the design artifacts, review findings, evidence and documentation remain aligned. The repository must remain disciplined, portfolio-ready and free of unnecessary application scaffolding.
