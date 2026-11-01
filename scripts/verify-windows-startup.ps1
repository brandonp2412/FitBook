param(
    [Parameter(Mandatory = $true)][string]$SourceArchive,
    [Parameter(Mandatory = $true)][string]$PreFixLogger,
    [Parameter(Mandatory = $true)][string]$EvidenceDirectory
)

$ErrorActionPreference = 'Stop'
New-Item -ItemType Directory -Path 'C:\e2e' -Force | Out-Null
$workspace = Join-Path 'C:\e2e' ('fb-' + [guid]::NewGuid().ToString('N').Substring(0, 8))
New-Item -ItemType Directory -Path $workspace | Out-Null
New-Item -ItemType Directory -Path $EvidenceDirectory -Force | Out-Null
$result = @{ fixed = $null; preFix = $null; error = $null }

function Invoke-FlutterCheck([string]$Arguments, [string]$LogName) {
    $log = Join-Path $EvidenceDirectory $LogName
    $command = '""{0}" {1} > "{2}" 2>&1"' -f $script:flutter, $Arguments, $log
    $process = Start-Process -FilePath $env:ComSpec -ArgumentList @('/d', '/s', '/c', $command) -WorkingDirectory $workspace -PassThru
    $process.Handle | Out-Null
    $process.WaitForExit()
    return $process.ExitCode
}

try {
    tar -xf $SourceArchive -C $workspace
    if ($LASTEXITCODE -ne 0) { throw 'Source extraction failed' }
    $flutterCandidates = @(
        'C:\DevTools\flutter\bin\flutter.bat',
        'C:\flutter\bin\flutter.bat'
    )
    $script:flutter = $flutterCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1
    if (-not $script:flutter) {
        $script:flutter = (Get-Command flutter.bat -ErrorAction Stop).Source
    }
    $env:Path = (Split-Path $script:flutter) + ';C:\Program Files\Git\cmd;' + $env:Path
    Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber | ConvertTo-Json | Set-Content (Join-Path $EvidenceDirectory 'windows.json')
    if ((Invoke-FlutterCheck '--version' 'flutter-version.log') -ne 0) { throw 'Flutter version check failed' }

    $testArguments = 'test integration_test/windows_startup_storage_test.dart -d windows --reporter expanded'
    $result.fixed = Invoke-FlutterCheck $testArguments 'fixed.log'
    if ($result.fixed -ne 0) { throw 'Fixed startup integration test failed' }

    $logger = Join-Path $workspace 'lib\crash_logger.dart'
    $fixedLogger = [System.IO.File]::ReadAllBytes($logger)
    try {
        Copy-Item $PreFixLogger $logger -Force
        $result.preFix = Invoke-FlutterCheck ($testArguments + ' --plain-name "Windows starts with crash-log storage blocked"') 'pre-fix.log'
    } finally {
        [System.IO.File]::WriteAllBytes($logger, $fixedLogger)
    }
    $negativeLog = Get-Content (Join-Path $EvidenceDirectory 'pre-fix.log') -Raw
    if ($result.preFix -eq 0 -or
        $negativeLog -notmatch '(FileSystemException|PathExistsException): Creation failed' -or
        $negativeLog -notmatch 'CrashLogger\.install' -or
        $negativeLog -notmatch 'Found 0 widgets with type') {
        throw 'Pre-fix control did not reproduce the storage failure'
    }
} catch {
    $result.error = $_.ToString()
} finally {
    $result | ConvertTo-Json | Set-Content (Join-Path $EvidenceDirectory 'result.json')
    if ($null -eq $result.error) {
        '0' | Set-Content (Join-Path $EvidenceDirectory 'exit.txt')
    } else {
        '1' | Set-Content (Join-Path $EvidenceDirectory 'exit.txt')
    }
}

if ($null -ne $result.error) { throw $result.error }
