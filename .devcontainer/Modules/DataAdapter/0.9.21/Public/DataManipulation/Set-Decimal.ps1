Function Set-Decimal {
    [cmdLetBinding()]
    param(
        [Parameter(ValueFromPipeline=$true)]
        $InputObject,
        $Property
    )
    begin {
        $default = 0.00
    }
    process {
        foreach($item in $InputObject) {
            foreach($prop in $Property) {
                if ($item.$prop) {
                    $val = $default
                    if ([decimal]::TryParse($item.$prop, [ref]$val)) {
                        $item.$prop = $val
                        Write-Verbose "Set-Decimal $prop=$val"
                    }
                }
            }
            $item
        }
    }
}