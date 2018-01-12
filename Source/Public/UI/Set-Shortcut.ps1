function Set-Shortcut
{
<#
.SYNOPSIS
    Sets a Windows shortcut.
.DESCRIPTION
    Sets a Windows shortcut.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby
.PARAMETER Path
    Path to the shortcut file. Should end with '.lnk'. The parent path of this must exist.

    For example, if the path is c:\windows\system32\notepad.exe then c:\windows\system32 must exist.
.PARAMETER Target
    The destination of the shortcut. This could be an application or a URL.
.OUTPUTS
	Returns a [bool] with $true if the shortcut was created or $false otherwise.
.EXAMPLE
    Set-Shortcut -Path "c:\user\joe\desktop\notepad.lnk" -Target "c:\windows\system32\notepad.exe"

    Creates a shortcut to c:\windows\system32\notepad.exe on the desktop of the user 'joe'.
#>
    [CmdletBinding()]
    [OutputType([boolean])]
    Param (
        [Parameter(Mandatory=$true)]
        [ValidateScript( {  if ([string]::IsNullOrEmpty($_)) {
                                $false
                            }
                            else {
                                Test-Path -Path (Split-Path $_ -Parent)
                            }
                        })]
        [string]
        $Path,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Target
    )

    $ShortcutFile = $Path
    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
    $Shortcut.TargetPath = $Target

    try {
        $Shortcut.Save()
    }
    catch {
        $false
    }

    $true
}