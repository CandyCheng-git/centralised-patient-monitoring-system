# Development Plan

This document defines the planned phase order for this repository. The repository is primarily a presentation-first portfolio case study, not a software application implementation project. The design artifacts, diagrams and presentation materials are the primary deliverables.

## Phase 0 — Repository harness — COMPLETE
### Objective
Establish the repository governance, canonical design documentation and the Codex harness needed for disciplined design-first work.
### In scope
- Repository rules and guardrails
- Canonical domain documentation
- Codex skill and agent definitions
- Verification helper and governance hooks
### Out of scope
- Application implementation
- .NET scaffolding
- Frontend or API work
### Expected files
- AGENTS.md
- docs/canonical-solution.md
- docs/DECISIONS.md
- docs/DEVELOPMENT_PLAN.md
- docs/PROGRESS.md
- .agents/skills/patient-monitoring-development/SKILL.md
- .codex/agents/*
- .codex/hooks.json
- scripts/verify.ps1
### Verification commands
- `powershell -NoProfile -ExecutionPolicy Bypass -File scripts\verify.ps1`
- `git status --short --branch`
### Acceptance criteria
- The harness exists, is documented and remains focused on design/presentation work.
### Evidence required before completion
- Verification output confirming the repository sanity checks pass and the working tree is clean.

## Phase 1 — Relational Data Model / dbdiagram.io ERD
### Objective
Create and validate the canonical relational database diagram.
### Primary artifact
- design/erd/patient-monitoring.dbml
### In scope
- Hospital → Patient → Encounter → DailyLog relational model
- Primary keys and foreign keys
- One-to-many cardinalities
- `UNIQUE(HospitalId, MRN)`
- `UNIQUE(EncounterId, LogDate)`
- Nullable discharge fields
- No persisted NotYetDischarged flag
- Controlled-value documentation
- Reporting-index candidates where useful
### Out of scope
- .NET application scaffolding
- Runtime database provisioning
- Frontend or API implementation
### Expected files
- design/erd/patient-monitoring.dbml
- design/erd/README.md or supporting notes if needed
### Verification commands
- `git diff --stat`
- repository sanity check script
### Acceptance criteria
- The ERD is suitable for import into dbdiagram.io and export to SVG/PNG for Canva.
### Evidence required before completion
- Reviewed ERD against canonical domain model and design decision log with no domain drift.

## Phase 2 — User Flow / Draw.io
### Objective
Create one simple activity or user-flow diagram covering the operational journey.
### Primary artifact
- design/user-flow/patient-monitoring.drawio
### In scope
- Authenticated staff → Hospital → MRN lookup → Patient exists? → load/create Patient → create/open Encounter → event details → daily monitoring → discharged? → close Encounter
- Export-friendly diagram source
### Out of scope
- Second ERD
- Application implementation
### Expected files
- design/user-flow/patient-monitoring.drawio
- exported SVG/PNG if generated during the design phase
### Verification commands
- `git diff --stat`
- repository sanity check script
### Acceptance criteria
- The diagram is simple, suitable for export and placement in Canva, and aligned with the canonical workflow.
### Evidence required before completion
- Diagram consistency review confirming it covers the expected flow without duplicating the ERD.

## Phase 3 — Figma Wireframe
### Objective
Prepare the canonical form layout and behaviour specification for Figma.
### In scope
- Hospital + MRN lookup
- Patient Details
- Event Details
- Conditional transfer field
- Discharge Details
- Conditional discharge fields
- Daily Monitoring table
- Add Daily Log
- Save Draft / Submit
- Documentation for field mapping, labels, states and acceptance checklist
### Out of scope
- Replacing Figma with generated app code
- Production-grade UI implementation
### Expected files
- design/figma/README.md or field maps
- design/figma/flow-notes.md or similar planning docs
### Verification commands
- repository sanity check script
- design review checklist
### Acceptance criteria
- The wireframe plan is clear enough for Figma execution and consistent with the canonical domain model.
### Evidence required before completion
- Review against the required form states and acceptance checklist.

## Phase 4 — Canva Presentation Assembly
### Objective
Prepare all content needed for the final Canva presentation.
### Primary artifact
- docs/canva-slide-plan.md
### In scope
- Slide plan and structure
- Problem / Objective
- Assumptions
- Solution Overview
- Wireframe
- User Flow / UML
- Relational Data Model
- Validation + Reporting
- Summary
- Slide notes, captions and speaker notes
### Out of scope
- Replacement HTML presentation
- Application implementation
### Expected files
- docs/canva-slide-plan.md
- supporting slide content notes if needed
### Verification commands
- repository sanity check script
- design consistency review
### Acceptance criteria
- All slides have objective, title, max 2–4 key messages, visual artifact, caption, speaker note and estimated presentation time.
### Evidence required before completion
- Review confirming the slide structure is consistent with the ERD, UML and wireframe artifacts.

## Phase 5 — Presentation Review
### Objective
Review the full presentation for a 5–10 minute interview.
### In scope
- Requirement coverage
- Simple and elegant design
- Consistency across ERD, UML and wireframe
- SQL/database reasoning
- Validation
- Reporting
- Privacy
- Unnecessary complexity
- Likely panel questions
- Timing
### Out of scope
- New product scope
- Implementation work
### Expected files
- docs/presentation-review.md or similar review notes
### Verification commands
- presentation review checklist
- repository sanity check script
### Acceptance criteria
- The interview presentation is coherent, realistic and suitable for approximately 7 minutes of speaking time.
### Evidence required before completion
- Final review notes covering timing, risk areas and likely follow-up interview questions.

## Phase 6 — Portfolio Packaging
### Objective
Convert the finished interview artifacts into an anonymised public technical case study.
### In scope
- Polished README
- Exported diagrams
- Final PDF
- Canva view-only link
- Screenshots
- Public-facing packaging without exposing interview details or private materials
### Out of scope
- Publishing original interview instructions or organisation-specific materials
- Application development
### Expected files
- README.md updates
- final exported presentation assets
- final packaging notes
### Verification commands
- `git status --short --branch`
- repository sanity check script
### Acceptance criteria
- The repository is portfolio-ready and anonymised without leaking sensitive details.
### Evidence required before completion
- Final review showing clean packaging, documented evidence and no sensitive content leakage.

## Phase completion rule
A phase is not complete until the relevant artifact is reviewed, the design remains consistent with the canonical domain model, the repository diff is inspected, the required checks are run and the evidence is recorded.

## Coding boundary
The only code-like artifacts currently expected are:
- DBML for dbdiagram.io
- Draw.io XML or diagram source where useful
- lightweight verification scripts already part of the harness

Do not scaffold:
- .NET
- C#
- EF Core
- SQL runtime databases
- APIs
- frontend applications
- authentication systems

unless explicitly requested later in a separate implementation phase.
