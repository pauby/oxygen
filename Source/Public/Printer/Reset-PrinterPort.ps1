function Reset-PrinterPort
{
<#
.SYNOPSIS
    Resets the printer port.
.DESCRIPTION
    Resets the printer port configuration by removing then adding it with the new one.

    You do not need administrator privileges to use Reset-PrinterPort
.NOTES
	Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.OUTPUTS
	[System.Boolean]
.EXAMPLE]
    Reset-PrinterPort -PortName "HPLJ" -PrinterHostAddress "192.168.10.100"

    Removes the printer port called HPLJ and adds it back again with the same name and IP host address of 192.168.10.100
#>
    [OutputType([System.Boolean])]
    Param
    (
        # Specifies the Name of the port to be reset. You can get this name using Get-PrinterPort.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$PortName,

        # Specifies the IP address of the printer port to be added.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$PrinterHostAddress
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