function Test-IsAdmin
{
<#
.SYNOPSIS
    Test for elevated privileges.
.DESCRIPTION
    Test if the current session has elevated privileges.

    Returns true if the current session has elevated privileges and false otherwise.
.NOTES
    Code by Andy Arismendi (http://stackoverflow.com/users/251123/andy-arismendi)
    http://stackoverflow.com/questions/9999963/powershell-test-admin-rights-within-powershell-script
.LINK
    https://github.com/pauby/oxygen    
.INPUTS
    None.
.OUTPUTS
	[System.Boolean]
.EXAMPLE
    Test-IsAdmin

    Tests to see if the current session has elevated privileges.
#>

    try
    {
        $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
        $principal = New-Object Security.Principal.WindowsPrincipal -ArgumentList $identity
        return $principal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator )
    }
    catch
    {
        throw "Failed to determine if the current user has elevated privileges. The error was: '{0}'." -f $_
    }
}