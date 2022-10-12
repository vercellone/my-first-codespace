Function Get-OracleConnection {
    [cmdLetBinding()]
    param (
        $Password,
        $DataSource,
        $User
    )
    ## https://www.connectionstrings.com/oracle/
    ## https://docs.oracle.com/database/121/ODPNT/featConnecting.htm#ODPNT163

    $connectionstring = "Data Source=$DataSource;User Id=$User;Password=$Password;"

    Write-Verbose "ConnectionString=$connectionstring"
    $conn = New-Object Oracle.ManagedDataAccess.Client.OracleConnection($connectionstring)
    $conn.open()
    $conn
}