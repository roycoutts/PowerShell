#=========================================================================
<#
List-Fonts.ps1

List all TrueType Fonts Installed on your computer.

Font list can be returned via a System.Array or output to HTML

OPTION 1: Return TrueType Font Families via System.Array

    PS:> List-Fonts

    or

    PS:> List-Fonts -Output Raw

OPTION 2: Output TrueType Font Families to HTML

    PS:> List-Fonts -Output HTML

MODIFIED FROM https://technet.microsoft.com/en-us/library/ff730944.aspx
#>
#=========================================================================

function List-Fonts {
    param(
        [Parameter(Mandatory=$false)]
        [AllowEmptyString()]
        [ValidateSet('Raw','HTML')]
        [string]$Output
    )
        # Return FontFamilies as System.Array
    if ($Output.Length -eq 0 -or $Output -eq 'Raw'){
        [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
        Return (New-Object System.Drawing.Text.InstalledFontCollection).Families
    }
        # Output FontFamilies to HTML
    if ($output -eq 'HTML') {
        [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

        $objFonts = New-Object System.Drawing.Text.InstalledFontCollection
        $colFonts = $objFonts.Families

        $objIE = New-Object -com "InternetExplorer.Application"
        $objIE.Navigate("about:blank")
        $objIE.ToolBar = 0
        $objIE.StatusBar = 0
        $objIE.Visible = $True

        $objDoc = $objIE.Document.DocumentElement.LastChild 

        foreach ($objFont in $colFonts) {
            $strHTML = $strHTML + "<font size='5' face='" + $objFont.Name + "'>" + $objFont.Name + "</font><br>"
        }

        $objDoc.InnerHTML = $strHTML
        }
}
