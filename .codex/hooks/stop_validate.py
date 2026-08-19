#!/usr/bin/env python3
"""Conservative stop-hook validation for the patient monitoring repository."""

from __future__ import annotations

import os
import re
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
PROGRESS = ROOT / "docs" / "PROGRESS.md"


def is_stop_continuation_active() -> bool:
    raw = os.environ.get("CODEX_STOP_CONTINUATION", "").strip().lower()
    if raw in {"1", "true", "yes", "active", "continuing"}:
        return True

    for value in sys.argv[1:]:
        lowered = value.strip().lower()
        if lowered in {"--continue", "--continuation-active", "--stop-continue-active", "continue"}:
            return True
    return False


def git_status_clean() -> bool:
    result = subprocess.run(
        ["git", "status", "--porcelain"],
        cwd=str(ROOT),
        capture_output=True,
        text=True,
        check=False,
    )
    return result.returncode == 0 and result.stdout.strip() == ""


def parse_progress_markers() -> tuple[bool, bool, str]:
    if not PROGRESS.exists():
        return False, False, "docs/PROGRESS.md is missing."

    content = PROGRESS.read_text(encoding="utf-8")
    phase_complete = bool(re.search(r"Phase\s+0\s+.*(complete|completed|done)", content, flags=re.IGNORECASE))
    sha_present = bool(re.search(r"Commit\s+SHA\s*:\s*[0-9a-fA-F]{7,40}", content))
    evidence_present = bool(re.search(r"Verification|Evidence|Tests|Build", content, flags=re.IGNORECASE))

    if phase_complete and not sha_present:
        return True, False, "docs/PROGRESS.md claims a completed phase but no commit SHA is recorded."
    if phase_complete and not evidence_present:
        return True, False, "docs/PROGRESS.md claims a completed phase but required verification evidence is absent."
    return phase_complete, sha_present, ""


def main() -> int:
    if is_stop_continuation_active():
        print("Stop continuation already active; skipping stop validation to avoid a hook loop.")
        return 0

    phase_complete, sha_present, message = parse_progress_markers()
    if phase_complete and not sha_present:
        print(f"CONTINUATION: {message}")
        return 1

    if phase_complete and not git_status_clean():
        print("CONTINUATION: A completed phase is recorded, but the working tree still contains changes. Review and commit the remaining work before stopping.")
        return 1

    if not phase_complete and not git_status_clean():
        print("CONTINUATION: The repository has uncommitted changes. Commit or review them before claiming phase completion.")
        return 0

    print("Stop validation passed: no obvious incomplete completion claim was detected.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
