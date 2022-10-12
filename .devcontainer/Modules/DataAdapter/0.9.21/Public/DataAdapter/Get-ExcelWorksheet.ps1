Function Get-ExcelWorksheet {
    [cmdLetBinding()]
    Param (
        [Parameter(Mandatory=$true,ParameterSetName='Connection')]
        $Connection,
        [Parameter(Mandatory=$true,ParameterSetName='Path')]
        $Path,
        [Alias('Name','Table','View')]
        $SheetName
    )
    begin {
        $singleUseConnection = $null -eq $Connection
        if ($singleUseConnection) {
            $Connection = Get-ExcelConnection -Path $Path
        }
    }
    process {
        $Worksheets = $Connection.GetOleDbSchemaTable([System.Data.OleDb.OleDbSchemaGuid]::Tables,$null)
        $Names = $Worksheets | Select-Object -ExpandProperty TABLE_NAME | ForEach-Object {
            Write-Verbose $_
            $_ -replace '\$$',''
        }
        if ($SheetName) {
            $Names = $Names | Where-Object { $_ -eq $SheetName }
        }
        $Names
    }
    end {
        if ($singleUseConnection) {
            $Connection.Close()
            $Connection.Dispose()
        }
    }
}