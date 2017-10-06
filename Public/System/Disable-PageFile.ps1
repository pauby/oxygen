Function Disable-PageFile
{
    $cs = gwmi Win32_ComputerSystem
    if ($cs.AutomaticManagedPagefile) 
    {
		try {
			$cs.AutomaticManagedPagefile = $false
			$PutOptions = New-Object System.Management.PutOptions
			$PutOptions.Type = 2
			$cs.PsBase.Put()
			$true
		}
		catch {
			$false
		}
    }
    $false
}