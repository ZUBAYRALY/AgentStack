param(
    [string]$TargetProject = ""
)

$ErrorActionPreference = "Stop"
$RepoUrl = "https://github.com/ZUBAYRALY/AgentStack"
$ZipUrl  = "https://github.com/ZUBAYRALY/AgentStack/archive/refs/heads/main.zip"

Write-Host ""
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "   AgentStack - Cross-Platform Skills Installer (Win)   " -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

$TempDir = $null
$ScriptDir = if ($MyInvocation.MyCommand.Path) { Split-Path -Parent $MyInvocation.MyCommand.Path } else { $PWD.Path }
$SourceSkillsDir = Join-Path $ScriptDir ".agent\skills"

# If running remotely via `irm ... | iex` and local .agent\skills is not present, download automatically
if (-not (Test-Path $SourceSkillsDir)) {
    $TempDir = Join-Path $env:TEMP ("agentstack_" + [guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Path $TempDir -Force | Out-Null
    $ZipFile = Join-Path $TempDir "agentstack.zip"

    Write-Host "Downloading AgentStack skills package..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipFile -UseBasicParsing
    Expand-Archive -Path $ZipFile -DestinationPath $TempDir -Force

    $ExtractedRoot = Get-ChildItem -Path $TempDir -Directory | Select-Object -First 1
    $SourceSkillsDir = Join-Path $ExtractedRoot.FullName ".agent\skills"

    if (-not (Test-Path $SourceSkillsDir)) {
        Write-Host "[ERROR] Could not locate .agent\skills in downloaded archive." -ForegroundColor Red
        exit 1
    }
}

# 1. Install Globally into %USERPROFILE%\.gemini\config\skills
$GlobalSkillsDir = Join-Path $env:USERPROFILE ".gemini\config\skills"
if (-not (Test-Path $GlobalSkillsDir)) {
    New-Item -ItemType Directory -Path $GlobalSkillsDir -Force | Out-Null
}

# Normalize any legacy uppercase folder names on Windows
$LegacyFolders = @("Architecture", "Design", "Memory", "Phases", "PRD", "Rules")
foreach ($legacy in $LegacyFolders) {
    $legacyPath = Join-Path $GlobalSkillsDir $legacy
    if (Test-Path $legacyPath) {
        $lowerName = $legacy.ToLower()
        $tempPath = Join-Path $GlobalSkillsDir "${lowerName}_tmp_mig"
        Rename-Item -Path $legacyPath -NewName "${lowerName}_tmp_mig" -ErrorAction SilentlyContinue
        if (Test-Path $tempPath) {
            Rename-Item -Path $tempPath -NewName $lowerName -ErrorAction SilentlyContinue
        }
    }
}

$Skills = Get-ChildItem -Path $SourceSkillsDir -Directory | Sort-Object Name
$InstalledCount = 0

Write-Host "Installing skills globally to: $GlobalSkillsDir" -ForegroundColor Yellow
Write-Host ""

foreach ($skill in $Skills) {
    $destPath = Join-Path $GlobalSkillsDir $skill.Name
    if (Test-Path $destPath) {
        Remove-Item -Path $destPath -Recurse -Force
    }
    Copy-Item -Path $skill.FullName -Destination $destPath -Recurse -Force
    Write-Host ("  [OK] /{0,-20} -> Installed" -f $skill.Name) -ForegroundColor Green
    $InstalledCount++
}

# 2. Clean up deprecated global workflows folders if present
$LegacyGlobalWf = @(
    (Join-Path $env:USERPROFILE ".gemini\config\workflows"),
    (Join-Path $env:USERPROFILE ".gemini\config\global_workflows")
)
foreach ($wfPath in $LegacyGlobalWf) {
    if (Test-Path $wfPath) {
        Remove-Item -Path $wfPath -Recurse -Force
        Write-Host "  [CLEANED] Removed deprecated folder: $wfPath" -ForegroundColor DarkGray
    }
}

# 3. Optional: Install into a target project workspace if provided
if (-not [string]::IsNullOrWhiteSpace($TargetProject)) {
    $TargetAgentSkills = Join-Path $TargetProject ".agent\skills"
    Write-Host ""
    Write-Host "Installing skills into project workspace: $TargetAgentSkills" -ForegroundColor Yellow
    if (-not (Test-Path $TargetAgentSkills)) {
        New-Item -ItemType Directory -Path $TargetAgentSkills -Force | Out-Null
    }
    foreach ($skill in $Skills) {
        $destPath = Join-Path $TargetAgentSkills $skill.Name
        if (Test-Path $destPath) {
            Remove-Item -Path $destPath -Recurse -Force
        }
        Copy-Item -Path $skill.FullName -Destination $destPath -Recurse -Force
    }
    Write-Host "  [OK] Copied all $InstalledCount skills to $TargetAgentSkills" -ForegroundColor Green
}

# Cleanup temporary download folder if used
if ($TempDir -and (Test-Path $TempDir)) {
    Remove-Item -Path $TempDir -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  SUCCESS: $InstalledCount AgentStack Skills Installed Globally!" -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "Global Path : $GlobalSkillsDir"
Write-Host "Usage       : Open Antigravity IDE in any project and type /project, /droid, /webstack, /python, etc."
Write-Host ""
