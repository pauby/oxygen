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
    Short description.
.DESCRIPTION
    Long description.
.NOTES
	Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0.0 - 14/07/16 - Initial version
.LINK
    https://www.github.com/pauby
.PARAMETER PARAMETER
    Parameter description
.INPUTS
	Parameter and type [psobject]
.OUTPUTS
	Output and type [psobject]
.EXAMPLE
    $todoObj = $todoObj | Set-Todo -Priority "B"

    Sets the priority of the $todoObj to "B" and outputs the modified todo.
#>

function Test-PrinterDriver
{
    [OutputType([bool])]
    Param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
    )

    [bool](Get-PrinterDriver | Where { $_.Name -eq $Name } )
}