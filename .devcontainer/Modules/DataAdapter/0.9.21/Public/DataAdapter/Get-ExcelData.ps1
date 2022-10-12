Function Get-ExcelData {
    [cmdLetBinding()]
    Param (
        [Parameter(Mandatory=$true,ParameterSetName='Connection')]
        $Connection,
        [Parameter(Mandatory=$true,ParameterSetName='Path')]
        $Path,
        [Alias('Name','Table','View')]
        $SheetName,
        [switch]
        $AsDataTable
    )
    begin {
        $singleUseConnection = $null -eq $Connection
        if ($singleUseConnection) {
            $Connection = Get-ExcelConnection -Path $Path
        }
    }
    process {
        Get-DataTable -Connection $Connection -Name "$SheetName" -AsPSObject:(-not $AsDataTable)
    }
    end {
        if ($singleUseConnection) {
            $Connection.Close()
            $Connection.Dispose()
        }
    }
}