function Format-Currency {
    [CmdletBinding()]
    param (
        [parameter (Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [Int]$Value,

        [parameter (Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateSet('Decimal', 'NoDecimal')]
        [String]$Format
    )
    if ($Format -eq 'Decimal') {
        $curr = '{0:C2}' -f $Value
        Return $curr
    }
    if ($Format -eq 'NoDecimal') {
        $curr = '{0:C0}' -f $Value
        Return $curr
    }
}
