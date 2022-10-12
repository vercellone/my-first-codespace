Function Get-SqlData {
    [cmdLetBinding()]
    param (
        $Connection,
        [Alias('InitialCatalog')]
        $Database,
        $Password,
        #[ValidateSet('sqloledb','SQLNCLI','SQLNCLI10','SQLNCLI11')]
        $Provider,
        [Parameter(ParameterSetName='Query')]
        $Query,
        [Alias('Table','View')]
        [Parameter(ParameterSetName='Object')]
        $Object,
        [Alias('DataSource')]
        #[ValidatePattern('^\w+(\\\w+)?$')]
        $Server,
        $User,
        [Alias('Scalar')]
        [Parameter(ParameterSetName='Query')]
        [switch]
        $ExecuteScalar
    )
    begin {
        $singleUseConnection = $null -eq $Connection
        if ($singleUseConnection) {
            $Connection = Get-SqlConnection -Server $Server -Database $Database -User $User -Password $Password -Provider $Provider
        }
    }
    process {
        switch ($PSCmdlet.ParameterSetName) {
            'Query' {
                if ($ExecuteScalar) {
                    Invoke-DbExecuteScalar -Connection $Connection -Query "$Query"
                } else {
                    Get-DataTable -Connection $Connection -CommandText "$Query"
                }
            }
            'Object' {
                Get-DataTable -Connection $Connection -Name "$Object"
            }
        }
    }
    end {
        if ($singleUseConnection) {
            $Connection.Close()
            $Connection.Dispose()
        }
    }
}