param(
    [string]$ProjectPath = "TodoApp.slnx"
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$resolvedProjectPath = if ([System.IO.Path]::IsPathRooted($ProjectPath)) {
    $ProjectPath
} else {
    Join-Path $scriptDir $ProjectPath
}

$buildOutput = & dotnet build $resolvedProjectPath --no-incremental 2>&1
$buildExitCode = $LASTEXITCODE

# Match warning lines from MSBuild/CSC output while avoiding summary lines.
$firstWarning = $buildOutput | Where-Object {
    $line = $_.ToString()
    $line -match "(^|\s)warning(\s+[A-Z]{2,}\d{3,})?\s*:" -and
    $line -notmatch "\b\d+\s+Warning\(s\)\b"
} | Select-Object -First 1

if ($firstWarning) {
    Write-Output $firstWarning
    exit 1
}

if ($buildExitCode -ne 0) {
    exit $buildExitCode
}

exit 0