function Test-PrinterDriverStore
{
    <#
    .SYNOPSIS
        Test if the specified printer driver exists in the printer driver store.
    .DESCRIPTION
        Test if the specified printer driver exists in the printer driver store.
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://www.github.com/pauby/oxygen)
        History : v1.0 - 20/04/18 - Initial
    .INPUTS
        None
    .OUTPUTS
        [boolean]
    .EXAMPLE
        Test-PrinterDriverStore -Name "HP LaserJet PS"

        Tests if the printer driver named "HP LaserJet PS" exists in the printer driver store.
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
        Test-PrinterPort
    .LINK
        https://github.com/pauby/oxygen/blob/master/docs/test-printerdriverstore.md
    #>
    [CmdletBinding()]
    [OutputType([boolean])]
    Param (
        # Specifies the name of the printer driver to test.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    # check if the driver is in the list already
    if (Test-PrinterDriver -Name $Name) {
        return $true
    }
    else {
        # try and install the driver - if it fails then the driver most likely does not exist in the store
        try {
            Add-PrinterDriver -Name $DriverName
        }
        catch {
            # if we get here then the driver will most likely not exist in the store so will need to be added
            return $false
        }

        # if we get here then the printer driver was added successfully - remove it (as we only wanted to test it)
        Remove-PrinterDriver -Name $DriverName
        return $true
    }
 }