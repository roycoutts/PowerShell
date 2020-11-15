function Get-Input {
    [CmdletBinding()]
    param (
        [parameter (Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [String]$prompt,
        [parameter (Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [String]$title,
        [parameter ()]
        [String]$default
    )
    [void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
    $response = [Microsoft.VisualBasic.Interaction]::InputBox($prompt, $title, $default)
    Return $response
} #Prompt for input
