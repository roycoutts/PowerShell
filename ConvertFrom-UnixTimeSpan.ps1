function ConvertFrom-UnixTimeSpan {
    [CmdletBinding()]
    param (
        [parameter (Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [Int]$Seconds,

        [parameter (Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateSet('Long', 'Short')]
        [String]$Format
    )
     
    if ($Format -eq 'Long') {
        [String]$timespan = ''
        $d = [timespan]::FromSeconds($Seconds).Days
        $h = [timespan]::FromSeconds($Seconds).Hours
        $m = [timespan]::FromSeconds($Seconds).Minutes
        $s = [timespan]::FromSeconds($Seconds).Seconds
        if ($d -lt 2) { $timespan = $timespan + $d + ' Day ' } else { $timespan = $timespan + $d + ' Days ' }
        if ($h -lt 2) { $timespan = $timespan + $h + ' Hour ' } else { $timespan = $timespan + $h + ' Hours ' }
        if ($m -lt 2) { $timespan = $timespan + $m + ' Minute ' } else { $timespan = $timespan + $m + ' Minutes ' }
        if ($s -lt 2) { $timespan = $timespan + $s + ' Second ' } else { $timespan = $timespan + $s + ' Seconds ' }
        Return [String]$timespan
    }
    if ($Format -eq 'Short') {
        [String]$timespan = [timespan]::FromSeconds($Seconds).ToString()
        Return [String]$timespan
    } 

    <#
        PS> TimeSpanFrom-UnixTime -Seconds 111111 -Format Long
            
            1 Day 6 Hours 51 Minutes 51 Seconds 

        PS> TimeSpanFrom-UnixTime -Seconds 111111 -Format Short
            
            1.06:51:51
    #>
}       # Convert Unix Seconds to Elapsed Time
