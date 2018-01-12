function Test-PrinterDriver
{
<#
.SYNOPSIS
    Tests if the printer driver is present on the system.
.DESCRIPTION
    Tests if the printer driver is present on the system.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.EXAMPLE
    Test-PrinterDriver "HP LaserJet 4"

    This would test if the printer driver 'HP LaserJet 4' was installed.
#>

    [OutputType([System.Boolean])]
    Param (
        # Printer driver name
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    [bool](Get-PrinterDriver | Where-Object { $_.Name -eq $Name } )
}