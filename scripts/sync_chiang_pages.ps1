$ErrorActionPreference = 'Stop'

$repo = Split-Path -Parent $PSScriptRoot
$source = Join-Path $repo 'Chiang/SpeechLLM'
$sourceSlides = Join-Path $source 'llama-omni'
$published = Join-Path $repo 'docs/Chiang/SpeechLLM'
$publishedSlides = Join-Path $published 'llama-omni'

New-Item -ItemType Directory -Path $publishedSlides -Force | Out-Null
New-Item -ItemType Directory -Path (Join-Path $publishedSlides 'assets') -Force | Out-Null

Copy-Item -LiteralPath (Join-Path $source 'index.html') -Destination (Join-Path $published 'index.html') -Force
Copy-Item -LiteralPath (Join-Path $sourceSlides 'slides.html') -Destination (Join-Path $publishedSlides 'slides.html') -Force
Copy-Item -LiteralPath (Join-Path $sourceSlides 'slides.css') -Destination (Join-Path $publishedSlides 'slides.css') -Force
Copy-Item -LiteralPath (Join-Path $sourceSlides 'assets/llama-omni-architecture.png') -Destination (Join-Path $publishedSlides 'assets/llama-omni-architecture.png') -Force

$sourceFiles = Join-Path $sourceSlides 'slides_files'
$publishedFiles = Join-Path $publishedSlides 'slides_files'
Get-ChildItem -LiteralPath $sourceFiles -Recurse -File | ForEach-Object {
  $relative = $_.FullName.Substring($sourceFiles.Length + 1)
  $destination = Join-Path $publishedFiles $relative
  New-Item -ItemType Directory -Path (Split-Path -Parent $destination) -Force | Out-Null
  Copy-Item -LiteralPath $_.FullName -Destination $destination -Force
}

$report = Join-Path $published 'index.html'
$html = [IO.File]::ReadAllText($report)
foreach ($replacement in @(
  @('href="../../docs/styles.css"', 'href="../../styles.css"'),
  @('href="../../docs/index.html"', 'href="../../index.html"')
)) {
  if (-not $html.Contains($replacement[0])) {
    throw "Expected link missing from report: $($replacement[0])"
  }
  $html = $html.Replace($replacement[0], $replacement[1])
}
[IO.File]::WriteAllText($report, $html, [Text.UTF8Encoding]::new($false))

Write-Output "Published Chiang pages to $published"
