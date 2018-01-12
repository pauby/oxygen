function Test-Printer
{
<#
.SYNOPSIS
    Tests if the specified printer exists on the local computer.
.DESCRIPTION
    Tests if the specified printer exists on the local computer.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.OUTPUTS
	Output is of type [bool] and is true if the printer name exists and false otherwise.
.EXAMPLE
    Test-Printer -Name "HP LaserJet 4"

    Tests if the printer named "HP LaserJet 4" exists on the local computer.
#>
    [OutputType([System.Boolean])]
    Param (
        # Specified printer name to test.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    ([bool](Get-Printer | Where-Object { $_.Name -eq $Name } ))
}