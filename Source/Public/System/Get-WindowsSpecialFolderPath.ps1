function Get-WindowsSpecialFolderPath
{
<#
.SYNOPSIS
    Gets the path of a Windows special folder.
.DESCRIPTION
    Gets the path of a Windows special folder such as Network Shortcuts, Desktop, etc.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.EXAMPLE
    Get-WindowsSpecialFolderPath -Name "NetworkShortcuts"

    Gets the network shortcuts folder path.
#>
    [CmdletBinding()]
    [OutputType([System.String])]
    Param (
        #     The name of the special folder. This name must match one from the list at https://msdn.microsoft.com/en-us/library/system.environment.specialfolder.aspx

        [Parameter(Mandatory=$true)]
        [ValidateScript( { if ([string]::IsNullOrEmpty($_)) {
                                $false
                            }
                            else {
                                $_ | Test-WindowsSpecialFolderName
                            }
                        } )]
        [string]$Name
    )

    [Environment]::GetFolderPath($Name)
}