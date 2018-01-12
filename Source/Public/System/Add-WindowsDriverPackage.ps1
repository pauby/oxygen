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