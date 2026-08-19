# Architectural Decisions

## Decision 1: Canonical model remains Hospital → Patient → Encounter → DailyLog
The repository uses the canonical chain Hospital, Patient, Encounter and DailyLog. This is the design source of truth and must not be silently changed.

## Decision 2: MRN / UR No. is scoped to the hospital, not global
MRN or UR No. uniqueness is defined in the context of a Hospital. A global identifier assumption would create incorrect relational assumptions and is not part of the canonical design.

## Decision 3: Open encounters are represented by a null discharge date
A null DischargeDate indicates an active or open encounter. The project explicitly avoids persisting NotYetDischarged as a second source of truth because it introduces split-brain state.

## Decision 4: DailyLog uniqueness is enforced per encounter and per date
The model allows multiple DailyLogs across patient encounters, but only one DailyLog per Encounter per calendar date.

## Decision 5: Validation is explicit and database-enforced
Client-side validation improves UX, but server-side validation is the authoritative check. Relational and uniqueness constraints are used to protect data integrity.

## Decision 6: Synthetic/demo data and no real patient information
This repository is a portfolio case study and must remain free of real patient data, interview details and sensitive contact information.

## Decision 7: Keep the implementation simple and phase-gated
Feature work must remain narrow and focused. Large refactors or speculative architecture should not be mixed into the active phase.

## Decision 8: Evidence and documentation must match reality
The repository must not claim build or test success without recorded execution evidence. README and documentation must reflect the actual implemented state.

## Decision 9: Phase 0 is a harness bootstrap only
This phase sets up the repository governance, canonical design documentation, Codex conventions and verification guardrails. It does not implement the application.
