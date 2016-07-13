<#
# This file is part of the Oxygen distribution (https://github.com/pauby/oxygen).
# Copyright (c) 2016 Paul Broadwith
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#>

<#
.SYNOPSIS
    Short description.
.DESCRIPTION
    Long description.
.NOTES
	Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0 - 13/07/16 - Initial version
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

function Set-Shortcut
{
    [CmdletBinding()]
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