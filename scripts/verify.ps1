$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$requiredDirs = @(
    'docs',
    '.agents',
    '.codex',
    'scripts'
)

$requiredFiles = @(
    'AGENTS.md',
    'README.md',
    'docs/canonical-solution.md',
    'docs/DEVELOPMENT_PLAN.md',
    'docs/DECISIONS.md',
    'docs/PROGRESS.md',
    'docs/REFERENCES.md',
    '.agents/skills/patient-monitoring-development/SKILL.md',
    '.codex/agents/architect.toml',
    '.codex/agents/implementer.toml',
    '.codex/agents/reviewer.toml',
    '.codex/hooks.json',
    '.codex/hooks/session_start.py',
    '.codex/hooks/stop_validate.py',
    'scripts/verify.ps1'
)

function Assert-PathExists {
    param(
        [string]$Path,
        [string]$Description
    )

    if (-not (Test-Path -LiteralPath (Join-Path $repoRoot $Path))) {
        throw "Missing ${Description}: ${Path}"
    }
}

try {
    if (-not (Test-Path -LiteralPath (Join-Path $repoRoot '.git'))) {
        throw 'This repository is not a valid git repository.'
    }

    foreach ($dir in $requiredDirs) {
        Assert-PathExists -Path $dir -Description 'directory'
    }

    foreach ($file in $requiredFiles) {
        Assert-PathExists -Path $file -Description 'file'
    }

    $jsonFiles = @(
        '.codex/hooks.json'
    )

    foreach ($file in $jsonFiles) {
        $path = Join-Path $repoRoot $file
        $content = Get-Content -LiteralPath $path -Raw
        $null = $content | ConvertFrom-Json
    }

    $tomlFiles = @(
        '.codex/agents/architect.toml',
        '.codex/agents/implementer.toml',
        '.codex/agents/reviewer.toml'
    )

    foreach ($file in $tomlFiles) {
        $path = Join-Path $repoRoot $file
        $text = Get-Content -LiteralPath $path -Raw
        if ([string]::IsNullOrWhiteSpace($text)) {
            throw "TOML file is empty: $file"
        }
    }

    $unexpectedApplications = @(
        '*.csproj',
        '*.sln',
        '*.db',
        '*.sqlite',
        '*.sql'
    )

    foreach ($pattern in $unexpectedApplications) {
        $matches = Get-ChildItem -LiteralPath $repoRoot -Recurse -File -Filter $pattern
        if ($matches.Count -gt 0) {
            throw "Unexpected application or data file pattern found: ${pattern}"
        }
    }

    Write-Host 'Phase 0 repository sanity checks passed.'
    Write-Host "Repository root: $repoRoot"
    Write-Host 'Required repository files and configuration are present.'
}
catch {
    Write-Error $_.Exception.Message
    exit 1
}
