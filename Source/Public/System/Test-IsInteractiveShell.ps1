
function Test-IsInteractiveShell {
    <#
    .SYNOPSIS
        Tests if the current shell is noninteractive.
    .DESCRIPTION
        First, we check `[Environment]::UserInteractive` to determine if the
        shell is running interactively. An example of not running interactively
        would be if the shell is running as a service. If we are running
        interactively, we check the Command Line Arguments to see if the
        `-NonInteractive` switch was used or an abbreviation of the switch.
    .OUTPUTS
        [boolean]
    .NOTES
        Author  : Vertigion (https://github.com/Vertigion/Test-IsNonInteractiveShell)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : v1.0 - 20/04/18 - Initial
    .LINK
        Get-OS
    #>

    [CmdletBinding()]
    [OutputType([boolean])]
    Param()

    ([Environment]::UserInteractive -and (-not ([Environment]::GetCommandLineArgs() | Where-Object { $_ -like '-NonI*' })))
}