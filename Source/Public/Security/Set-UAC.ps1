function Set-UAC {
    <#
    .SYNOPSIS
        Brief synopsis about the function.
    .DESCRIPTION
        Detailed explanation of the purpose of this function.
    .PARAMETER Param1
        The purpose of param1.
    .PARAMETER Param2
        The purpose of param2.
    .EXAMPLE
        <FUNCTION> -Param1 'Value1', 'Value2'
    .EXAMPLE
        'Value1', 'Value2' | <FUNCTION>
    .INPUTS
        [String]
    .OUTPUTS
        [PSObject]
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        History : 1.0 - 21/04/18 - Initial release
    .LINK
        Related things
    #>

    [OutputType([PSCustomObject])]
    [CmdletBinding()]
    Param(
        [Parameter(ParameterSetName = 'Enable')]
        [switch]
        $Enable,

        [Parameter(ParameterSetName = 'Disable')]
        [switch]
        $Disable
    )

    if ($Enable) {
        Write-Verbose "Enabling UAC."
        $state = 1
    }
    else {
        Write-Verbose "Disabling UAC."
        $state = 0
    }

    New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name 'EnableLUA' -Value $state -PropertyType 'DWord' -Force
}