# Taken from https://social.technet.microsoft.com/Forums/scriptcenter/en-US/fd34260e-ee4c-47c5-8c69-872a5239745f/add-a-network-location-via-script?forum=ITCG
function Set-NetworkShortcut {
    <#
    .SYNOPSIS
        Creates or replaces a network shortcut.
    .DESCRIPTION
        Creates or replaces a network shortcut.
    .EXAMPLE
        Set-NetworkShortcut -Name 'MyShare' -DestinationUri '\\myserver\share'

        Creates a network shortcut called 'MyShare' pointing to '\\myserver\share'.
    .EXAMPLE
        Set-NetworkShortcut -Name 'MyShare' -DestinationUri '\\myserver\share' -Icon 304

        Creates a network shortcut called 'MyShare' pointing to '\\myserver\share' with icon number 304.
    .INPUTS
        None
    .OUTPUTS
        [PSObject]
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : 1.0 - 20/04/18 - Initial release
    .LINK
        Set-Shortcut
    .LINK
        https://github.com/pauby/oxygen/blob/master/docs/set-networkshortcut.md
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    Param (
        # Display name of the short to be created.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,

        # The destination URI for the shortcut.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [string]
        $DestinationUri,

        # Username to set the shortcut for.
        [ValidateNotNullOrEmpty()]
        [ValidateScript( { Test-Path (Join-Path -Path (Split-Path -Path $env:PUBLIC -Parent) -ChildPath $_) })]
        [string]
        $Username = $env:USERNAME,

        # Number of the icon to use. By default this is 275.
        # Find more icons http://help4windows.com/windows_7_shell32_dll.shtml
        [ValidateNotNullOrEmpty()]
        [ValidateRange(0, 305)]
        [int32]
        $Icon = 275,

        [switch]
        $Force
    )

    $shortcutPath = Join-Path -Path (Split-Path -Path $env:PUBLIC -Parent) -ChildPath "$Username\appdata\Roaming\Microsoft\Windows\Network Shortcuts"

    # check if the .lnk file exists for the shortcut
    $shortcutFullPath = Join-Path -Path $shortcutPath -ChildPath $Name
    if ($Force.IsPresent -and (Test-Path -Path $shortcutFullPath)) {
        if ($PSCmdlet.ShouldProcess($shortcutFullPath, 'Removing network shortcut')) {
            Write-Verbose "Deleting network shortcut '$shortcutFullPath' as '-Force' parameter provided."
            Remove-Item -Path $shortcutFullPath -Force -Recurse
        }
    }

    # create the folder
    Write-Verbose "Creating the shortcut folder '$shortcutFullPath'."
    New-Item -Name $Name -Path $shortcutFullPath -Type Directory | Out-Null

    # Create the ini file
    $iniPath = Join-Path -Path $shortcutFullPath -ChildPath 'Desktop.ini'
    Write-Verbose "Creating the INI file '$iniPath'."
    @"
[.ShellClassInfo]
CLSID2={0AFACED1-E828-11D1-9187-B532F1E9575D}
Flags=2
ConfirmFileOp=1
"@ | Out-File -FilePath $iniPath 

    # Create the shortcut file
    $lnkPath = Join-Path -Path $shortcutFullPath -ChildPath 'target.lnk'
    Write-Verbose "Creating shortcut .lnk '$lnkPath'."
    $shortcut = (New-Object -ComObject WScript.Shell).Createshortcut($lnkPath)
    $shortcut.TargetPath = $DestinationUri
    $shortcut.IconLocation = "%SystemRoot%\system32\SHELL32.DLL, $Icon"
    $shortcut.Description = $DestinationUri
    $shortcut.WorkingDirectory = $DestinationUri
    $shortcut.Save()

    Set-ItemProperty (Join-Path -Path $shortcutFullPath -ChildPath 'Desktop.ini') `
        -Name Attributes -Value ([IO.FileAttributes]::System -bxor [IO.FileAttributes]::Hidden)
    Set-ItemProperty $shortcutFullPath -Name Attributes -Value ([IO.FileAttributes]::ReadOnly)
}