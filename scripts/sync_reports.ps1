# Publish the existing self-contained reports without editing contributor originals.
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$reports = @(
    @{ Source = 'Liu/report/report/report.html'; Destination = 'Liu/report.html' },
    @{ Source = 'chiu/seamless_streaming_progress.html'; Destination = 'chiu/seamless_streaming_progress.html' }
)

# Validate all inputs before copying. These reports currently embed their resources.
foreach ($report in $reports) {
    $source = Join-Path $repoRoot $report.Source
    if (-not (Test-Path -LiteralPath $source -PathType Leaf)) {
        throw "Missing rendered report: $($report.Source). Render it with Quarto first."
    }
}
foreach ($report in $reports) {
    $source = Join-Path $repoRoot $report.Source
    $destination = Join-Path (Join-Path $repoRoot 'docs') $report.Destination
    New-Item -ItemType Directory -Path (Split-Path -Parent $destination) -Force | Out-Null
    Copy-Item -LiteralPath $source -Destination $destination -Force
    Write-Output "Published docs/$($report.Destination)"
}
