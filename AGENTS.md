# Repository Agent Instructions

## Purpose
This repository is primarily a portfolio-quality presentation and design case study for a centralised healthcare patient monitoring system. The main deliverable is a Canva interview presentation supported by canonical design decisions, DBML ERD source, Draw.io user-flow source, Figma planning materials and packaging assets.

The repository exists to manage:
- canonical design decisions;
- dbdiagram.io ERD source;
- Draw.io User Flow / UML source;
- Figma wireframe planning and exported assets;
- Canva slide content and presentation structure;
- presentation QA;
- portfolio packaging.

It is not primarily an application-development project. Do not build a .NET application, API, frontend, or production system unless a separate implementation phase is explicitly approved in the future.

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

## Mandatory rules
- Inspect the repository state before making changes.
- Keep the solution simple and avoid unnecessary frameworks or dependencies.
- Canonical domain terminology must remain Hospital, Patient, Encounter and DailyLog.
- Do not silently change domain assumptions.
- If a domain decision needs to change, update the canonical design documentation first.
- No real patient information, private health data, or interview contact information may be added to this repository.
- Prefer explicit validation and database constraints over implicit assumptions.
- Do not scaffold .NET, C#, EF Core, SQL runtime databases, APIs, frontend applications or authentication systems unless a separate implementation phase is explicitly approved.
- Every implementation phase must include tests appropriate to that phase.
- Never claim a test passed unless it was actually run.
- Keep changes focused on the active phase and avoid mixing large refactors into feature work.
- Record significant architectural decisions in the project decision log.
- Keep the README and portfolio documentation aligned with the implemented behaviour.
- Do not invent RMH/VICNISS production architecture or describe this as a production healthcare system.
- Use synthetic or demo data only.

## Canonical domain expectations
- Hospital → Patient → Encounter → DailyLog is the canonical relationship chain.
- MRN / UR No. is unique within a Hospital, not globally.
- A Patient may have multiple Encounters.
- An Encounter may have multiple DailyLogs.
- Maximum one DailyLog per Encounter per calendar date.
- An open encounter is represented by a null DischargeDate; do not persist NotYetDischarged as a second source of truth.
- Client validation improves UX, but server validation is authoritative.
- Database constraints protect relational integrity.
- The system should optimise for simple data entry, reliable data, reporting-ready relational structure and extensibility.
- Healthcare privacy, auditability and role-based access are cross-cutting concerns.

## Working rules
- Follow the active phase plan and do not start later phases prematurely.
- If a phase is incomplete, do not claim success or completion.
- Keep implementation and review functions separate; architecture, implementation and review should be clearly distinguishable.
- The repository must remain focused on the current phase and avoid broad speculative scope.
- Significant design changes must be documented before being applied.
- Keep the repository focused on design artifacts, diagram sources, presentation assets, and portfolio packaging instead of software scaffolding.

## Verification and evidence
- No implementation phase is complete until the relevant checks have been run and recorded.
- Evidence must be explicit: commands run, outcomes observed and any remaining risks.
- The working tree must be checked before completion claims are made.
- The commit SHA should be recorded in docs/PROGRESS.md when a phase is finished and verified.
- Verify that no canonical domain rules changed and no application code was introduced during the active phase.

## Documentation alignment
- The canonical design document is the source of truth for domain behaviour.
- Implementation and README content must be consistent with the documented behaviour.
- If project behaviour changes, update the canonical design and supporting documentation before proceeding.

## Phase discipline
- Work only on one numbered development phase at a time.
- Each phase must have explicit objective, scope, evidence and completion checks.
- Stop after Phase 0 unless an explicit follow-up approval is given.
