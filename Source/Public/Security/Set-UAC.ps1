function Set-UAC {
    <#
    .SYNOPSIS
        Enables or disables UAC.
    .DESCRIPTION
        Enables or disables UAC by change the EnableLUA key in the registry at
        HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System.
    .EXAMPLE
        Set-UAC -Enable

        Enables UAC on the local computer.
    .EXAMPLE
        Set-UAC -Disable

        Disables UAC on the local computer.
    .INPUTS
        None
    .OUTPUTS
        [PSCustomObject]
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : 1.0 - 21/04/18 - Initial release
    .LINK
        https://github.com/pauby/oxygen/blob/master/docs/set-uac.md
    #>

    [OutputType([PSCustomObject])]
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
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
        $action = 'Disabling'
        $state = 1
    }
    else {
        Write-Verbose "Disabling UAC."
        $action = 'Enabling'
        $state = 0
    }

    if ($PSCmdlet.ShouldProcess('UAC', $action)) {
        New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
            -Name 'EnableLUA' -Value $state -PropertyType 'DWord' -Force
    }
}