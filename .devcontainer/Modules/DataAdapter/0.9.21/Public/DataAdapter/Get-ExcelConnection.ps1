Function Get-ExcelConnection {
    [cmdLetBinding()]
    param ($Path)

    Get-DatabaseConnection "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=$Path;Extended Properties=Excel 12.0"
#    $Tables = $conn.GetOleDbSchemaTable([System.Data.OleDb.OleDbSchemaGuid]::tables,$null)
#    $Tables | Select-Object -ExpandProperty TABLE_NAME | ForEach-Object {
#        Write-Verbose $_
#    }
    # Retrieving column details from MS Access export specifications
    #SELECT s.SpecName, 'Col' & (select count(1) from MSysIMEXColumns i where i.Start <= o.Start AND i.SpecId = o.SpecId) & '=' & [o].[FieldName] & ',' & [o].[Width] AS Expr1, o.Start
    #FROM MSysIMEXColumns AS o INNER JOIN MSysIMEXSpecs AS s ON o.SpecID = s.SpecID
    #ORDER BY s.SpecName,o.Start;
}