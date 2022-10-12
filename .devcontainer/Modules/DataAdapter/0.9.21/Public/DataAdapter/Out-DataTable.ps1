Function Out-DataTable {
    [CmdletBinding()]
    param([Parameter(Position=0, Mandatory=$true, ValueFromPipeline = $true)] [PSObject[]]$InputObject)
    begin {
        $dt = new-object Data.datatable
        $First = $true
    }
    process {
        foreach ($object in $InputObject) {
            $dr = $dt.NewRow()
            foreach($property in $object.PsObject.get_properties()) {
                if ($first) {
                    $Col =  new-object Data.DataColumn
                    $Col.ColumnName = $property.Name.ToString()
                    $valueExists = Get-Member -InputObject $property -Name value
                    if ($valueExists){
                        if ($property.value -isnot [System.DBNull] -and $property.value -ne $null) {
                            $Col.DataType = [System.Type]::GetType("$(Get-Type $property.TypeNameOfValue)")
                        }
                    }
                    $dt.Columns.Add($Col)
                }
                if ($property.Value -is [array]) {
                    $dr.Item($property.Name) =$property.value | ConvertTo-XML -AS String -NoTypeInformation -Depth 1
                } elseif ($property.Value -is [System.Xml.XmlElement]) {
                    $dr.Item($property.Name) = $property.Value.OuterXml
                } elseif ($property.value -ne $null) {
                    $dr.Item($property.Name) = $property.value
                }
            }
            $dt.Rows.Add($dr)
            $First = $false
        }
    }
    end {
        Write-Output @(,($dt))
    }
<#
.SYNOPSIS
Creates a DataTable for an object.

.DESCRIPTION
Creates a DataTable based on an object's properties. (Based on Chad Miller's original work--see Links section.)

.INPUTS
Object. Any object can be piped to Out-DataTable.

.OUTPUTS
System.Data.DataTable
.EXAMPLE
$dt = Get-psdrive| Out-DataTable
This example creates a DataTable from the properties of Get-PsDrive and assigns output to the $dt variable.
.NOTES
Adapted from script by Marc van Orsouw see link
Version History
v1.0  - Chad Miller - Initial Release
v1.1  - Chad Miller - Fixed Issue with Properties
v1.2  - Chad Miller - Added setting column datatype by property as suggested by emp0
v1.3  - Chad Miller - Corrected issue with setting datatype on empty properties
v1.4  - Chad Miller - Corrected issue with DBNull
v1.5  - Chad Miller - Updated example
v1.6  - Chad Miller - Added column datatype logic with default to string
.LINK
http://thepowershellguy.com/blogs/posh/archive/2007/01/21/powershell-gui-scripblock-monitor-script.aspx
#>
}