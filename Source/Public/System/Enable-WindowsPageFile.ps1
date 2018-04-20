function Enable-WindowsPageFile {
    <#
    .SYNOPSIS
        Enables the Windows pagefile.
    .DESCRIPTION
        Enables the Windows pagefile on the local computer.
    .EXAMPLE
        Enable-WindowsPageFile

        Enables the Windows page file on the local computer.
    .OUTPUTS
        [boolean]
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : 1.0 - 20/04/18 - Initial release
    .LINK
        Disable-PageFile
    .LINK
        Remove-PageFile
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    [OutputType([boolean])]
    Param (
        # Force enbling the pagefile regardless of it's current state.
        [switch]
        $Force
    )

    $cs = Get-CimInstance -ClassName Win32_ComputerSystem

    if ($Force.IsPresent -or !$cs.AutomaticManagedPagefile) {
        if ($PSCmdlet.ShouldProcess('Windows PageFile', 'Enabling')) {
            try {
                $cs.AutomaticManagedPagefile = $true
                $PutOptions = New-Object System.Management.PutOptions
                $PutOptions.Type = 2
                $cs.PsBase.Put()

                return $true
            }
            catch {
                return $false
            }
        }
    }
    $false
}