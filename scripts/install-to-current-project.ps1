$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$KitRoot = Split-Path -Parent $ScriptDir
$TargetDir = (Get-Location).Path

if (-not (Test-Path -LiteralPath $TargetDir -PathType Container)) {
    Write-Error "当前目录不存在: $TargetDir"
}

if (-not (Test-Path -LiteralPath (Join-Path $KitRoot ".claude\agents") -PathType Container)) {
    Write-Error "工具包内容不完整，缺少 .claude/agents"
}

if (-not (Test-Path -LiteralPath (Join-Path $KitRoot ".claude\skills") -PathType Container)) {
    Write-Error "工具包内容不完整，缺少 .claude/skills"
}

New-Item -ItemType Directory -Force -Path (Join-Path $TargetDir ".claude\agents") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $TargetDir ".claude\skills") | Out-Null

function Backup-Path {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    $BackupPath = "$Path.bak"
    if (Test-Path -LiteralPath $BackupPath) {
        $Timestamp = Get-Date -Format "yyyyMMddHHmmss"
        $BackupPath = "$Path.bak.$Timestamp"
    }

    Move-Item -LiteralPath $Path -Destination $BackupPath
    Write-Host "已备份: $Path -> $BackupPath"
}

function Install-Entry {
    param(
        [Parameter(Mandatory = $true)]
        [string]$SourcePath,
        [Parameter(Mandatory = $true)]
        [string]$DestinationPath
    )

    if (Test-Path -LiteralPath $DestinationPath) {
        Backup-Path -Path $DestinationPath
    }

    Copy-Item -LiteralPath $SourcePath -Destination $DestinationPath -Recurse -Force
    Write-Host "已安装: $DestinationPath"
}

$AgentFiles = Get-ChildItem -LiteralPath (Join-Path $KitRoot ".claude\agents") -File -Filter *.md
foreach ($AgentFile in $AgentFiles) {
    $Destination = Join-Path $TargetDir ".claude\agents\$($AgentFile.Name)"
    Install-Entry -SourcePath $AgentFile.FullName -DestinationPath $Destination
}

$SkillDirs = Get-ChildItem -LiteralPath (Join-Path $KitRoot ".claude\skills") -Directory
foreach ($SkillDir in $SkillDirs) {
    $Destination = Join-Path $TargetDir ".claude\skills\$($SkillDir.Name)"
    Install-Entry -SourcePath $SkillDir.FullName -DestinationPath $Destination
}

Write-Host "安装完成。"
Write-Host "目标目录: $TargetDir"
Write-Host "已复制 .claude/agents 和 .claude/skills，原有同名内容已备份为 .bak。"
