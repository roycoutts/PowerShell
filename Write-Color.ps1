function Write-Color([String[]]$Text, [ConsoleColor[]]$Color = "White", [int]$StartTab = 0, [int] $LinesBefore = 0,[int] $LinesAfter = 0, [string] $LogFile = "", $TimeFormat = "yyyy-MM-dd HH:mm:ss") {
    # version 0.2
    # - added logging to file
    # version 0.1
    # - first draft
    # 
    # Notes:
    # - TimeFormat https://msdn.microsoft.com/en-us/library/8kb3ddd4.aspx

    $DefaultColor = $Color[0]
    if ($LinesBefore -ne 0) {  for ($i = 0; $i -lt $LinesBefore; $i++) { Write-Host "`n" -NoNewline } } # Add empty line before
    if ($StartTab -ne 0) {  for ($i = 0; $i -lt $StartTab; $i++) { Write-Host "`t" -NoNewLine } }  # Add TABS before text
    if ($Color.Count -ge $Text.Count) {
        for ($i = 0; $i -lt $Text.Length; $i++) { Write-Host $Text[$i] -ForegroundColor $Color[$i] -NoNewLine } 
    } else {
        for ($i = 0; $i -lt $Color.Length ; $i++) { Write-Host $Text[$i] -ForegroundColor $Color[$i] -NoNewLine }
        for ($i = $Color.Length; $i -lt $Text.Length; $i++) { Write-Host $Text[$i] -ForegroundColor $DefaultColor -NoNewLine }
    }
    Write-Host
    if ($LinesAfter -ne 0) {  for ($i = 0; $i -lt $LinesAfter; $i++) { Write-Host "`n" } }  # Add empty line after
    if ($LogFile -ne "") {
        $TextToFile = ""
        for ($i = 0; $i -lt $Text.Length; $i++) {
            $TextToFile += $Text[$i]
        }
        Write-Output "[$([datetime]::Now.ToString($TimeFormat))]$TextToFile" | Out-File $LogFile -Encoding unicode -Append
    }
}

<#
https://stackoverflow.com/questions/2688547/multiple-foreground-colors-in-powershell-in-one-command
Write-Color -Text "Red ", "Green ", "Yellow " -Color Red,Green,Yellow

Write-Color -Text "This is text in Green ",
                   "followed by red ",
                   "and then we have Magenta... ",
                   "isn't it fun? ",
                   "Here goes DarkCyan" -Color Green,Red,Magenta,White,DarkCyan

Write-Color -Text "This is text in Green ",
                   "followed by red ",
                   "and then we have Magenta... ",
                   "isn't it fun? ",
                   "Here goes DarkCyan" -Color Green,Red,Magenta,White,DarkCyan -StartTab 3 -LinesBefore 1 -LinesAfter 1

Write-Color "1. ", "Option 1" -Color Yellow, Green
Write-Color "2. ", "Option 2" -Color Yellow, Green
Write-Color "3. ", "Option 3" -Color Yellow, Green
Write-Color "4. ", "Option 4" -Color Yellow, Green
Write-Color "9. ", "Press 9 to exit" -Color Yellow, Gray -LinesBefore 1



Write-Color -LinesBefore 2 -Text "This little ","message is ", "written to log ", "file as well." -Color Yellow, White, Green, Red, Red -LogFile "C:\testing.txt" -TimeFormat "yyyy-MM-dd HH:mm:ss"
Write-Color -Text "This can get ","handy if ", "want to display things, and log actions to file ", "at the same time." -Color Yellow, White, Green, Red, Red -LogFile "C:\testing.txt"

#>
