# Taken from https://social.technet.microsoft.com/Forums/scriptcenter/en-US/fd34260e-ee4c-47c5-8c69-872a5239745f/add-a-network-location-via-script?forum=ITCG
function Set-NetworkShortcut {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Destination,

        [ValidateNotNullOrEmpty()]
        [ValidateScript( { Test-Path (Join-Path -Path (Split-Path -Path $env:PUBLIC -Parent) -ChildPath $_) })]
        [string]$Username = $env:USERNAME,

        [switch]$Force
    )

    $shortcutPath = Join-Path -Path (Split-Path -Path $env:PUBLIC -Parent) -ChildPath "$Username\appdata\Roaming\Microsoft\Windows\Network Shortcuts"

    # check if the .lnk file exists for the shortcut
    $shortcutFullPath = Join-Path -Path $shortcutPath -ChildPath $Name
    if ($Force -and (Test-Path -Path $shortcutFullPath)) {
        Remove-Item -Path $shortcutFullPath -Force -Recurse
    }

    # create the folder
    $newLinkFolder = New-Item -Name $Mame -Path $shortcutFullPath -Type Directory

    # Create the ini file
    @"
[.ShellClassInfo]
CLSID2={0AFACED1-E828-11D1-9187-B532F1E9575D}
Flags=2
ConfirmFileOp=1
"@ | Out-File -FilePath (Join-Path -Path $shortcutFullPath -ChildPath "Desktop.ini")

        # Create the shortcut file
    $shortcut = (New-Object -ComObject WScript.Shell).Createshortcut((Join-Path -Path $shortcutFullPath -ChildPath "target.lnk"))
    $shortcut.TargetPath = $Destination
    $shortcut.IconLocation = "%SystemRoot%\system32\SHELL32.DLL, 275"   # find more icons http://help4windows.com/windows_7_shell32_dll.shtml
    $shortcut.Description = $Destination
    $shortcut.WorkingDirectory = $Destination
    $shortcut.Save()

    Set-ItemProperty (Join-Path -Path $shortcutFullPath -ChildPath "Desktop.ini") -Name Attributes -Value ([IO.FileAttributes]::System -bxor [IO.FileAttributes]::Hidden)
    Set-ItemProperty $shortcutFullPath -Name Attributes -Value ([IO.FileAttributes]::ReadOnly)
}