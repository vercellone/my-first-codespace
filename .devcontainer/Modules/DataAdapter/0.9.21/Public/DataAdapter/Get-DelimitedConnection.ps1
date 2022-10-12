Function Get-DelimitedConnection {
    [cmdLetBinding()]
    param (
        $Delimiter=',',
        [bool]
        $ColNameHeader=$true,
        [Parameter(Mandatory=$true)]
        $Path
    )
    $Directory = Split-Path -Path $Path -Parent
    $File = Split-Path -Path $Path -Leaf
    $schema = "[$File]"
    if ($Delimiter -eq "`t") {
        $schema += "`nFormat=TabDelimited"
    } else {
        $schema += "`nFormat=Delimited({0})" -f $Delimiter
    }
    if ($ColNameHeader) {
        $schema += "`nColNameHeader=True"
    }
    $schemaini = Join-Path $Directory 'schema.ini'
    $schema | Out-file -FilePath $schemaini -Force
    #Get-DatabaseConnection "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=$Path;Extended Properties='text;HDR=$HDR;FMT=Delimited($Delimter)';"
    Get-DatabaseConnection "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=$Directory;Extended properties='text'"
}