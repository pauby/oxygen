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
    Tests if the specified printer port exists on the computer.
.DESCRIPTION
    Tests if the specified printer port exists on the computer.
.NOTES
	Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0.0 - 14/07/16 - Initial version
.LINK
    https://www.github.com/pauby/Oxygen
.PARAMETER Name
    Specifies the name of the port to test.
.OUTPUTS
	Output is a [bool] and is true if the printer port exists and false otherwise.
.EXAMPLE
    Test-PrinterPort -PortName "TestPrinter"

    Tests whether the port named TestPrinter exisst on the computer.
#>
function Test-PrinterPort
{
    [OutputType([bool])]
    Param (
        [Parameter(Mandatory=$true)]
        [string]
        $Name
    )

    [bool](Get-PrinterPort | Where { $_.Name -eq $Name } )
}