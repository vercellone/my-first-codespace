Function Get-FixedWidthData {
    [cmdLetBinding()]
    Param (
        [Parameter(Mandatory=$true)]
        $Path,
        [Alias('Table','View')]
        [Parameter(ParameterSetName='Name')]
        $Name
    )
    begin {
        $conn = Get-FixedWidthConnection -Path $Path
    }
    process {
        Get-DataTable -Connection $conn -Name "$Name" -AsPSObject
    }
    end {
        $conn.Close()
        $conn.Dispose()
    }
}