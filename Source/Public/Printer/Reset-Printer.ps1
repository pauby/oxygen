function Reset-Printer
{
<#
.SYNOPSIS
    Reset the specified printer on the local computer.
.DESCRIPTION
    Reset the specified printer on the local computer.
.NOTES
	Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.OUTPUTS
    [System.Boolean]
.EXAMPLE
    Reset-Printer -Name "HP LaserJet 4" -DriverName "HP LaserJet PS" -PortName "HPLJ4" -PrinterHostAddress "192.168.10.100"

    Resets the printer called "HP LaserJet 4", driver named "HP LaserJet PS",  port "HPLJ4" with IP address 192.168.10.100
#>

    [OutputType([System.Boolean])]
    Param
    (
        # Specifies the name of the printer to reset on the local computer.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        # Specifies the name of the driver to reset on the local computer.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$DriverName,

        # Specifies the name of the port to reset on the local computer.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$PortName,

        # Specifies the IP address of the printer to reset on the local computer.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$PrinterHostAddress
    )

    if (Test-Printer -Name $Name ) {
        Remove-Printer -Name $Name

        # check the printer is gone
        if (Test-Printer -Name $Name) {
            return $false
        }
    }

    # check each of these suceeds.
    if ((-not (Reset-PrinterPort -PortName $PortName -PrinterHostAddress $PrinterHostAddress)) -or `
            (-not (Reset-PrinterDriver -DriverName $DriverName)) -or
            (-not (Add-Printer -Name $Name -DriverName $DriverName -PortName $PortName)) ) {
        return $false
    }

    $true
}