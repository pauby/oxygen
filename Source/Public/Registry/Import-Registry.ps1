function Import-Registry {
    <#
    .SYNOPSIS
        This is just a wrapper around 'regedit /s'
    .DESCRIPTION
        This is just a wrapper around 'regedit /s'
    .EXAMPLE
        Import-Registry -Path 'mychanges.reg'

        Will import the file 'mychanges.reg' into the registry.
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : 1.0 - 20/04/18 - Initial release
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    Param (
        [Parameter(Mandatory, Position = 0)]
        [ValidateScript({ Test-Path $_ })]
        [string]$Path
    )

    if ($PSCmdlet.ShouldProcess($Path, 'Import file to the registry')) {
        regedit /s $Path
    }
}