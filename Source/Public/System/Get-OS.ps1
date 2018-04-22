function Get-OS {
    <#
    .SYNOPSIS
        Gets details of the operating system.
    .DESCRIPTION
        Gets details of the operating system. This function is a nice wrapper
        around the Get-CimInstance Win32_OperatingSystem call. It does create a
        hashtable with already determined information for the platform and type.

        The format of the data returned is:

        Name                Value
        ----                -----
        version             10.0.16299 name                Microsoft Windows 10
        Pro architecture        64-bit type                Windows platform
        Workstation buildnumber         16299

        * The 'platform' field can be 'Workstation', 'Domain Controller' or
          'Server'.
        * The 'type' field will be 'Windows' or 'Unknown'.
    .EXAMPLE
        Get-OS

        Returns information about the operating system.
    .INPUTS
        None
    .OUTPUTS
        [hashtable]
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : 1.0 - 20/04/18 - Initial release
    .LINK
        Test-IsNonInteractiveShell
    .LINK
        https://github.com/pauby/oxygen/blob/master/docs/get-os.md
    #>
    [CmdletBinding()]
    [OutputType([hashtable])]
    Param (
        # Get operating system information of this computer. Defaults to local
        # computer.
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]$ComputerName = '.'
    )

    Begin {}

    Process {
        try {
            $osData = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $ComputerName
        }
        catch {
            throw $_
        }

        @{
            name         = $osData.Caption
            architecture = $osData.OSArchitecture
            platform     = switch ($osData.ProductType) { 
                1 { 'Workstation' }
                2 { 'Domain Controller' } 
                3 { 'Server' }
            }
            type         = switch ($osData.OSType) { 
                18 { 'Windows'; break }
                default { 'Unknown' } 
            }
            version      = $osData.Version
            buildnumber  = $osData.BuildNumber
        }
    }

    End {}
}