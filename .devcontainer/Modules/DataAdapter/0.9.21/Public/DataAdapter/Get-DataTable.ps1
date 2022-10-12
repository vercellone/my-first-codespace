Function Get-DataTable {
    [cmdLetBinding()]
    Param (
        [Parameter(Mandatory=$true)]
        $Connection,
        [Alias('Table','View')]
        [Parameter(ParameterSetName='Name')]
        $Name,
        [Parameter(ParameterSetName='CommandText')]
        $CommandText="SELECT * FROM [$Name]",
        [switch]
        $AsPSObject
    )
    $dt = New-Object System.Data.DataTable
    if ($Connection -is [System.Data.SqlClient.SqlConnection]) {
        $cmd = New-Object System.Data.SqlClient.SqlCommand($CommandText,$Connection)
        $da = New-Object System.Data.SqlClient.SqlDataAdapter($cmd)
        [void]$da.fill($dt)
    } elseif ($Connection -is [Oracle.ManagedDataAccess.Client.OracleConnection]) {
        $cmd = New-Object Oracle.ManagedDataAccess.Client.OracleCommand($CommandText,$Connection)
        $da = New-Object Oracle.ManagedDataAccess.Client.OracleDataAdapter($cmd)
        [void]$da.fill($dt)
    } else {
        $cmd = New-Object System.Data.OleDb.OleDbCommand($CommandText,$Connection)
        $da = New-Object System.Data.OleDb.OleDbDataAdapter($cmd)
        #$dt.TableName = $name.split('#')[0]
        [void]$da.fill($dt)
    }
    if ($AsPSObject) {
        $dt
    } else {
        @(,($dt))
    }
}