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
    Resets the printer port.
.DESCRIPTION
    Resets the printer port configuration by removing then adding it with the new one.

    You do not need administrator privileges to use Reset-PrinterPort
.NOTES
	Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0 - 01/04/16 - Initial version
.LINK
    https://www.github.com/pauby/Oxygen
.PARAMETER PortName
    Specifies the Name of the port to be reset. You can get this name using Get-PrinterPort.
.PARAMETER PrinterHostAddress
    Specifies the IP address of the printer port to be added.
.OUTPUTS
	Output is of type [bool] and is true if the port was reset and false otherwise
.EXAMPLE
    Reset-PrinterPort -PortName "HPLJ" -PrinterHostAddress "192.168.10.100"

    Removes the printer port called HPLJ and adds it back again with the same name and IP host address of 192.168.10.100
#>
function Reset-PrinterPort
{
    [OutputType([bool])]
    Param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $PortName,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $PrinterHostAddress
    )

    # check we have a port and remove it
    if (Test-PrinterPort -Name $PortName) {
        Remove-PrinterPort -Name $PortName -ErrorAction SilentlyContinue

        # check the port is gone
        if (Test-PrinterPort -Name $PortName) {
            return $false
        }
    }

    # add the port and check it's now been added
    Add-PrinterPort -Name $PortName -PrinterHostAddress $PrinterHostAddress -ErrorAction SilentlyContinue
    if (Test-PrinterPort -Name $PortName) {
        $true
    }
    else {
        $false
    }
}