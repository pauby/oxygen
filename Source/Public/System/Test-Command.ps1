# https://github.com/mwrock/packer-templates/blob/master/scripts/Test-Command.ps1
function Test-Command($cmdname) {
    try {
        Get-Command -Name $cmdname -ErrorAction SilentlyContinue
        return $true
    }
    catch {
        $global:error.RemoveAt(0)
        return $false
    }
}