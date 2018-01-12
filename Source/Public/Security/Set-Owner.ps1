# this function should be renamed to make it clear what it is setting the owner of
function Set-AclOwner {
<#
.SYNOPSIS
Set the owner of an object.

.DESCRIPTION
Sets the owner of an object. This is related to the 'Acl' group of cmdlets, hence the name. 

.EXAMPLE
An example

.NOTES
General notes
#>
    [CmdletBinding()]
    Param (
        # Path to set the owner of.
        [Parameter(Mandatory = $true, HelpMessage = 'Path to set owner of.')]
        [ValidateScript( { Test-Path $_ })]
        [string]$Path,

        # The samAccountName to set as the object owner.
        [Parameter(Mandatory = $true, HelpMessage = 'The samAccountName to set as the object owner.')]
        [ValidateScript( { [bool](Get-AdUser -Filter { samaccountname -eq $_ } ) } )]
        [Alias('Sam', 'Username')]
        [string]$SamAccountName
    )

    Write-Verbose "Retrieving existing ACL from $Path"
    $acl = Get-ACL -Path $Path
    $Group = New-Object System.Security.Principal.NTAccount($SamAccountName)
    Write-Verbose "Setting ACL owner to $SamAccountName"
    $acl.SetOwner($Group)
    Write-Verbose "Setting ACL on $Path"
    Set-Acl -Path $Path -AclObject $acl
}