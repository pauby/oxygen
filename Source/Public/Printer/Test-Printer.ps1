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
    Tests if the specified printer exists on the local computer.
.DESCRIPTION
    Tests if the specified printer exists on the local computer.
.NOTES
	Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0.0 - 14/07/16 - Initial version
.LINK
    https://www.github.com/pauby/Oxygen
.PARAMETER Name
    Specified printer name to test.
.OUTPUTS
	Output is of type [bool] and is true if the printer name exists and false otherwise.
.EXAMPLE
    Test-Printer -Name "HP LaserJet 4"

    Tests if the printer named "HP LaserJet 4" exists on the local computer.
#>

function Test-Printer
{
    [OutputType([bool])]
    Param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
    )

    ([bool](Get-Printer | Where { $_.Name -eq $Name } ))
}