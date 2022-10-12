Function ConvertFrom-DataTable {
    [CmdLetBinding()]
    param(
        [Parameter(Position=0,Mandatory=$true,ValueFromPipeline=$true)]
        [Alias('DataTable','InputObject','Source')]
        [System.Data.DataTable]$Table,
        [switch]$AsHashTable,
        [switch]$Force
    )
    process {
        $count = 0
        $properties = @{}
        foreach ($column in $Table.Columns) {
            $properties[$column.ColumnName] = $null
        }
        foreach ($row in $Table) {
            $object = $properties.PsObject.Copy()
            foreach ($column in $table.Columns) {
                $object.$($column.ColumnName) = $row.$($column.ColumnName)
            }
            $count++
            if ($AsHashTable) {
                $object
            } else {
                [pscustomobject]$object
            }
        }
        if ($Force -and $count -eq 0) {
            if ($AsHashTable) {
                $properties
            } else {
                [pscustomobject]$properties
            }
        }

    }
}
