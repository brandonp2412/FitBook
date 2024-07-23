Remove-Item -Path fitbook/* -Recurse -Force
cp -r -Force //host.lan/Data/fitbook-source/* fitbook
cd fitbook
dart run msix:create
cp -r -Force build/windows/x64/runner/Release/* //host.lan/Data/fitbook
