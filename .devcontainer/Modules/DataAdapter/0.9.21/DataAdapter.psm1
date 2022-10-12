Set-StrictMode -Version Latest

$ScriptPath = Split-Path $MyInvocation.MyCommand.Path
$null = [System.reflection.Assembly]::LoadFile("$ScriptPath\Oracle.ManagedDataAccess.dll")

#region Load Public Functions

Get-ChildItem "$ScriptPath\Public" -Filter *.ps1 -Recurse| Select-Object -ExpandProperty FullName |
    ForEach-Object {
        $Function = Split-Path $_ -Leaf
        try {
            . $_
        } catch {
            Write-Warning ("{0}: {1}" -f $Function,$_.Exception.Message)
            Continue
        }
    }

#endregion

Export-ModuleMember -Function *