# this function should be renamed to make it clear what it is setting the owner of
function Set-Owner {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, HelpMessage = 'Path of file or folder to set owner of.')]
        [ValidateScript( { Test-Path $_ })]
        [string]$Path,

        [Parameter(Mandatory = $true, HelpMessage = 'Owner samAccountName to set')]
        [ValidateScript( { [bool](Get-AdUser -Filter { samaccountname -eq $_ } ) } )]
        [string]$SamAccountName
    )

    $acl = Get-ACL -Path $Path
    $Group = New-Object System.Security.Principal.NTAccount($SamAccountName)
    $acl.SetOwner($Group)
    Set-Acl -Path $Path -AclObject $acl
}