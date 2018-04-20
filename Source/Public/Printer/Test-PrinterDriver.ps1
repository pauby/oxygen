function Test-PrinterDriver
{
<#
.SYNOPSIS
    Tests if the printer driver is present on the system.
.DESCRIPTION
    Tests if the printer driver is present on the system.
.NOTES
    Author  : Paul Broadwith (https://github.com/pauby)
    Project : Oxygen (https://www.github.com/pauby/oxygen)
    History : v1.0 - 20/04/18 - Initial
.OUTPUTS
    [boolean]
.EXAMPLE
    Test-PrinterDriver "HP LaserJet 4"

    This would test if the printer driver 'HP LaserJet 4' was installed.
.LINK
    Reset-Printer
.LINK
    Reset-PrinterDriver
.LINK
    Reset-PrinterPort
.LINK
    Test-Printer
.LINK
    Test-PrinterDriverStore
.LINK
    Test-PrinterPort
#>
    [CmdletBinding()]
    [OutputType([boolean])]
    Param (
        # Printer driver name
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    [bool](Get-PrinterDriver | Where-Object { $_.Name -eq $Name } )
}