function Set-Region {
<#
.SYNOPSIS
Sets the Regional Settings for Windows.

.DESCRIPTION
Sets the Regional Settings for Windows like you would do by going to Control Panel -> Regional Settings

.NOTES
    Author : Paul Broadwith (https://github.com/pauby)

.LINK
    https://www.github.com/pauby/oxygen

.EXAMPLE
Set-Region -Path c:\temp\region-uk.xml

Sets the regional settings to that contained in c:\temp\region-uk.xml
#>
    Param (
        # Path to the regional settings XML file.
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateScript( { Test-Path $_ } )]
        [string]$Path
    )

    $cmd = "intl.cpl,,/f:$Path"
    Invoke-Expression "rundll32.exe shell32,Control_RunDLL '$cmd'"
}