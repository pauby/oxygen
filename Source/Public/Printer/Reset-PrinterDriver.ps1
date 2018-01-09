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
    Reset the specified printer driver.
.DESCRIPTION
    Reset the specified printer driver.
.NOTES
	Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0.0 - 14/07/16 - Initial version
.LINK
    https://www.github.com/pauby/Oxygen
.PARAMETER Name
    Specifies the printer driver to reset.
.OUTPUTS
	Output is of type [bool] and is true if the driver was reset and false otherwise.
.EXAMPLE
    Reset-PrinterDriver -Name "HP LaserJet PS"

    Remove and add the printer driver called "HP LaserJet PS"
#>

function Reset-PrinterDriver
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name
    )

    if (Test-PrinterDriver -Name $Name)
    {
        # remove the driver
        Remove-PrinterDriver -Name $Name -ErrorAction SilentlyContinue

        # check it's gone
        if (Test-PrinterDriver -Name $Name) {
            return $false
        }
    }

    # add the printer driver
    Add-PrinterDriver -Name $Name -ErrorAction SilentlyContinue

    # check it's been added
    if (Test-PrinterDriver -Name $Name) {
        return $true
    }
    else {
        return $false
    }

}