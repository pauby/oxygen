# http://stackoverflow.com/questions/9701840/how-to-create-a-shortcut-using-powershell
function Set-OxyShortcut
{
	Param
	(
		[Parameter(Mandatory=$true)]
		[string]
		$TargetPath,
		
		[Parameter(Mandatory=$false)]
		[string]
		$TargetArguments,
		
		[Parameter(Mandatory=$true)]
		[string]
		$ShortcutPath
		)
		
	$WshShell = New-Object -comObject WScript.Shell
	$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
	$Shortcut.TargetPath = $TargetPath
	if (-not [string]::IsNullOrEmpty($TargetArguments))
	{
		write-host "arguments - $targetarguments"
		$Shortcut.Arguments = $TargetArguments		
	}
	$Shortcut.Save()
}