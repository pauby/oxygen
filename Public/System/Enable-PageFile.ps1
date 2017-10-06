Function Enable-PageFile
{
    $cs = gwmi Win32_ComputerSystem
    if (!$cs.AutomaticManagedPagefile) {
        $cs.AutomaticManagedPagefile = $True
        $false
    }
    $true
}