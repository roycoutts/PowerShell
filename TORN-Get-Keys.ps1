function Get-Keys {
    # Check for Key Files / Create Files if Missing
    if ((Test-Path -Path $FilePathUserID) -eq $false) { New-Item -Path $FilePathUserID -ItemType File -Force }
    if ((Test-Path -Path $FilePathApiKey) -eq $false) { New-Item -Path $FilePathApiKey -ItemType File -Force }
    # Load Keys
    $Global:UserID = Get-Content -Path $FilePathUserID
    $Global:ApiKey = Get-Content -Path $FilePathApiKey
    # Confirm Keys or Enter New Ones
    if ($Global:UserID -eq '') { $Global:UserID = Get-Input -prompt 'Enter Torn Player ID:' -title 'TORN - PLAYER ID' -default $Global:UserID }
    if ($Global:ApiKey -eq '') { $Global:ApiKey = Get-Input -prompt 'Enter Torn API Key:' -title 'TORN - API KEY' -default $Global:ApiKey }
    # Write Keys to File
    if ($Global:UserID -ne '') {Set-Content -Path $FilePathUserID -Value $Global:UserID -Force}
    if ($Global:ApiKey -ne '') {Set-Content -Path $FilePathApiKey -Value $Global:ApiKey -Force}  
} #Retrieve, Edit, Save Keys
