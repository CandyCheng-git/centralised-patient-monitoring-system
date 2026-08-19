# Patient Monitoring ERD

## Purpose

This ERD presents the simple relational model for a centralised patient monitoring case study. It is designed for direct import into dbdiagram.io and export for the Canva interview presentation.

## Core relationships

- One `Hospital` owns many `Patient` records.
- One `Patient` may have many `Encounter` records.
- One `Encounter` may have many `DailyLog` records.

This keeps the canonical chain as `Hospital -> Patient -> Encounter -> DailyLog`.

## Key design choices

- `Patient` and `Encounter` are separate because one patient can have multiple encounters. Demographics are stored once instead of being repeated for every admission.
- `MRN` / UR No. is unique within a hospital through `UNIQUE(HospitalId, MRN)`. The same MRN value may therefore exist in different hospitals.
- An open encounter is identified by `DischargeDate IS NULL`. `NotYetDischarged` is not persisted, avoiding two fields that could disagree.
- Duplicate daily entries are prevented by `UNIQUE(EncounterId, LogDate)`. `LogDate` is a calendar `date`, so each encounter can have at most one log per day.
- `TransferredFromFacility` records whether the encounter was transferred in. When it is true, `InitialHospitalAdmissionDate` captures the prior admission date; the source facility itself is outside this presentation scope.

## Controlled values

The presentation version documents controlled values in DBML notes instead of adding four lookup tables:

- `Sex`: Male; Female; Other
- `CovidStatusOnAdmission`: Confirmed COVID-19; Suspected COVID-19; Not Suspected COVID-19
- `DischargeStatus`: Home; Hospital in the Home; Deceased; Transferred to other facility
- `LocationStatus`: Ward; ICU; COVID-19 isolation precautions lifted; Discharged

This keeps the interview diagram readable. A production implementation could validate these values through server-side validation and database constraints or reference data.

## Indexing and reporting

The model includes reporting candidates for encounter admission date, COVID status and discharge date, plus `(LogDate, LocationStatus)` for daily monitoring reports. The unique indexes on `(HospitalId, MRN)` and `(EncounterId, LogDate)` also provide the required lookup paths, so separate duplicate indexes are intentionally omitted.

## Assumptions and limitations

- Dates are represented as SQL Server `date`; timestamps use `datetime2`.
- Boolean fields represent whether a transfer occurred and whether HAI was attributed to the health service.
- The diagram does not model users, permissions, audit history, clinical measurements or operational integration.
- All examples and presentation content must use synthetic or demo data only.

## Open in dbdiagram.io

1. Copy the contents of `design/erd/patient-monitoring.dbml`.
2. Open [dbdiagram.io](https://dbdiagram.io/) and create a new diagram.
3. Paste the DBML into the editor, or use the import option if offered.
4. Confirm that the four tables appear with one-to-many links in the order `Hospital -> Patient -> Encounter -> DailyLog`.
5. Visually check the PK/FK links, the two composite unique indexes, nullable discharge fields, and readable table spacing.
6. Export the validated diagram as SVG or PNG from dbdiagram.io.
7. Place the exported SVG at `assets/erd/patient-monitoring-erd.svg` (or the equivalent PNG path if PNG is selected).

Manual import into dbdiagram.io and visual export remain required; they have not been performed locally.