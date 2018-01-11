function Add-Acl {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [System.Security.AccessControl.FileSystemAccessRule]$AceObject
    )

    $objACL = Get-ACL -Path $Path
    $objACL.AddAccessRule($AceObject) 
    Set-ACL -Path $Path -AclObject $objACL
}

