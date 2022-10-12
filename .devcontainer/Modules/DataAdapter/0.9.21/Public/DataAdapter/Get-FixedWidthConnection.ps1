Function Get-FixedWidthConnection {
    [cmdLetBinding()]
    param (
        [ValidateSet('Yes','No')]
        $HDR='Yes',
        $Path
    )
    Get-DatabaseConnection "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=$Path;Extended properties='text;HDR=$HDR;FMT=Fixed'"
}