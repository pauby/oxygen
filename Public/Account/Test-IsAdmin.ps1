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

function Test-IsAdmin
{

<#
.SYNOPSIS
    Test for elevated privileges.
.DESCRIPTION
    Test if the current session has elevated privileges.

    Returns true if the current session has elevated privileges and false otherwise.
.NOTES
	Author		: Andy Arismendi (http://stackoverflow.com/users/251123/andy-arismendi)
	History		: 1.0 - 25/03/16 - Initial version
.LINK
    http://stackoverflow.com/questions/9999963/powershell-test-admin-rights-within-powershell-script
.INPUTS
    None.
.OUTPUTS
	[bool]
.EXAMPLE
    Test-IsAdmin

    Tests to see if the current session has elevated privleges.
#>

    try
    {
        $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
        $principal = New-Object Security.Principal.WindowsPrincipal -ArgumentList $identity
        return $principal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator )
    }
    catch
    {
        throw "Failed to determine if the current user has elevated privileges. The error was: '{0}'." -f $_
    }
}