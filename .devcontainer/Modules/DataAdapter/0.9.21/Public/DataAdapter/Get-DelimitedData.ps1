Function Get-DelimitedData {
    [cmdLetBinding()]
    Param (
        $Delimiter=',',
        [bool]
        $ColNameHeader=$true,
        [Parameter(Mandatory=$true)]
        $Path,
        [Parameter(ParameterSetName='CommandText')]
        $CommandText="SELECT * FROM [$((Split-Path $Path -Leaf) -replace '\.','#')]"
    )
    begin {
        $conn = Get-DelimitedConnection -Path $Path -Delimiter $Delimiter -ColNameHeader $ColNameHeader
    }
    process {
        Get-DataTable -Connection $conn -CommandText $CommandText
    }
    end {
        $conn.Close()
        $conn.Dispose()
    }
}