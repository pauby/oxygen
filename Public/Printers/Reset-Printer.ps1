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
    Reset the specified printer on the local computer.
.DESCRIPTION
    Reset the specified printer on the local computer.
.NOTES
	Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0.0 - 14/07/16 - Initial version
.LINK
    https://www.github.com/pauby/Oxygen
.PARAMETER Name
    Specifies the name of the printer to reset on the local computer.
.PARAMETER DriverName
    Specifies the name of the driver to reset on the local computer.
.PARAMETER PortName
    Specifies the name of the port to reset on the local computer.
.PARAMETER PrinterHostAddress
    Specifies the IP address of the printer to reset on the local computer.
.OUTPUTS
	Output is of type [bool] and is true if the specified printer is reset successfully or false otherwise.
.EXAMPLE
    Reset-Printer -Name "HP LaserJet 4" -DriverName "HP LaserJet PS" -PortName "HPLJ4" -PrinterHostAddress "192.168.10.100"

    Resets the printer called "HP LaserJet 4", driver named "HP LaserJet PS",  port "HPLJ4" with IP address 192.168.10.100
#>

function Reset-Printer
{
    [OutputType([bool])]
    Param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Name,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $DriverName,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $PortName,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $PrinterHostAddress
    )

    if (Test-Printer -Name $Name ) {
        Remove-Printer -Name $Name

        # check the printer is gone
        if (Test-Printer -Name $Name) {
            return $false
        }
    }

    # check each of these suceeds.
    if (-not (Reset-PrinterPort -PortName $PortName -PrinterHostAddress $PrinterHostAddress)) {
        return $false
    }

    if (-not (Reset-PrinterDriver -DriverName $DriverName)) {
        return $false
    }

    if (-not (Add-Printer -Name $Name -DriverName $DriverName -PortName $PortName)) {
        return $false
    }

    $true
}