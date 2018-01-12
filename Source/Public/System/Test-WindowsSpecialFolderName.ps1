function Test-WindowsSpecialFolderName
{
<#
.SYNOPSIS
    Tests if a name is a Windows Special Folder Name.
.DESCRIPTION
    Tests if a name is a Windows Special Folder Name.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.EXAMPLE
    Test-WindowsSpecialFolderName -Name "Desktop"

    Tests whether "Desktop" is a valid Windows Special Folder Name and returns $true if it is or $false otherwise.
#>
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    Param (
        # The name to test as found at https://msdn.microsoft.com/en-us/library/system.environment.specialfolder.aspx
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    Begin {}

    Process {
        ($Name -in [Environment+SpecialFolder]::GetNames([Environment+SpecialFolder]))
    }

    End {}
}