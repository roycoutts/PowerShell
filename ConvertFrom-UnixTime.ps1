function ConvertFrom-UnixTime {
    [CmdletBinding()]
    param (
        [parameter (Mandatory,ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [Int]$Seconds,

        [parameter (Mandatory,ValueFromPipelineByPropertyName)]
        [ValidateSet('Long','Short')]
        [String]$Format
    )

     if ($Format -eq 'Long')  {Return [DateTime]$datetime = (Get-Date 01.01.1970)+([System.TimeSpan]::fromseconds($Seconds))}
     if ($Format -eq 'Short') {Return [String]$datetime = ((Get-Date 01.01.1970)+([System.TimeSpan]::fromseconds($Seconds))).ToString()}

    <#
        PS> ConvertFrom-UnixTime -Seconds 1111111111 -Format Long

            Friday, March 18, 2005 1:58:31 AM

        PS> ConvertFrom-UnixTime -Seconds 1111111111 -Format short

            3/18/2005 1:58:31 AM
    #>
 }
