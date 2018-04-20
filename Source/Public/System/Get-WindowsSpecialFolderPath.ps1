function Get-WindowsSpecialFolderPath {
    <#
    .SYNOPSIS
        Gets the path of a Windows special folder.
    .DESCRIPTION
        Gets the path of a Windows special folder such as Network Shortcuts,
        Desktop, etc.

        This is a wrapper around [Environment]::GetFolderPath()
    .OUTPUTS
        [string]
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : v1.0 - 20/04/18 - Initial
    .EXAMPLE
        Get-WindowsSpecialFolderPath -Name "NetworkShortcuts"

        Gets the network shortcuts folder path.
#>
    [CmdletBinding()]
    [OutputType([string])]
    Param (
        # The name of the special folder. This name must match one from the list
        # at https://msdn.microsoft.com/en-us/library/system.environment.specialfolder.aspx
        [Parameter(Mandatory)]
        [ValidateScript( { $_ -in [Environment+SpecialFolder]::GetNames([Environment+SpecialFolder]) } )]
        [string]$Name
    )

    [Environment]::GetFolderPath($Name)
}