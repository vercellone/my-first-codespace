Function ConvertFrom-FixedWidth {
    [cmdLetBinding()]
    param(
        [Parameter(ValueFromPipeline=$true)]
        $InputObject,
        [Parameter(Mandatory=$true)]
        $Fields,
        [Parameter(Mandatory=$false)]
        $LastField
    )
    begin {
        if ($Fields -is [string]) {
            $Fields = $Fields | ConvertFrom-Csv
        }
        Function Get-RegexNamedGroups($hash) {
            # sorted
            $newHash = [ordered]@{};
            for ([int]$f = 0; $f -lt $Fields.Count; $f++) {
                $fieldname = $Fields[$f].Name
                if ($hash.ContainsKey($fieldname)) {
                    $newHash.Add($fieldname, $hash[$fieldname])
                }
            }
            # UNsorted
            #$newHash = @{};
            #$hash.keys | Where-Object { $_ -notmatch '^\d+$' } | ForEach-Object { $newHash[$_] = $hash[$_] }
            $newHash
        }

        # Convert fields into a regular expression with a named group for each field
        $regex = $null
        foreach($field in $Fields) {
            if ($field.Name -match 'Record.*Type') {
                $regex += "(?<RecordType>$($field.Default))"
            } else {
                if ($LastField -eq $field.Name) {
                    $regex += "(?<$($field.Name)>.{1,$($field.Width)})"
                    break; # ignore/exclude remaining fields from the regex
                } else {
                    $regex += "(?<$($field.Name)>.{$($field.Width)})"
                }
            }
        }
        if ($regex) {
            #$regex = '^{0}`$' -f $regex
            $regex = '^{0}' -f $regex
        }
    }
    process {
        foreach($row in $InputObject) {
            if ($regex -and $row -match $regex) {
                #$sortedmatches = $matches | Where-Object { $_.Name -and $sortedfields.ContainsKey($_.Name) } | Sort-Object -Property @{expression={ $sortedFields[$_.Name] } }
                #New-Object PSObject -Property (Get-RegexNamedGroups $sortedmatches)
                New-Object PSObject -Property (Get-RegexNamedGroups $matches)
            }
        }
    }
}