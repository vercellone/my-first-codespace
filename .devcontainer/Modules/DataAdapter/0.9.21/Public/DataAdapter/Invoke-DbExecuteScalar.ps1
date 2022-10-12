Function Invoke-DbExecuteScalar {
    [cmdLetBinding()]
    Param (
        [Parameter(Mandatory=$true)]
        $Connection,
        [Parameter(ParameterSetName='Query')]
        $Query
    )
    if ($Connection -is [System.Data.SqlClient.SqlConnection]) {
        $cmd = New-Object System.Data.SqlClient.SqlCommand($Query,$Connection)
        $cmd.ExecuteScalar()
    } elseif ($Connection -is [Oracle.ManagedDataAccess.Client.OracleConnection]) {
        $cmd = New-Object Oracle.ManagedDataAccess.Client.OracleCommand($Query,$Connection)
        $cmd.ExecuteScalar()
    } else {
        $cmd = New-Object System.Data.OleDb.OleDbCommand($Query,$Connection)
        $cmd.ExecuteScalar()
    }
}