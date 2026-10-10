# Microsoft Store accepts .msixupload archives containing an MSIX and an
# .appxsym archive of PDBs: https://learn.microsoft.com/en-us/windows/msix/package/packaging-uwp-apps
# Keep the symbols separate from the installable MSIX package.
$ErrorActionPreference = 'Stop'

$buildDirectory = 'build/windows/x64'
$releaseDirectory = Join-Path $buildDirectory 'runner/Release'
$packages = @(Get-ChildItem -LiteralPath $releaseDirectory -Filter '*.msix' -File -Recurse)
if ($packages.Count -ne 1) {
  throw "Expected one MSIX package in $releaseDirectory, found $($packages.Count)."
}

$binaries = @(Get-ChildItem -LiteralPath $releaseDirectory -File |
  Where-Object { $_.Extension -in '.exe', '.dll' })
$binaryNames = @($binaries | ForEach-Object { $_.BaseName })
if ('fit_book' -notin $binaryNames) {
  throw 'The release directory is missing fit_book.exe.'
}

$symbols = @(Get-ChildItem -LiteralPath $buildDirectory -Filter '*.pdb' -File -Recurse |
  Where-Object { $_.BaseName -in $binaryNames -and $_.Directory.Name -eq 'Release' })
if ('fit_book' -notin @($symbols | ForEach-Object { $_.BaseName })) {
  throw 'The release build is missing fit_book.pdb. Ensure release /Zi and /DEBUG:FULL are enabled.'
}

$stagingDirectory = Join-Path $env:RUNNER_TEMP 'fitbook-store-symbols'
New-Item -ItemType Directory -Path $stagingDirectory -Force | Out-Null
foreach ($symbol in $symbols) {
  $target = Join-Path $stagingDirectory $symbol.Name
  if (Test-Path -LiteralPath $target) {
    throw "Duplicate symbol filename $($symbol.Name); cannot safely flatten the .appxsym archive."
  }
  Copy-Item -LiteralPath $symbol.FullName -Destination $target
}

$symbolZip = Join-Path $env:RUNNER_TEMP 'fitbook.appxsym.zip'
Compress-Archive -Path (Join-Path $stagingDirectory '*.pdb') -DestinationPath $symbolZip
$symbolArchive = Join-Path $env:RUNNER_TEMP 'fitbook.appxsym'
Move-Item -LiteralPath $symbolZip -Destination $symbolArchive

$uploadDirectory = Join-Path $env:RUNNER_TEMP 'fitbook-store-upload'
New-Item -ItemType Directory -Path $uploadDirectory -Force | Out-Null
Copy-Item -LiteralPath $packages[0].FullName -Destination $uploadDirectory
Copy-Item -LiteralPath $symbolArchive -Destination $uploadDirectory
$uploadZip = Join-Path $env:RUNNER_TEMP 'fitbook.msixupload.zip'
Compress-Archive -Path (Join-Path $uploadDirectory '*') -DestinationPath $uploadZip
$upload = Join-Path $releaseDirectory 'fitbook.msixupload'
Move-Item -LiteralPath $uploadZip -Destination $upload

# Verify the actual zip entries before attempting to submit to Partner Center.
$archive = [System.IO.Compression.ZipFile]::OpenRead((Resolve-Path $upload).Path)
try {
  $entries = @($archive.Entries | ForEach-Object { $_.FullName })
  if ($entries.Count -ne 2 -or $packages[0].Name -notin $entries -or 'fitbook.appxsym' -notin $entries) {
    throw "Unexpected MSIX upload archive entries: $($entries -join ', ')"
  }
} finally {
  $archive.Dispose()
}

Write-Host "Created $upload containing $($packages[0].Name) and $($symbols.Count) native symbol files."
