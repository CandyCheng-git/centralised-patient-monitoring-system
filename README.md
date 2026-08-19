# Centralised Patient Monitoring System

This repository is the development workspace for a portfolio-quality technical case study covering a centralised healthcare patient monitoring system.

## Current status
This is Phase 0 of the repository bootstrap. The project is intentionally not yet implemented as a full application. The repository is establishing the canonical design, governance, Codex harness and verification guardrails needed for disciplined phased development.

## Canonical domain
The canonical domain design is defined in docs/canonical-solution.md and remains the source of truth for behaviour.

Key principles:
- Hospital → Patient → Encounter → DailyLog
- MRN / UR No. unique within a Hospital, not globally
- Patient may have multiple Encounters
- Encounter may have multiple DailyLogs
- Maximum one DailyLog per Encounter per calendar date
- Open encounters are represented by a null DischargeDate
- Client validation improves UX; server validation is authoritative
- Synthetic/demo data only; no real patient information

## Governance and workflow
Repository-wide rules are documented in AGENTS.md. The development plan and future phases are defined in docs/DEVELOPMENT_PLAN.md.

## Verification
The Windows verification entry point is scripts/verify.ps1. At Phase 0 it performs repository sanity checks only and does not claim a build or application test pass.

## Presentation reference
The external Canva presentation reference is provided for portfolio inspiration only and is not required for repository correctness.
