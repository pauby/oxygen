function Set-WindowsRegion {
    <#
    .SYNOPSIS
        Sets the Regional Settings for Windows.
    .DESCRIPTION
        Sets the Regional Settings for Windows like you would do by going to
        Control Panel -> Regional Settings

        This function is basically a wrapper around rundll32.exe.
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : v1.0 - 20/04/18 - Initial
    .EXAMPLE
        Set-Region -Path c:\temp\region-uk.xml

        Sets the regional settings to that contained in c:\temp\region-uk.xml
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    Param (
        # Path to the regional settings XML file.
        [Parameter(Mandatory, Position = 0)]
        [ValidateScript( { Test-Path $_ } )]
        [string]$Path
    )

    if ($PSCmdlet.ShouldProcess('Regional Settings', "Applying the settings in '$Path'")) {
        $cmd = "intl.cpl,,/f:$Path"
        rundll32.exe shell32,Control_RunDLL "$cmd"
    }
}