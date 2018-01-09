<#
# This file is part of the Oxygen distribution (https://github.com/pauby/Oxygen).
# Copyright (c) 2016 Paul Broadwith
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#>

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
	Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0 - 14/07/16 - Initial version
.LINK
    https://www.github.com/pauby/Oxygen
.PARAMETER Path
    Path to the .inf file of the drive rpackage. Note that this can use wildcards.
    So you can you c:\drivers\*.inf.

    The path will be checked and exception thrown if it does nto exist.
.PARAMETER Install
    Will install the driver package(s).
.OUTPUTS
	Output is a [bool] with true if the package was successfully add 
    (and installed) and false otherwise.
.EXAMPLE
    Add-WindowsDriverPackage -Path c:\drivers\usbcam.inf

    Adds c:\drivers\usbcam.inf driver package to the driver store.
.EXAMPLE
    Add-WindowsDriverPackage -Path c:\drivers\*.inf -Install
    
    Adds and installs all *.inf driver packages from c:\drivers
#>

function Add-WindowsDriverPackage
{
    Param
    (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateScript( { Test-Path $_ } )]
        [string]
        $Path,

        [switch]
        $Install
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