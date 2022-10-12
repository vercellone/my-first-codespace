Function ConvertTo-FixedWidth {
    [cmdLetBinding()]
    param(
        [Parameter(ValueFromPipeline=$true)]
        $InputObject,
        [Parameter(Mandatory=$true)]
        $Fields
    )
    begin {
        if ($Fields -is [string]) {
            $Fields = $Fields | ConvertFrom-Csv
        }

        #$Fields = $Fields | Select-Object *,@{n='Width';e={ [Regex]::Match($_.CustomFormat,'(?<=[,-])\d+').Value }}
        [int]$TotalWidth = ($Fields | Measure-Object -Property Width -Sum).Sum
        $record = New-Object -TypeName System.Text.StringBuilder -ArgumentList $TotalWidth

        $fmtbuilder = New-Object -TypeName System.Text.StringBuilder -ArgumentList $TotalWidth
        $Fields = $Fields | Select-Object Name,Width,Default,Type,@{n='Format';e={
            [void]$fmtbuilder.Append('{0,')
            if ($_.Justify -notlike 'R*') {
                [void]$fmtbuilder.Append('-')
            }
            [void]$fmtbuilder.Append($_.Width)
            if (-not [string]::IsNullOrEmpty($_.Format)) {
                [void]$fmtbuilder.Append(':')
                [void]$fmtbuilder.Append($_.Format)
            }
            [void]$fmtbuilder.Append('}')
            $fmtbuilder.ToString()
            [void]$fmtbuilder.Clear()
        }}
    }
    process {
        foreach($item in $InputObject) {
            foreach($field in $Fields) {
                $value = $item | Select-Object -ExpandProperty $field.name -ErrorAction SilentlyContinue
                if ([String]::IsNullOrEmpty($value)) {
                    $value = $field.Default
                }
                switch ($field.Type) {
                    'int' {
                        if ([String]::IsNullOrWhiteSpace($value)) {
                            #$value = [int]0
                            Write-Warning ("ConvertTo-FixedWidth: [{0}] is blank, expected an integer" -f $field.name,$value)
                        } else {
                            [void][int]::TryParse($value, [ref]$value)
                        }
                    }
                    'datetime' {
                        if ([String]::IsNullOrWhiteSpace($value)) {
                            #$value = [datetime]::Today 
                            Write-Warning ("ConvertTo-FixedWidth: [{0}] is blank; expected a date" -f $field.name,$value)
                        } else {
                            $value = $value -replace ' .$','' # Remove excess trailing junk
                            [void][DateTime]::TryParse($value, [ref]$value)
                        }
                    }
                    'decimal' {
                        if ([String]::IsNullOrWhiteSpace($value)) {
                            #$value = [decimal]::Zero
                            Write-Warning ("ConvertTo-FixedWidth: [{0}] is blank, expected a decimal" -f $field.name,$value)
                        } else {
                            [void][decimal]::TryParse($value, [ref]$value)
                        }
                    }
                    default {
                        if (-not [String]::IsNullOrEmpty($_)) {
                            Write-Error "Invalid column type [$_]"
                        }
                    }
                }
                $value = "$($field.Format)" -f $value
                if ($value.Length -gt $field.Width) {
                    $value = $value.Trim().Substring(0,$field.Width)
                    Write-Warning ("ConvertTo-FixedWidth: [{0}] truncated to {1}/{2} characters" -f $field.name,$field.Width,$value.Length)
                }
                [void]$record.Append($value)
            }
            #[void]$record.AppendLine('')
            $record.ToString()
            [void]$record.Clear()
        }
    }
}