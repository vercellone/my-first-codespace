Function New-ExcelWorksheet {
    [cmdLetBinding()]
    Param (
        [Parameter(Mandatory=$true,ParameterSetName='Connection')]
        $Connection,
        [Parameter(Mandatory=$true,ParameterSetName='Path')]
        $Path,
        [Alias('Name','Table','View')]
        [Parameter(Mandatory=$true)]
        $SheetName,
        [Parameter(Mandatory=$true)]
        $Fields
    )
    begin {
        $singleUseConnection = $null -eq $Connection
        if ($singleUseConnection) {
            $Connection = Get-ExcelConnection -Path $Path
        }
    }
    process {
        if (Get-ExcelWorksheet -Connection $Connection -SheetName $SheetName) {
            Write-Warning "'$SheetName' already exists in $Path"
        } else {
            Invoke-DbExecuteNonQuery -Connection $Connection -Query "CREATE TABLE $SheetName ($Fields)" | Out-Null
        }
    }
    end {
        if ($singleUseConnection) {
            $Connection.Close()
            $Connection.Dispose()
        }
    }
}