# Canonical Solution

This document is the source of truth for domain behaviour in this repository. Any implementation, documentation or review activity must remain consistent with this design. If a decision needs to change, that change must be recorded in docs/DECISIONS.md and the canonical design must be updated before implementation proceeds.

## Scope and intent
This project is a portfolio-quality technical case study for a centralised healthcare patient monitoring system. It is not intended to describe a production RMH or VICNISS architecture and must not claim to be a live production healthcare system. All content must use synthetic or demo data only.

## Canonical domain model
The canonical relationship chain is:

Hospital → Patient → Encounter → DailyLog

This means:
- A Hospital owns Patients.
- A Patient may have many Encounters.
- An Encounter belongs to one Patient and one Hospital.
- An Encounter may have many DailyLogs.
- A DailyLog belongs to one Encounter and one date.

## Core design principles
1. MRN / UR No. is unique within a Hospital, not globally.
2. A Patient may have multiple Encounters.
3. Maximum one DailyLog per Encounter per calendar date.
4. An open encounter is represented by a null DischargeDate. NotYetDischarged is not a second source of truth.
5. Client validation improves UX, but server validation is authoritative.
6. Database constraints protect relational integrity.
7. The system optimises for simple data entry, reliable data, reporting-ready relational structure and extensibility.
8. Privacy, auditability and role-based access are cross-cutting concerns and should be treated as first-class design considerations.

## Business rules
- Patient identity and hospital assignment must be explicit and validated.
- Encounter lifecycle is tracked by admission and discharge dates, with null discharge date denoting an active or open encounter.
- Daily monitoring records must be entered against a valid Encounter and must not exceed one log per date per Encounter.
- Validation must be explicit and should not rely on hidden assumptions or partial logic.
- Data integrity should be enforced in the database as well as in application-layer validation.

## Data integrity expectations
- Primary identifiers should be scoped correctly to the owning hospital and not treated as globally unique unless the design explicitly requires that.
- Referential integrity must be preserved across Hospital, Patient, Encounter and DailyLog records.
- Uniqueness constraints should protect the calendar-date rule for DailyLog entries within each Encounter.
- Null discharge dates must be used to represent open encounters rather than storing a redundant status field.

## Privacy and portfolio constraints
- No real patient information or personal identifiers should be stored in this repository.
- Synthetic or demo data is sufficient for all implementation and demonstration work.
- The project is a case study and should not imply operational healthcare deployment.

## Implementation notes
- Prefer explicit validation over implicit conventions.
- Prefer relational modelling and constraints over fragile application-only logic.
- Keep implementation simple and maintainable.
- Keep README and other portfolio documentation aligned with the actual behaviour of the code.

## Reference note
The external Canva presentation reference is intentionally treated as a presentation inspiration only. Repository correctness must not depend on access to or scraping of that reference.
