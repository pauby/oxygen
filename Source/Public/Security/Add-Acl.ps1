function Add-Acl {
    <#
    .SYNOPSIS
    Set an ace on an object.
    .DESCRIPTION
    Set an ace, created using New-Acl, on an object.
    .INPUTS
        None
    .OUTPUTS
        System.Security.AccessControl.FileSecurity
    .EXAMPLE
    Add-Acl -Path 'C:\Windows\Notepad.exe' -AceObject $aceObj

    Adds the access control entry object, $aceObj created using New-Acl, to 'C:\Windows\Notepad.exe'
    .NOTES
    Author  : Paul Broadwith (https://github.com/pauby)
    Project : Oxygen (https://github.com/pauby/oxygen)
    History : v1.0 - 22/04/18 - Initial

    Code was created using https://technet.microsoft.com/en-us/library/ff730951.aspx as a basis.
    .LINK
        New-AclObject
    .LINK
        Set-Owner
    .LINK
        https://github.com/pauby/oxygen/blob/master/docs/add-acl.md
    #>
    [CmdletBinding()]
    Param (
        # Path to the object to set the acl on.
        [Parameter(Mandatory = $true)]
        [string]$Path,

        # Ace / Acl to set. Create this using New-Acl.
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('Acl', 'AclObject')]
        [System.Security.AccessControl.FileSystemAccessRule]$AceObject
    )

    Write-Verbose "Retrieving existing ACL from $Path"
    $objACL = Get-ACL -Path $Path
    $objACL.AddAccessRule($AceObject) 
    Write-Verbose "Setting ACL on $Path"
    Set-ACL -Path $Path -AclObject $objACL
}

