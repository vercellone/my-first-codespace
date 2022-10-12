Function Add-Property {
    [cmdLetBinding()]
    param(
        [Parameter(ValueFromPipeline=$true)]
        $InputObject,
        [Hashtable]
        $Property,
        [ValidateSet("AliasProperty","CodeMethod","CodeProperty","Noteproperty","ScriptMethod"," ScriptProperty")]
        $MemberType="NoteProperty"
    )
    process {
        foreach($item in $InputObject) {
            Foreach ($prop in $Property.Keys) {
                $item | Add-Member -MemberType $MemberType -Name $prop -Value $Property.$prop
            }
            $item
        }
    }
}