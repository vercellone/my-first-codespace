Function Get-OracleData {
    [cmdLetBinding()]
    param (
        $Connection,
        $DataSource,
        $Password,
        [Parameter(ParameterSetName='Query')]
        $Query,
        [Alias('Table','View')]
        [Parameter(ParameterSetName='Object')]
        $Object,
        $User,
        [Alias('Scalar')]
        [Parameter(ParameterSetName='Query')]
        [switch]
        $ExecuteScalar
    )
    begin {
        $singleUseConnection = $null -eq $Connection
        if ($singleUseConnection) {
            $Connection = Get-OracleConnection -DataSource $DataSource -User $User -Password $Password
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