#Requires -Version 4

<#
.SYNOPSIS
    Provides functions for configuring Windows.
.DESCRIPTION
    Module to provide configuration, automation and management functionality for Windows computers
.NOTES
	Author : Paul Broadwith (https://github.com/pauby)
    
    See CHANGELOG.md for version history.
.LINK
    https://www.github.com/pauby/oxygen
#>

Set-StrictMode -Version Latest

function Reset-Printer
{
<#
.SYNOPSIS
    Reset the specified printer on the local computer.
.DESCRIPTION
    Reset the specified printer on the local computer.
.NOTES
	Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.OUTPUTS
    [System.Boolean]
.EXAMPLE
    Reset-Printer -Name "HP LaserJet 4" -DriverName "HP LaserJet PS" -PortName "HPLJ4" -PrinterHostAddress "192.168.10.100"

    Resets the printer called "HP LaserJet 4", driver named "HP LaserJet PS",  port "HPLJ4" with IP address 192.168.10.100
#>

    [OutputType([System.Boolean])]
    Param
    (
        # Specifies the name of the printer to reset on the local computer.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        # Specifies the name of the driver to reset on the local computer.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$DriverName,

        # Specifies the name of the port to reset on the local computer.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$PortName,

        # Specifies the IP address of the printer to reset on the local computer.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$PrinterHostAddress
    )

    if (Test-Printer -Name $Name ) {
        Remove-Printer -Name $Name

        # check the printer is gone
        if (Test-Printer -Name $Name) {
            return $false
        }
    }

    # check each of these suceeds.
    if ((-not (Reset-PrinterPort -PortName $PortName -PrinterHostAddress $PrinterHostAddress)) -or `
            (-not (Reset-PrinterDriver -DriverName $DriverName)) -or
            (-not (Add-Printer -Name $Name -DriverName $DriverName -PortName $PortName)) ) {
        return $false
    }

    $true
}


function Reset-PrinterDriver
{
<#
.SYNOPSIS
    Reset the specified printer driver.
.DESCRIPTION
    Reset the specified printer driver.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/Oxygen
.OUTPUTS
	[System.Boolean]
.EXAMPLE
    Reset-PrinterDriver -Name "HP LaserJet PS"

    Remove and add the printer driver called "HP LaserJet PS"
#>
    [OutputType([System.Boolean])]
    [CmdletBinding()]
    Param
    (
        # Specifies the printer driver to reset.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    if (Test-PrinterDriver -Name $Name)
    {
        # remove the driver
        Remove-PrinterDriver -Name $Name -ErrorAction SilentlyContinue

        # check it's gone
        if (Test-PrinterDriver -Name $Name) {
            return $false
        }
    }

    # add the printer driver
    Add-PrinterDriver -Name $Name -ErrorAction SilentlyContinue

    # check it's been added
    if (Test-PrinterDriver -Name $Name) {
        return $true
    }
    else {
        return $false
    }

}


function Reset-PrinterPort
{
<#
.SYNOPSIS
    Resets the printer port.
.DESCRIPTION
    Resets the printer port configuration by removing then adding it with the new one.

    You do not need administrator privileges to use Reset-PrinterPort
.NOTES
	Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.OUTPUTS
	[System.Boolean]
.EXAMPLE]
    Reset-PrinterPort -PortName "HPLJ" -PrinterHostAddress "192.168.10.100"

    Removes the printer port called HPLJ and adds it back again with the same name and IP host address of 192.168.10.100
#>
    [OutputType([System.Boolean])]
    Param
    (
        # Specifies the Name of the port to be reset. You can get this name using Get-PrinterPort.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$PortName,

        # Specifies the IP address of the printer port to be added.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$PrinterHostAddress
    )

    # check we have a port and remove it
    if (Test-PrinterPort -Name $PortName) {
        Remove-PrinterPort -Name $PortName -ErrorAction SilentlyContinue

        # check the port is gone
        if (Test-PrinterPort -Name $PortName) {
            return $false
        }
    }

    # add the port and check it's now been added
    Add-PrinterPort -Name $PortName -PrinterHostAddress $PrinterHostAddress -ErrorAction SilentlyContinue
    if (Test-PrinterPort -Name $PortName) {
        $true
    }
    else {
        $false
    }
}


function Test-Printer
{
<#
.SYNOPSIS
    Tests if the specified printer exists on the local computer.
.DESCRIPTION
    Tests if the specified printer exists on the local computer.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.OUTPUTS
	Output is of type [bool] and is true if the printer name exists and false otherwise.
.EXAMPLE
    Test-Printer -Name "HP LaserJet 4"

    Tests if the printer named "HP LaserJet 4" exists on the local computer.
#>
    [OutputType([System.Boolean])]
    Param (
        # Specified printer name to test.
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    ([bool](Get-Printer | Where-Object { $_.Name -eq $Name } ))
}


function Test-PrinterDriver
{
<#
.SYNOPSIS
    Tests if the printer driver is present on the system.
.DESCRIPTION
    Tests if the printer driver is present on the system.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.EXAMPLE
    Test-PrinterDriver "HP LaserJet 4"

    This would test if the printer driver 'HP LaserJet 4' was installed.
#>

    [OutputType([System.Boolean])]
    Param (
        # Printer driver name
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    [bool](Get-PrinterDriver | Where-Object { $_.Name -eq $Name } )
}


function Test-PrinterDriverStore
{
<#
.SYNOPSIS
    Test if the specified printer driver exists in the printer driver store.
.DESCRIPTION
    Test if the specified printer driver exists in the printer driver store.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.EXAMPLE
    Test-PrinterDriverStore -Name "HP LaserJet PS"

    Tests if the printer driver named "HP LaserJet PS" exists in the printer driver store.
#>
    [OutputType([System.Boolean])]
    Param
    (
        # Specifies the name of the printer driver to test.
        [Parameter(Mandatory=$true)]
        [string]$Name
    )

    # check if the driver is in the list already
    if (Test-PrinterDriver -Name $Name) {
        return $true
    }
    else {
        # try and install the driver - if it fails then the driver most likely does not exist in the store
        try {
            Add-PrinterDriver -Name $DriverName
        }
        catch {
            # if we get here then the driver will most likely not exist in the store so will need to be added
            return $false
        }

        # if we get here then the printer driver was added successfully - remove it (as we only wanted to test it)
        Remove-PrinterDriver -Name $DriverName
        return $true
    }
 }


function Test-PrinterPort
{
<#
.SYNOPSIS
    Tests if the specified printer port exists on the computer.
.DESCRIPTION
    Tests if the specified printer port exists on the computer.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.EXAMPLE
    Test-PrinterPort -PortName "TestPrinter"

    Tests whether the port named TestPrinter exisst on the computer.
#>
    [OutputType([bool])]
    Param (
        # Specifies the name of the port to test.
        [Parameter(Mandatory=$true)]
        [string]$Name
    )

    [bool](Get-PrinterPort | Where-Object { $_.Name -eq $Name } )
}


function Import-Registry {
    Param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateScript({ Test-Path $_ })]
        [string]$Path
    )

    Invoke-Expression "regedit /s $Path"
}


function Add-Acl {
<#
.SYNOPSIS
Set an ace on an object.

.DESCRIPTION
Set an ace, created using New-Acl, on an object.

.EXAMPLE
Add-Acl -Path 'C:\Windows\Notepad.exe' -AceObject $aceObj

Adds the access control entry object, $aceObj created using New-Acl, to 'C:\Windows\Notepad.exe'

.NOTES
Author  : Paul Broadwith (https://github.com/pauby)

Code was created using https://technet.microsoft.com/en-us/library/ff730951.aspx as a basis.

.LINK
https://github.com/pauby/oxygen
#>
    [CmdletBinding()]
    Param (
        # Path to the object to set the acl on.
        [Parameter(Mandatory = $true)]
        [string]$Path,

        # Ace / Acl to set. Create this using New-Acl.
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('Acl', 'AclObject')]
        [System.Security.AccessControl.FileSystemAccessRule]$AceObject
    )

    Write-Verbose "Retrieving existing ACL from $Path"
    $objACL = Get-ACL -Path $Path
    $objACL.AddAccessRule($AceObject) 
    Write-Verbose "Setting ACL on $Path"
    Set-ACL -Path $Path -AclObject $objACL
}



Function Disable-UAC
{
        New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 0 -PropertyType "DWord" -Force
}


function New-AclObject {
<#
.SYNOPSIS
Creates a new ACL object.

.DESCRIPTION
Creates a new ACL object for use with module -Acl* functions.

.EXAMPLE
New-AclObject -SamAccountName 'testuser' -Permission 'Modify'

Creates an ACL object to Allow Modify permissions without inheritance or propogation for the samAccountName 'testuser'
.NOTES
Author  : Paul Broadwith (https://github.com/pauby)

Code was created using https://technet.microsoft.com/en-us/library/ff730951.aspx as a basis.
.LINK
https://github.com/pauby/oxygen
#>
    [CmdletBinding()]
    Param (
        # samAccountName to create the object for
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('Sam', 'Username')]
        [string]$SamAccountName,
    
        # Permissions / rights to be applied (see https://msdn.microsoft.com/en-us/library/system.security.accesscontrol.filesystemrights(v=vs.110).aspx for information)
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alais('AccessRight')]
        [System.Security.AccessControl.FileSystemRights]$Permission,

        # Allow or deny the access rule (see https://msdn.microsoft.com/en-us/library/w4ds5h86(v=vs.110).aspx for information).
        # Default is 'Allow'
        [ValidateNotNullOrEmpty()]
        [System.Security.AccessControl.AccessControlType]$AccessControl = 'Allow',

        # Inheritance rules to be applied (see https://msdn.microsoft.com/en-us/library/system.security.accesscontrol.inheritanceflags(v=vs.110).aspx for information).
        # Default is 'None'
        [ValidateNotNullOrEmpty()]
        [Alias('InheritanceFlag')]
        [System.Security.AccessControl.InheritanceFlags]$Inheritance = 'None',

        # Propogation method for the rules (see https://msdn.microsoft.com/en-us/library/system.security.accesscontrol.propagationflags(v=vs.110).aspx for information).
        # Default is 'None'
        [ValidateNotNullOrEmpty()]
        [Alias('PropogationFlag')]
        [System.Security.AccessControl.PropagationFlags]$Propagation = 'None'
    )

    $objUser = New-Object System.Security.Principal.NTAccount($Username) 

    New-Object System.Security.AccessControl.FileSystemAccessRule($objUser, $Permission, $Inheritance, $Propagation, $AccessControl)
}


# this function should be renamed to make it clear what it is setting the owner of
function Set-AclOwner {
<#
.SYNOPSIS
Set the owner of an object.

.DESCRIPTION
Sets the owner of an object. This is related to the 'Acl' group of cmdlets, hence the name. 

.EXAMPLE
An example

.NOTES
General notes
#>
    [CmdletBinding()]
    Param (
        # Path to set the owner of.
        [Parameter(Mandatory = $true, HelpMessage = 'Path to set owner of.')]
        [ValidateScript( { Test-Path $_ })]
        [string]$Path,

        # The samAccountName to set as the object owner.
        [Parameter(Mandatory = $true, HelpMessage = 'The samAccountName to set as the object owner.')]
        [ValidateScript( { [bool](Get-AdUser -Filter { samaccountname -eq $_ } ) } )]
        [Alias('Sam', 'Username')]
        [string]$SamAccountName
    )

    Write-Verbose "Retrieving existing ACL from $Path"
    $acl = Get-ACL -Path $Path
    $Group = New-Object System.Security.Principal.NTAccount($SamAccountName)
    Write-Verbose "Setting ACL owner to $SamAccountName"
    $acl.SetOwner($Group)
    Write-Verbose "Setting ACL on $Path"
    Set-Acl -Path $Path -AclObject $acl
}


function Add-WindowsDriverPackage
{
<#
.SYNOPSIS
    Adds a Windows driver to the driver store.
.DESCRIPTION
    This function is a wrapper for the pnputil.exe program. It adds a Windows
    driver to the driver store by passing the .inf file. $_
    
    Using the -Install switch will also install install the driver package(s) too.

    The functions' return value is dependent on the errorlevel from 
    pnputil.exe. If the errorlevel is 0 then this indicates successfully
    and true is returned, otherwise false is returned.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.EXAMPLE
    Add-WindowsDriverPackage -Path c:\drivers\usbcam.inf

    Adds c:\drivers\usbcam.inf driver package to the driver store.
.EXAMPLE
    Add-WindowsDriverPackage -Path c:\drivers\*.inf -Install
    
    Adds and installs all *.inf driver packages from c:\drivers
#>
    [OutputType([System.Boolean])]
    Param
    (
        #     Path to the .inf file of the drive rpackage. Note that this can use wildcards.
        # So you can you c:\drivers\*.inf.
        # The path will be checked and exception thrown if it does nto exist.
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateScript( { Test-Path $_ } )]
        [string]$Path,

        # Will install the driver package(s).
        [switch]$Install
    )

    if ($Install.IsPresent) {
        Write-Verbose "Driver package $Path to be added to driver store."
        $cmd = "pnputil.exe -i -a"
    }
    else {
        Write-Verbose "Driver package $Path to be added to driver store and installed."
        $cmd = "pnputil.exe -a"
    }

    Invoke-Expression -Command "$cmd `'$Path`'" | Out-Null
    if ($LastExitCode -ne 0)
    {
        Write-Verbose "Driver package $Path failed to be added / installed."
        $false
    }
    else {
        Write-Verbose "Driver package $Path was added / installed"
    }
    
    $true
}


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


Function Enable-PageFile
{
    $cs = gwmi Win32_ComputerSystem
    if (!$cs.AutomaticManagedPagefile) {
        $cs.AutomaticManagedPagefile = $True
        $false
    }
    $true
}


function Get-OS {

    Param (
        [Parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string]$ComputerName = "localhost"
    )

    Begin {}

    Process {
        try {
            $osData = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $ComputerName
        }
        catch {
            throw $Error[0]
        }

        @{
            name = $osData.Caption;
            architecture = $osData.OSArchitecture;
            platform = switch ($osData.ProductType) { 
                1 { "Workstation" }
                2 { "Domain Controller" } 
                3 { "Server" }
            }
            type = switch ($osData.OSType) { 
                18 { "Windows" } 
            }
            version = $osData.Version;
            buildnumber = $osData.BuildNumber;
         }
    }

    End {}
}


function Get-WindowsSpecialFolderPath
{
<#
.SYNOPSIS
    Gets the path of a Windows special folder.
.DESCRIPTION
    Gets the path of a Windows special folder such as Network Shortcuts, Desktop, etc.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.EXAMPLE
    Get-WindowsSpecialFolderPath -Name "NetworkShortcuts"

    Gets the network shortcuts folder path.
#>
    [CmdletBinding()]
    [OutputType([System.String])]
    Param (
        #     The name of the special folder. This name must match one from the list at https://msdn.microsoft.com/en-us/library/system.environment.specialfolder.aspx

        [Parameter(Mandatory=$true)]
        [ValidateScript( { if ([string]::IsNullOrEmpty($_)) {
                                $false
                            }
                            else {
                                $_ | Test-WindowsSpecialFolderName
                            }
                        } )]
        [string]$Name
    )

    [Environment]::GetFolderPath($Name)
}


Function Remove-PageFile
{
    $pg = gwmi win32_pagefileusage
    if ($pg) {
        remove-item $pg.name -force
        $true
    }
    $false
}


function Set-Region {
<#
.SYNOPSIS
Sets the Regional Settings for Windows.

.DESCRIPTION
Sets the Regional Settings for Windows like you would do by going to Control Panel -> Regional Settings

.NOTES
    Author : Paul Broadwith (https://github.com/pauby)

.LINK
    https://www.github.com/pauby/oxygen

.EXAMPLE
Set-Region -Path c:\temp\region-uk.xml

Sets the regional settings to that contained in c:\temp\region-uk.xml
#>
    Param (
        # Path to the regional settings XML file.
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateScript( { Test-Path $_ } )]
        [string]$Path
    )

    $cmd = "intl.cpl,,/f:$Path"
    Invoke-Expression "rundll32.exe shell32,Control_RunDLL '$cmd'"
}


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


<#
.SYNOPSIS
Returns boolean determining if prompt was run noninteractive.
.DESCRIPTION
First, we check `[Environment]::UserInteractive` to determine if we're if the shell if running 
interactively. An example of not running interactively would be if the shell is running as a service.
If we are running interactively, we check the Command Line Arguments to see if the `-NonInteractive` 
switch was used; or an abbreviation of the switch.
.LINK
https://github.com/Vertigion/Test-IsNonInteractiveShell
#>
function Test-IsNonInteractiveShell {
    if ([Environment]::UserInteractive -and (-not ([Environment]::GetCommandLineArgs() | ?{ $_ -like '-NonI*' }))) {
        # Test each Arg for match of abbreviated '-NonInteractive' command.
        return $true
    }

    return $false
}


function Test-WindowsSpecialFolderName
{
<#
.SYNOPSIS
    Tests if a name is a Windows Special Folder Name.
.DESCRIPTION
    Tests if a name is a Windows Special Folder Name.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby/oxygen
.EXAMPLE
    Test-WindowsSpecialFolderName -Name "Desktop"

    Tests whether "Desktop" is a valid Windows Special Folder Name and returns $true if it is or $false otherwise.
#>
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    Param (
        # The name to test as found at https://msdn.microsoft.com/en-us/library/system.environment.specialfolder.aspx
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    Begin {}

    Process {
        ($Name -in [Environment+SpecialFolder]::GetNames([Environment+SpecialFolder]))
    }

    End {}
}


# Taken from https://social.technet.microsoft.com/Forums/scriptcenter/en-US/fd34260e-ee4c-47c5-8c69-872a5239745f/add-a-network-location-via-script?forum=ITCG
function Set-NetworkShortcut {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
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
        Write-Verbose "Deleting network shortcut $shortcutFullPath as -Force parameter provided"
        Remove-Item -Path $shortcutFullPath -Force -Recurse
    }

    # create the folder
    Write-Verbose "Creating the shortcut folder $shortcutFullPath"
    New-Item -Name $Name -Path $shortcutFullPath -Type Directory | Out-Null

    # Create the ini file
    $iniPath = Join-Path -Path $shortcutFullPath -ChildPath "Desktop.ini"
    Write-Verbose "Creating the INI file $iniPath"
    @"
[.ShellClassInfo]
CLSID2={0AFACED1-E828-11D1-9187-B532F1E9575D}
Flags=2
ConfirmFileOp=1
"@ | Out-File -FilePath $iniPath 

        # Create the shortcut file
    $lnkPath = Join-Path -Path $shortcutFullPath -ChildPath "target.lnk"
    Write-Verbose "Cresating shortcut .lnk $lnkPath"
    $shortcut = (New-Object -ComObject WScript.Shell).Createshortcut($lnkPath)
    $shortcut.TargetPath = $Destination
    $shortcut.IconLocation = "%SystemRoot%\system32\SHELL32.DLL, 275"   # find more icons http://help4windows.com/windows_7_shell32_dll.shtml
    $shortcut.Description = $Destination
    $shortcut.WorkingDirectory = $Destination
    $shortcut.Save()

    Set-ItemProperty (Join-Path -Path $shortcutFullPath -ChildPath "Desktop.ini") -Name Attributes -Value ([IO.FileAttributes]::System -bxor [IO.FileAttributes]::Hidden)
    Set-ItemProperty $shortcutFullPath -Name Attributes -Value ([IO.FileAttributes]::ReadOnly)
}


function Set-Shortcut
{
<#
.SYNOPSIS
    Sets a Windows shortcut.
.DESCRIPTION
    Sets a Windows shortcut.
.NOTES
    Author : Paul Broadwith (https://github.com/pauby)
.LINK
    https://www.github.com/pauby
.PARAMETER Path
    Path to the shortcut file. Should end with '.lnk'. The parent path of this must exist.

    For example, if the path is c:\windows\system32\notepad.exe then c:\windows\system32 must exist.
.PARAMETER Target
    The destination of the shortcut. This could be an application or a URL.
.OUTPUTS
	Returns a [bool] with $true if the shortcut was created or $false otherwise.
.EXAMPLE
    Set-Shortcut -Path "c:\user\joe\desktop\notepad.lnk" -Target "c:\windows\system32\notepad.exe"

    Creates a shortcut to c:\windows\system32\notepad.exe on the desktop of the user 'joe'.
#>
    [CmdletBinding()]
    [OutputType([boolean])]
    Param (
        [Parameter(Mandatory=$true)]
        [ValidateScript( {  if ([string]::IsNullOrEmpty($_)) {
                                $false
                            }
                            else {
                                Test-Path -Path (Split-Path $_ -Parent)
                            }
                        })]
        [string]
        $Path,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        $Target
    )

    $ShortcutFile = $Path
    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
    $Shortcut.TargetPath = $Target

    try {
        $Shortcut.Save()
    }
    catch {
        $false
    }

    $true
}


function Test-EmptyPassword
{
    Param 
    (
        [Parameter(Mandatory=$true)]
        [string]
        $Username,
        
        [Parameter(Mandatory=$false)]
        [string]
        $Computername = "localhost"
    )
    
    $user = [ADSI]("WinNT://" + $Computername+ "/" + $Username + ", user")
    try 
    {
        $user.invoke("ChangePassword","","DummyPassword")    
    }
    catch [System.Exception] 
    {
        return $false
    }
    
    $user.invoke("ChangePassword","DummyPassword","")  
    return $true
}


function Test-IsAdmin
{
<#
.SYNOPSIS
    Test for elevated privileges.
.DESCRIPTION
    Test if the current session has elevated privileges.

    Returns true if the current session has elevated privileges and false otherwise.
.NOTES
    Code by Andy Arismendi (http://stackoverflow.com/users/251123/andy-arismendi)
    http://stackoverflow.com/questions/9999963/powershell-test-admin-rights-within-powershell-script
.LINK
    https://github.com/pauby/oxygen    
.OUTPUTS
	[System.Boolean]
.EXAMPLE
    Test-IsAdmin

    Tests to see if the current session has elevated privileges.
#>

    try
    {
        $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
        $principal = New-Object Security.Principal.WindowsPrincipal -ArgumentList $identity
        return $principal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator )
    }
    catch
    {
        throw "Failed to determine if the current user has elevated privileges. The error was: '{0}'." -f $_
    }
}



# Aliases

New-Alias -Name 'Test-IsInteractiveUser' -Value '[Environment]::UserInteractive'
