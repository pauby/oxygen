function New-AclObject {
<#
.SYNOPSIS
Creates a new ACL object.

.DESCRIPTION
Creates a new ACL object for use with module -Acl* functions.

.EXAMPLE
New-AclObject -SamAccountName 'testuser' -Permission 'Modify'

Creates an ACL object to Allow Modify permissions without inheritance or propogation for the samAccountName 'testuser'
.NOTES
Author  : Paul Broadwith (https://github.com/pauby)

Code was created using https://technet.microsoft.com/en-us/library/ff730951.aspx as a basis.
.LINK
https://github.com/pauby/oxygen
#>
    [CmdletBinding()]
    Param (
        # samAccountName to create the object for
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('Sam', 'Username')]
        [string]$SamAccountName,
    
        # Permissions / rights to be applied (see https://msdn.microsoft.com/en-us/library/system.security.accesscontrol.filesystemrights(v=vs.110).aspx for information)
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alais('AccessRight')]
        [System.Security.AccessControl.FileSystemRights]$Permission,

        # Allow or deny the access rule (see https://msdn.microsoft.com/en-us/library/w4ds5h86(v=vs.110).aspx for information).
        # Default is 'Allow'
        [ValidateNotNullOrEmpty()]
        [System.Security.AccessControl.AccessControlType]$AccessControl = 'Allow',

        # Inheritance rules to be applied (see https://msdn.microsoft.com/en-us/library/system.security.accesscontrol.inheritanceflags(v=vs.110).aspx for information).
        # Default is 'None'
        [ValidateNotNullOrEmpty()]
        [Alias('InheritanceFlag')]
        [System.Security.AccessControl.InheritanceFlags]$Inheritance = 'None',

        # Propogation method for the rules (see https://msdn.microsoft.com/en-us/library/system.security.accesscontrol.propagationflags(v=vs.110).aspx for information).
        # Default is 'None'
        [ValidateNotNullOrEmpty()]
        [Alias('PropogationFlag')]
        [System.Security.AccessControl.PropagationFlags]$Propagation = 'None'
    )

    $objUser = New-Object System.Security.Principal.NTAccount($Username) 

    New-Object System.Security.AccessControl.FileSystemAccessRule($objUser, $Permission, $Inheritance, $Propagation, $AccessControl)
}