function Reset-PrinterDriver
{
<#
.SYNOPSIS
    Reset the specified printer driver.
.DESCRIPTION
    Reset the specified printer driver by removing it and adding it back again.
.NOTES
    Author  : Paul Broadwith (https://github.com/pauby)
    Project : Oxygen (https://github.com/pauby/oxygen)
    History : v1.0 - 20 April 2018
.OUTPUTS
    [boolean]
.EXAMPLE
    Reset-PrinterDriver -Name "HP LaserJet PS"

    Remove and add the printer driver called "HP LaserJet PS"
.LINK
    Reset-Printer
.LINK
    Reset-PrinterPort
.LINK
    Test-Printer
.LINK
    Test-PrinterDriver
.LINK
    Test-PrinterDriverStore
.LINK
    Test-PrinterPort
#>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    [OutputType([boolean])]
    Param
    (
        # Specifies the printer driver to reset.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    if (Test-PrinterDriver -Name $Name)
    {
        if (PSCmdlet.ShouldProcess($Name, 'Removing printer driver')) {
            Remove-PrinterDriver -Name $Name -ErrorAction SilentlyContinue
        }

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