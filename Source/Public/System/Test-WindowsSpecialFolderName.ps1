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
    Tests if a name is a Windows Special Folder Name.
.DESCRIPTION
    Tests if a name is a Windows Special Folder Name.
.NOTES
	Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0 - 13/07/16 - Initial version
.LINK
    https://www.github.com/pauby/oxygen
.PARAMETER Name
    The name to test as found at https://msdn.microsoft.com/en-us/library/system.environment.specialfolder.aspx
.OUTPUTS
	Output is a [bool] and is $true if the name is a Windows Special Folder Name or $false otherwise.
.EXAMPLE
    Test-WindowsSpecialFolderName -Name "Desktop"

    Tests whether "Desktop" is a valid Windows Special Folder Name and returns $true if it is or $false otherwise.
#>

function Test-WindowsSpecialFolderName
{
    [CmdletBinding()]
    [OutputType([boolean])]
    Param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
    )

    Begin {}

    Process {
        ($Name -in [Environment+SpecialFolder]::GetNames([Environment+SpecialFolder]))
    }

    End {}
}