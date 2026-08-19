# Development Plan

This document defines the planned phase order for this repository. The phases are intentionally sequential and should be executed one at a time. This file is a plan only; execution begins only when the project is approved for the next phase.

## Phase 1 — Domain model and ERD
### Objective
Define the canonical domain model and relationship diagram for Hospital, Patient, Encounter and DailyLog.
### In scope
- Finalise the model and invariants
- Document identities, constraints and lifecycle rules
- Produce ERD and optimistic domain reasoning
### Out of scope
- .NET scaffolding
- SQL implementation
- UI work
### Expected files
- docs/canonical-solution.md updates if needed
- docs/DECISIONS.md updates
- drawio/mermaid or schema notes if introduced
### Verification commands
- `git diff --stat`
- repository sanity check script
### Acceptance criteria
- Domain model matches canonical design and is documented before code changes
### Evidence required before completion
- Review notes confirming alignment with canonical design and no silent domain drift

## Phase 2 — .NET solution scaffold
### Objective
Create the .NET project structure and base solution layout without implementing business logic.
### In scope
- Solution and project creation
- Configuration and folder structure
- Dependency baseline
### Out of scope
- Business workflow logic
- Domain validation beyond scaffolding
### Expected files
- .sln and .csproj files
- App/Domain or similar folder structure
### Verification commands
- `dotnet restore`
- `dotnet build`
### Acceptance criteria
- Solution builds cleanly with no business logic beyond the scaffolding
### Evidence required before completion
- Successful build output and clear project layout review

## Phase 3 — SQL Server / persistence layer
### Objective
Create persistence design and database artefacts for the canonical domain model.
### In scope
- SQL schema
- Constraints and indexes
- Migration or DDL scripts
### Out of scope
- UI-specific workflow logic
- Complex reporting logic beyond schema support
### Expected files
- SQL migration files or schema scripts
- Database design notes
### Verification commands
- SQL schema validation or migration command
- repository verification script
### Acceptance criteria
- Model supports Hospital, Patient, Encounter and DailyLog relationships with constraints
### Evidence required before completion
- Schema review confirming uniqueness and referential integrity rules

## Phase 4 — Patient + Encounter workflow
### Objective
Implement the patient and encounter lifecycle behaviour with validation and persistence support.
### In scope
- Create and edit patient data
- Register and manage encounters
- Discharge handling rules and lifecycle states
### Out of scope
- Daily monitoring logs
- Full audit and reporting workflows
### Expected files
- Domain entities and service classes
- Workflow tests
### Verification commands
- `dotnet test`
- targeted validation checks
### Acceptance criteria
- Patient and encounter workflow matches documented lifecycle rules and validation constraints
### Evidence required before completion
- Passing targeted tests and diff review confirming no domain drift

## Phase 5 — Daily monitoring + discharge workflow
### Objective
Implement daily monitoring entries and the encounter discharge workflow.
### In scope
- DailyLog creation and management
- Daily date uniqueness rule
- Discharge date rules and open-encounter handling
### Out of scope
- Full reporting dashboards
- UX polishing
### Expected files
- DailyLog model, repository/service code, tests
### Verification commands
- `dotnet test`
- validation scripts focused on business rules
### Acceptance criteria
- One log per Encounter per date and no redundant NotYetDischarged state
### Evidence required before completion
- Tests covering edge cases and final reviewed rule compliance

## Phase 6 — Validation and automated testing
### Objective
Strengthen validation, regression coverage and quality gates around the domain rules.
### In scope
- Input validation
- Server-side checks
- Automated tests for critical rules
### Out of scope
- Presentational UI polish
- Broad architecture redesign
### Expected files
- Validator classes, service tests, integration tests
### Verification commands
- `dotnet test`
- repository verification script
### Acceptance criteria
- Validation rules are explicit, test-covered and aligned with the canonical design
### Evidence required before completion
- Passing regression suite and documented review of validation coverage

## Phase 7 — Reporting/query demonstrations
### Objective
Create readable reporting and query examples that demonstrate the reporting-ready relational structure.
### In scope
- Sample queries
- Reporting patterns and summaries
- Demonstration data and outputs
### Out of scope
- Product-grade BI suite
- Production deployment concerns
### Expected files
- Reporting scripts, SQL examples, README updates
### Verification commands
- Query execution checks
- verification script
### Acceptance criteria
- Reporting examples reflect actual schema and domain behaviour
### Evidence required before completion
- Query output and documentation review showing alignment with the model

## Phase 8 — UX/presentation assets
### Objective
Prepare portfolio-facing presentation assets, demo flows and UI polish based on the implemented system.
### In scope
- UI screens or mockups
- Narrative presentation materials
- Demo flow notes
### Out of scope
- Production compliance certification
- Real healthcare deployment design
### Expected files
- UI assets, screenshots, markdown or static presentation files
### Verification commands
- Manual review and screenshot verification
- repository sanity checks
### Acceptance criteria
- The presentation demonstrates the implemented behaviour without claiming production deployment
### Evidence required before completion
- Review of final presentation materials and their alignment with implemented behaviour

## Phase 9 — Portfolio README and final quality review
### Objective
Prepare the final repository presentation, documentation and final quality review.
### In scope
- README updates
- Final portfolio narrative
- Documentation completeness and consistency
### Out of scope
- New feature work
- Additional architecture churn
### Expected files
- README.md updates
- docs/PROGRESS.md summaries
- final review notes
### Verification commands
- `git status --short --branch`
- repository verification script
- targeted documentation review
### Acceptance criteria
- Documentation is aligned with actual implementation and repository is ready for portfolio review
### Evidence required before completion
- Final diff review, passed verification commands and clean repository state

## Phase completion rule
A phase is not complete until evidence is recorded, the documentation is current, the diff is reviewed, the applicable checks have been run and the resulting commit SHA is recorded in docs/PROGRESS.md.
