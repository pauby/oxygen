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
    Test if the specified printer driver exists in the printer driver store.
.DESCRIPTION
    Test if the specified printer driver exists in the printer driver store.
.NOTES
	Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0.0 - 14/07/16 - Initial version
.LINK
    https://www.github.com/pauby/Oxygen
.PARAMETER Name
    Specifies the name of the printer driver to test.
.OUTPUTS
	Output is of type [bool] and is true if the dreiver exists in the driver store and false otherwise.
.EXAMPLE
    Test-PrinterDriverStore -Name "HP LaserJet PS"

    Tests if the printer driver named "HP LaserJet PS" exists int he printer driver store.
#>

function Test-PrinterDriverStore
{
    [OutputType([bool])]
    Param
    (
        [Parameter(Mandatory=$true)]
        [string]
        $Name
    )

    # check if the driver is in the list already
    if (Test-PrinterDriver -Name $Name) {
        return $true
    }
    else {
        # try and install the driver - if it fails then the driver most likely does not exist in the store
        try {
            Add-PrinterDriver -Name $DriverName
        }
        catch {
            # if we get here then the driver will most likely not exist in the store so will need to be added
            return $false
        }

        # if we get here then the printer driver was added successfully - remove it (as we only wanted to test it)
        Remove-PrinterDriver -Name $DriverName
        return $true
    }
 }