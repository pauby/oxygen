function Reset-PrinterDriver
{
<#
.SYNOPSIS
    Reset the specified printer driver.
.DESCRIPTION
    Reset the specified printer driver.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/Oxygen
.OUTPUTS
	[System.Boolean]
.EXAMPLE
    Reset-PrinterDriver -Name "HP LaserJet PS"

    Remove and add the printer driver called "HP LaserJet PS"
#>
    [OutputType([System.Boolean])]
    [CmdletBinding()]
    Param
    (
        # Specifies the printer driver to reset.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
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