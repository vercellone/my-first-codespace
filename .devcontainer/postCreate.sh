#!/opt/microsoft/powershell/7/pwsh
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
foreach($module in 'Az','Pester') {
    Install-Module -Name $module -Scope AllUsers -Repository PSGallery
}
Set-PSRepository -Name PSGallery -InstallationPolicy Untrusted
