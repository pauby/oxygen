function Set-Shortcut {
    <#
    .SYNOPSIS
        Sets a Windows shortcut.
    .DESCRIPTION
        Sets a Windows shortcut. Do not sue this to create a network shortcut as
        it will not give you the results you need. Use Set-NetworkShoertcut
        instead.
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://www.github.com/pauby/oxygen)
        History : v1.0 - 20/04/18 - Initial
    .OUTPUTS
        [boolean]
    .EXAMPLE
        Set-Shortcut -Path 'c:\user\joe\desktop\notepad.lnk' -Target 'c:\windows\system32\notepad.exe'

        Creates a shortcut to c:\windows\system32\notepad.exe on the desktop of the user 'joe'.
    .LINK
        Set-NetworkShortcut
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    [OutputType([boolean])]
    Param (
        # Path to the shortcut file. Should end with '.lnk'. The parent path of this must exist.
        # For example, if the path is c:\windows\system32\notepad.exe then c:\windows\system32 must exist.
        [Parameter(Mandatory)]
        [ValidateScript( { Test-Path -Path (Split-Path -Path $_ -Parent) } )]
        [string]
        $Path,

        # The destination of the shortcut. This could be an application or a URL.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $DestinationUri,

        # Remove the destination shortcut if it exists
        [switch]
        $Force
    )

    # delete the shortcut if it already exists
    if ($Force.IsPresent -and (Test-Path -Path $Path)) {
        if ($PSCmdlet.ShouldProcess($Path, 'Removing shortcut')) {
            Write-Verbose "Deleting shortcut '$Path' as '-Force' parameter provided."
            Remove-Item -Path $Path -Force
        }
    }

    # Create the shortcut
    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WScriptShell.CreateShortcut($Path)
    $Shortcut.TargetPath = $DestinationUri

    try {
        $Shortcut.Save()
    }
    catch {
        $false
    }

    $true
}