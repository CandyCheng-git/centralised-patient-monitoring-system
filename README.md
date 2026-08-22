# Centralised COVID-19 Patient Monitoring

A technical design case study for a centralised healthcare monitoring workflow intended to reduce repeated data entry, improve data quality and support faster reporting.

This repository uses synthetic/demo information only. It is not a production clinical system or a fully implemented .NET application. The interactive prototype demonstrates the proposed UI and workflow; this repository contains the technical design and supporting evidence.

## Solution Overview

**Requirements → Wireframe / UX → User Flow → ERD / Relational Data Model → Validation & Reporting → Proposed .NET Architecture**

The design separates reusable patient identity from hospital encounters and recurring daily monitoring records:

- `Hospital → Patient → Encounter → DailyLog`
- Patient details can be reused across multiple Encounters.
- Daily monitoring records are captured repeatedly under the relevant Encounter.

## Project Resources

- **Live Interactive Prototype:** [Open prototype](https://vic-care-flow.lovable.app/)
- **Final Presentation — PDF:** [View final presentation](design/Centralised%20COVID-19%20Patient%20Monitoring_v7.1.pdf)
- **Presentation Deck — Canva:** [Open presentation in Canva](https://vcemathmethods.my.canva.site/centralised-covid-19-patient-monitoring)
- **Interactive ERD — dbdiagram.io:** [Open interactive ERD](https://dbdiagram.io/d/patient-monitoring-ERD-6a852529fd15a881e5b0adb5)
- **ERD source and notes:** [design/erd/](design/erd/)
- **User Flow / Activity Diagram:** [design/user-flow/](design/user-flow/)
- **Use Case Diagram:** [design/use-case/](design/use-case/)
- **Canonical Solution:** [docs/canonical-solution.md](docs/canonical-solution.md)

## Key Design Decisions

- `Hospital → Patient → Encounter → DailyLog` is the canonical relationship chain.
- MRN / UR No. is unique within a Hospital, not globally.
- A Patient may have multiple Encounters, and an Encounter may contain multiple DailyLogs.
- Maximum one DailyLog is allowed per Encounter per calendar date.
- An open Encounter is represented by `DischargeDate IS NULL`.
- A redundant `NotYetDischarged` database flag is intentionally avoided.
- Client-side validation improves UX; server-side validation remains authoritative.
- Relational constraints protect data integrity.

## UX / Data Collection

Hospital + MRN lookup reduces repeated demographic entry. Existing Patient details can be reused across Encounters, while transfer and discharge fields appear conditionally. Daily monitoring is designed for quick recurring entry, with one monitoring record per Encounter/date.

## Reporting & Data Quality

Structured capture supports reporting such as current patients by hospital, Ward versus ICU status, admissions and discharges over time, and HAI-attributed cases.

**Client validation → Server validation → Database constraints**

## Proposed .NET Architecture

**Hospital Staff → ASP.NET Core → Application Layer → SQL Server → Reporting**

This is a proposed architecture, not implemented production architecture. A production implementation would require role-based access, an audit trail, privacy and healthcare data governance, and appropriate operational controls.

## Repository Structure

- `design/erd/` — DBML ERD source and supporting notes
- `design/user-flow/` — Draw.io activity/user-flow source
- `design/use-case/` — supporting Draw.io use-case diagram
- `design/prototype/` — prototype screenshots
- `design/` — final presentation PDF
- `docs/` — canonical design, decisions and project evidence
- `scripts/` — repository verification helper

## Scope / Disclaimer

This is a technical design and interactive prototype case study, not a production healthcare application. Use synthetic/demo information only; no real patient data should be entered. Production implementation would require appropriate security, privacy, authentication, auditability, testing, and clinical/governance review.
