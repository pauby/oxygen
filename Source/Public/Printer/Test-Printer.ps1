function Test-Printer
{
<#
.SYNOPSIS
    Tests if the specified printer exists on the local computer.
.DESCRIPTION
    Tests if the specified printer exists on the local computer.
.NOTES
    Author  : Paul Broadwith (https://github.com/pauby)
    Project : Oxygen (https://www.github.com/pauby/oxygen)
    History : v1.0 - 20/04/18 - Initial
.OUTPUTS
    [boolean]
.EXAMPLE
    Test-Printer -Name "HP LaserJet 4"

    Tests if the printer named "HP LaserJet 4" exists on the local computer.
.LINK
    Reset-Printer
.LINK
    Reset-PrinterDriver
.LINK
    Reset-PrinterPort
.LINK
    Test-PrinterDriver
.LINK
    Test-PrinterDriverStore
.LINK
    Test-PrinterPort
#>
    [CmdletBinding()]
    [OutputType([boolean])]
    Param (
        # Specified printer name to test.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    ([bool](Get-Printer | Where-Object { $_.Name -eq $Name } ))
}