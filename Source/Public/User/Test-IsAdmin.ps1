function Test-IsAdmin {
    <#
    .SYNOPSIS
        Test for elevated privileges.
    .DESCRIPTION
        Test if the current session has elevated privileges.

        Returns true if the current session has elevated privileges and false
        otherwise.
    .OUTPUTS
        [boolean]
    .EXAMPLE
        Test-IsAdmin

        Tests to see if the current session has elevated privileges.
    .NOTES
        Author  : Andy Arismendi (http://stackoverflow.com/users/251123/andy-arismendi)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : v1.0 - 20/04/18 - Initial

        Also see http://stackoverflow.com/questions/9999963/powershell-test-admin-rights-within-powershell-script
    .LINK
        Test-IsAccountEmptyPassword
    #>
    [CmdletBinding()]
    [OutputType([boolean])]
    Param ()

    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal -ArgumentList $identity
    $principal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator)
}