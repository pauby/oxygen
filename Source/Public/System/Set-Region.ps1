function Set-Region {
<#
.SYNOPSIS
Sets the Regional Settings for Windows.

.DESCRIPTION
Sets the Regional Settings for Windows like you would do by going to Control Panel -> Regional Settings

.PARAMETER Path
Path to the regional asettings XML file.

.EXAMPLE
Set-Region -Path c:\temp\region-uk.xml

Sets the regional settings to that contained in c:\temp\region-uk.xml

.NOTES
General notes
#>
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateScript({ Test-Path $_ })]
        [string]$Path
    )

    $cmd = "intl.cpl,,/f:$Path"
    Invoke-Expression "rundll32.exe shell32,Control_RunDLL '$cmd'"
}