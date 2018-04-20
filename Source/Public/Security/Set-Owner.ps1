function Set-AclOwner {
    <#
    .SYNOPSIS
        Set the owner of an object.
    .DESCRIPTION
        Sets the owner of an object. This is related to the 'Acl' group of cmdlets, hence the name. 
    .EXAMPLE
        Set-AclOwner -Path c:\myfile.txt -SamAccountName 'chewie'

        Will set the account (group or user) 'chewie' to be the owner of 'c:\myfile.txt'
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : v1.0 - 20/04/18 - Initial
    .LINK
        Add-Acl
    .LINK
        New-AclObject
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    Param (
        # Path to set the owner of.
        [Parameter(Mandatory, HelpMessage = 'Path to set owner of.')]
        [ValidateScript( { Test-Path $_ })]
        [string]$Path,

        # The samAccountName to set as the object owner.
        [Parameter(Mandatory, HelpMessage = 'The samAccountName to set as the object owner.')]
        [Alias('Sam', 'Username')]
        [string]$SamAccountName
    )

    Write-Verbose "Retrieving existing ACL from '$Path'"
    $acl = Get-ACL -Path $Path
    $account = New-Object System.Security.Principal.NTAccount($SamAccountName)
    Write-Verbose "Setting ACL owner to '$SamAccountName'"

    if ($PSCmdlet.ShouldProcess($Path, "Setting object owner to '$SamAccountName'")) {
        $acl.SetOwner($account)
        Write-Verbose "Setting ACL on '$Path'"
        Set-Acl -Path $Path -AclObject $acl
    }
}