function Disable-WindowsPageFile {
    <#
    .SYNOPSIS
        Disables the Windows pagefile.
    .DESCRIPTION
        Disables the Windows pagefile on the local computer.
    .EXAMPLE
        Disable-WindowsPageFile

        Disables the Windows page file on the local computer.
    .INPUTS
        None
    .OUTPUTS
        [boolean]
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : 1.0 - 20/04/18 - Initial release
    .LINK
        Enable-PageFile
    .LINK
        Remove-PageFile
    .LINK
        https://github.com/pauby/oxygen/blob/master/docs/disable-windowspagefile.md
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    [OutputType([boolean])]
    Param(
        # Force disabling the pagefile regardless of it's current state.
        [switch]
        $Force
    )
    
    $cs = Get-CimInstance -ClassName Win32_ComputerSystem

    if ($Force.IsPresent -or $cs.AutomaticManagedPagefile) {
        if ($PSCmdlet.ShouldProcess('Windows PageFile', 'Disabling')) {
            try {
                $cs.AutomaticManagedPagefile = $false
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