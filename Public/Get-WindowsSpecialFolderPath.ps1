<#
# This file is part of the Oxygen distribution (https://github.com/pauby/Oxygen).
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
    Gets the path of a Windows special folder.
.DESCRIPTION
    Gets the path of a Windows special folder such as Network Shortcuts, Desktop, etc.
.NOTES
	Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0 - 13/07/16 - Initial version
.LINK
    https://www.github.com/pauby/oxygen
.PARAMETER Name
    The name of the special folder. This name must match one from the list at https://msdn.microsoft.com/en-us/library/system.environment.specialfolder.aspx
.OUTPUTS
    Returns a string of Windows Special Folder path.
.EXAMPLE
    Get-WindowsSpecialFolderPath -Name "NetworkShortcuts"

    Gets the network shortcuts folder path.
#>

function Get-WindowsSpecialFolderPath
{
    [CmdletBinding()]
    [OutputType([string])]
    Param (
        [Parameter(Mandatory=$true)]
        [ValidateScript( { if ([string]::IsNullOrEmpty($_)) {
                                $false
                            }
                            else {
                                $_ | Test-WindowsSpecialFolderName
                            }
                        } )]
        [string]
        $Name
    )

    [Environment]::GetFolderPath($Name)
}