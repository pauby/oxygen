function Test-PrinterPort
{
<#
.SYNOPSIS
    Tests if the specified printer port exists on the computer.
.DESCRIPTION
    Tests if the specified printer port exists on the computer.
.NOTES
    Author  : Paul Broadwith (https://github.com/pauby)
    Project : Oxygen (https://www.github.com/pauby/oxygen)
    History : v1.0 - 20/04/18 - Initial
.OUTPUTS
    [boolean]
.EXAMPLE
    Test-PrinterPort -PortName "TestPrinter"

    Tests whether the port named TestPrinter exisst on the computer.
.LINK
    Reset-Printer
.LINK
    Reset-PrinterDriver
.LINK
    Reset-PrinterPort
.LINK
    Test-Printer
.LINK
    Test-PrinterDriver
.LINK
    Test-PrinterDriverStore
#>
    [CmdletBinding()]
    [OutputType([boolean])]
    Param (
        # Specifies the name of the port to test.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    [bool](Get-PrinterPort | Where-Object { $_.Name -eq $Name } )
}