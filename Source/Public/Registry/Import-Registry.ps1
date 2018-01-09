function Import-Registry {
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateScript({ Test-Path $_ })]
        [string]$Path
    )

    Invoke-Expression "regedit /s $Path"
}