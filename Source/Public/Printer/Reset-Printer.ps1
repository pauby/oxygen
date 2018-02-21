function Reset-Printer {
<#
.SYNOPSIS
    Reset the specified printer on the local computer.
.DESCRIPTION
    Reset the specified printer on the local computer by removing the printer,
    driver and port and adding them back.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.OUTPUTS
    [System.Boolean]
.EXAMPLE
    Reset-Printer -Name "HP LaserJet 4" -DriverName "HP LaserJet PS" -PortName "HPLJ4" -PrinterHostAddress "192.168.10.100"

    Resets the printer called "HP LaserJet 4", driver named "HP LaserJet PS", port "HPLJ4" with IP address 192.168.10.100 by removing the port, driver and printer and then adding them back again.
#>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    [OutputType([System.Boolean])]
    Param
    (
        # Specifies the name of the printer to reset on the local computer.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateScript( { Test-Printer -Name $_ } )]
        [string]$Name,

        # Specifies the name of the driver to reset on the local computer.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateScript( { Test-PrinterDriver -Name $_ } )]
        [string]$DriverName,

        # Specifies the name of the port to reset on the local computer.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateScript( { Test-PrinterPort -Name $_ } )]
        [string]$PortName,

        # Specifies the IP address of the printer to reset on the local computer.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateScript( { Test-Connection -ComputerName $_ -Count 1 -Quiet } )]
        [IPAddress]$IPAddress,

        # Force the removal
        [Switch]$Force
    )

    Begin {
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }
    }

    Process {
        if ($Force -or $PSCmdlet.ShouldProcess("ShouldProcess?")) {
            Write-Verbose "Removing printer $Name"
            Remove-Printer -Name $Name
            Write-Verbose "Checking printer $Name has been removed"
            if (Test-Printer -Name $Name) {
                $false
            }
            else {
                # check each of these suceeds.
                if ((-not (Reset-PrinterPort -PortName $PortName -IPAddress $IPAddress -Force:($Force.IsPresent))) -or
                        (-not (Reset-PrinterDriver -DriverName $DriverName -Force:($Force.IsPresent))) -or
                        (-not (Add-Printer -Name $Name -DriverName $DriverName -PortName $PortName -Force:($Force.IsPresent))) ) {
                    $false
                }
                else {
                    $true
                }
            }
        }
    }

    End { }
}