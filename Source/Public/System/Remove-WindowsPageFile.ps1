function Remove-WindowsPageFile {
    <#
    .SYNOPSIS
        Removes the Windows PageFile.
    .DESCRIPTION
        Removes the Windows PageFile.
    .EXAMPLE
        Remove-PageFile

        Removes the Windows Pagefile on the current computer.
    .OUTPUTS
        [boolean]
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : 1.0 - 20/04/18 - Initial release
    .LINK
        Disable-PageFile
    .LINK
        Enable-PageFile
    #>

    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    [OutputType([boolean])]
    Param ()

    $pg = Get-CimInstance -ClassName Win32_PageFileUsage
    if ($pg) {
        if ($PSCmdlet.ShouldProcess('Windows Pagefile', 'Removing')) {
            try {
                Remove-Item $pg.Name -Force -ErrorAction Stop
                return $true
            }
            catch {
                return $false
            }
        }
    }
    $false
}