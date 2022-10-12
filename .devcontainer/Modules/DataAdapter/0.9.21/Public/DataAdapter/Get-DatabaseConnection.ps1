Function Get-DatabaseConnection {
    [cmdLetBinding()]
    param ($ConnectionString)
    Write-Verbose "ConnectionString=$connectionstring"

    $conn = if ($ConnectionString -match '\bProvider=') {
        New-Object System.Data.OleDb.OleDbConnection($ConnectionString)
    } else {
        New-Object System.Data.SqlClient.SqlConnection($ConnectionString)
    }
    $conn.open()
    $conn
}