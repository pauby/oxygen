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
.NOTES
    File Name	: Oxygen.psm1
    Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0 - 13/07/16 - Initial version
#>

#Requires -Version 4
Set-StrictMode -Version Latest

$publicFunctions = @(
    'Get-WindowsSpecialFolderPath',
    'Set-Shortcut',
    'Test-ObjectProperty'
)

$privateFunctions = @(
    "Test-WindowsSpecialFolderName"
)

foreach ($function in $publicFunctions)
{
    Write-Verbose "Importing script file Public\$function.ps1"
    . (Join-Path $PSScriptRoot "Public\$function.ps1")
}

foreach ($function in $privateFunctions)
{
    Write-Verbose "Importing script file Private\$function.ps1"
    . (Join-Path $PSScriptRoot "Private\$function.ps1")
}

Export-ModuleMember -Function $publicFunctions