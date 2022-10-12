Function Get-SqlConnection {
    [cmdLetBinding()]
    param (
        [Alias('InitialCatalog')]
        $Database,
        $Password,
        $Provider,
        [Alias('DataSource')]
        #[ValidatePattern('^\w+(\\\w+)?$')]
        $Server,
        $User
    )
    ## http://www.connectionstrings.com/sqlconnection/
    ## http://www.connectionstrings.com/sql-server/
    ## http://www.connectionstrings.com/sql-server-native-client-11-0-oledb-provider/
    ## http://www.connectionstrings.com/microsoft-ole-db-provider-for-sql-server-sqloledb/

    $connectionstring = ''
    if ($null -eq $Provider) {
        $connectionstring += "Server=$Server;Database=$Database;"
        if ($User -and $Password) {
            $connectionstring += "User Id=$User;Password=$Password;"
        } else {
            $connectionstring += 'Trusted_Connection=True;'
        }
    } else {
        $connectionstring += "Provider=$Provider;Data Source=$Server;Initial Catalog=$Database;"
        if ($User -and $Password) {
            $connectionstring += "Uid=$User;Pwd=$Password;"
        } else {
            $connectionstring += 'Integrated Security=SSPI;'
        }
    }
    Write-Verbose "ConnectionString=$connectionstring"
    Get-DatabaseConnection -ConnectionString $connectionstring
}