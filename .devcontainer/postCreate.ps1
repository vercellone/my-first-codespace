#!/opt/microsoft/powershell/7/pwsh
# Use the interactive profile to Import Modules for notebooks
$interactiveProfileParams = @{
    Path  = Join-Path -Path $env:HOME -ChildPath '.config/powershell/Microsoft.dotnet-interactive_profile.ps1'
    # Import all embedded modules
    # Value = 'Get-ChildItem -Path /workspaces/my-first-codespace/.devcontainer/Modules -Filter *.psd1 -Recurse | Import-Module'
    # Import only DataAdapter
    Value = 'Import-Module /workspaces/my-first-codespace/.devcontainer/Modules/DataAdapter/0.9.21/DataAdapter.psd1'
}
if (! (Test-Path $interactiveProfileParams.Path)) {
    New-Item -Path $interactiveProfileParams.Path -Force -Type File
}
$null = Set-Content @interactiveProfileParams
