Function Invoke-DbExecuteNonQuery {
    [cmdLetBinding()]
    Param (
        [Parameter(Mandatory=$true)]
        $Connection,
        [Parameter(ParameterSetName='Query')]
        $Query
    )
    begin {
        if ($Connection -is [System.Data.SqlClient.SqlConnection]) {
            $cmd = New-Object System.Data.SqlClient.SqlCommand($Query,$Connection)
        } elseif ($Connection -is [Oracle.ManagedDataAccess.Client.OracleConnection]) {
            $cmd = New-Object Oracle.ManagedDataAccess.Client.OracleCommand($Query,$Connection)
        } else {
            $cmd = New-Object System.Data.OleDb.OleDbCommand($Query,$Connection)
        }
    }
    process {
        $cmd.ExecuteNonQuery()
    }
    end {
        $cmd.Dispose()
    }
}