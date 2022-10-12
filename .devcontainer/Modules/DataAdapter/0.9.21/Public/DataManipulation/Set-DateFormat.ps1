Function Set-DateFormat {
    [cmdLetBinding()]
    param(
        [Parameter(ValueFromPipeline=$true)]
        $InputObject,
        $Property,
        $Format="yyyy-MM-ddTHH:mm:ss",
        $FromFormat="MM/dd/yyyyTHH:mm:ss"
    )
    begin {
        $defaultDate = [DateTime]::MinValue
        $Format = "{{0:{0}}}" -f $Format
    }
    process {
        foreach($item in $InputObject) {
            foreach($prop in $Property) {
                if ($item.$prop) {
                    $val = $defaultDate
                    if ([DateTime]::TryParse($item.$prop, [ref]$val) -or [DateTime]::TryParseExact($item.$prop, $FromFormat, [CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::None, [ref]$val)) {
                        $formatted = $Format -f $val
                        $item.$prop = $formatted
                        Write-Verbose "Set-DateFormat $prop=$formatted"
                    }
                }
            }
            $item
        }
    }
}