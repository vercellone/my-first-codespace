#!/opt/microsoft/powershell/7/pwsh
# Use the interactive profile to Import Modules for notebooks
$interactiveProfileParams = @{
    Path  = Join-Path -Path $env:HOME -ChildPath '.config/powershell/Microsoft.dotnet-interactive_profile.ps1'
    Value = 'Get-ChildItem -Path /workspaces/my-first-codespace/.devcontainer/Modules -Filter *.psd1 -Recurse | Import-Module'
}
if (! (Test-Path $interactiveProfileParams.Path)) {
    New-Item -Path $interactiveProfileParams.Path -Force -Type File
}
$null = Set-Content @interactiveProfileParams
