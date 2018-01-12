function Test-PrinterPort
{
<#
.SYNOPSIS
    Tests if the specified printer port exists on the computer.
.DESCRIPTION
    Tests if the specified printer port exists on the computer.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.EXAMPLE
    Test-PrinterPort -PortName "TestPrinter"

    Tests whether the port named TestPrinter exisst on the computer.
#>
    [OutputType([bool])]
    Param (
        # Specifies the name of the port to test.
        [Parameter(Mandatory=$true)]
        [string]$Name
    )

    [bool](Get-PrinterPort | Where-Object { $_.Name -eq $Name } )
}