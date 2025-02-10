Remove-Item -Path fitbook/* -Recurse -Force
robocopy //host.lan/Data/fitbook-source fitbook /E /Z /R:3 /NFL /NDL /NP /XD build*
cd fitbook
dart run msix:create
robocopy build/windows/x64/runner/Release //host.lan/Data/fitbook /E /Z /R:3 /NFL /NDL /NP /XD build*
