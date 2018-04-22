function Test-IsInteractiveUser {
    <#
    .SYNOPSIS
        Tests if the current user is interactive.
    .DESCRIPTION
        Tests if the current user is interactive.
    .EXAMPLE
        Test-IsInteractiveUser

        Return $true if the current user is interactive, $false otherwise.
    .OUTPUTS
        [boolean]
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : 1.0 - 21/04/18 - Initial release
    .LINK
        Test-IsAdmin
    #>

    [CmdletBinding()]
    [OutputType([boolean])]
    Param()

    [Environment]::UserInteractive
}