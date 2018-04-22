function Reset-PrinterPort
{
    <#
    .SYNOPSIS
        Resets the printer port.
    .DESCRIPTION
        Resets the printer port configuration by removing then adding it with the new one.

        You do not need administrator privileges to use Reset-PrinterPort
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen https://www.github.com/pauby/oxygen
        History : v1.0 - 20/04/18 - Initial
    .INPUTS
        None
    .OUTPUTS
        [boolean]
    .EXAMPLE]
        Reset-PrinterPort -PortName "HPLJ" -PrinterHostAddress "192.168.10.100"

        Removes the printer port called HPLJ and adds it back again with the same name and IP host address of 192.168.10.100
    .LINK
        Reset-Printer
    .LINK
        Reset-PrinterDriver
    .LINK
        Test-Printer
    .LINK
        Test-PrinterDriver
    .LINK
        Test-PrinterDriverStore
    .LINK
        Test-PrinterPort
    .LINK
        https://github.com/pauby/oxygen/blob/master/docs/reset-printerport.md
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    [OutputType([boolean])]
    Param (
        # Specifies the Name of the port to be reset. You can get this name using Get-PrinterPort.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$PortName,

        # Specifies the IP address of the printer port to be added.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$PrinterHostAddress
    )

    # check we have a port and remove it
    if (Test-PrinterPort -Name $PortName) {
        if (PSCmdlet.ShouldProcess($Name, 'Removing printer port')) {
            Remove-PrinterPort -Name $PortName -ErrorAction SilentlyContinue
        }

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