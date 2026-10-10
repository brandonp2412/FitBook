$ErrorActionPreference = 'Stop'

$originalRunnerTemp = $env:RUNNER_TEMP
$testRoot = Join-Path $originalRunnerTemp "fitbook-upload-test-$([guid]::NewGuid())"
$release = Join-Path $testRoot 'build/windows/x64/runner/Release'
New-Item -ItemType Directory -Path $release -Force | Out-Null

try {
  Set-Content -LiteralPath (Join-Path $release 'fit_book.exe') -Value 'fixture executable'
  Set-Content -LiteralPath (Join-Path $release 'fit_book.pdb') -Value 'fixture debug symbols'
  Set-Content -LiteralPath (Join-Path $release 'sample.msix') -Value 'fixture MSIX'

  $env:RUNNER_TEMP = $testRoot
  Push-Location $testRoot
  try {
    & "$PSScriptRoot/create-store-upload.ps1"
  } finally {
    Pop-Location
  }

  $upload = Join-Path $release 'fitbook.msixupload'
  if (-not (Test-Path -LiteralPath $upload)) { throw 'MSIX upload was not created.' }

  $outer = [System.IO.Compression.ZipFile]::OpenRead($upload)
  try {
    $actualNames = @($outer.Entries | ForEach-Object { $_.FullName } | Sort-Object)
    if (($actualNames -join ',') -ne 'fitbook.appxsym,sample.msix') {
      throw "Unexpected upload contents: $($actualNames -join ', ')"
    }
    $symEntry = $outer.GetEntry('fitbook.appxsym')
    $symStream = [System.IO.MemoryStream]::new()
    try {
      $inputStream = $symEntry.Open()
      try { $inputStream.CopyTo($symStream) } finally { $inputStream.Dispose() }
      $symStream.Position = 0
      $inner = [System.IO.Compression.ZipArchive]::new($symStream, [System.IO.Compression.ZipArchiveMode]::Read, $true)
      try {
        $symbolNames = @($inner.Entries | ForEach-Object { $_.FullName })
        if ($symbolNames.Count -ne 1 -or $symbolNames[0] -ne 'fit_book.pdb') {
          throw "Unexpected symbols: $($symbolNames -join ', ')"
        }
      } finally { $inner.Dispose() }
    } finally { $symStream.Dispose() }
  } finally { $outer.Dispose() }

  Write-Host 'Store upload fixture passed: MSIX + appxsym/PDB archive.'
} finally {
  $env:RUNNER_TEMP = $originalRunnerTemp
  Remove-Item -LiteralPath $testRoot -Recurse -Force
}
