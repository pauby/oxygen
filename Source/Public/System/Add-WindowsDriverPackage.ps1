function Add-WindowsDriverPackage {
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
    .INPUTS
        None
    .OUTPUTS
        [boolean]
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : v1.0 - 20/04/18 - Initial
    .EXAMPLE
        Add-WindowsDriverPackage -Path c:\drivers\usbcam.inf

        Adds c:\drivers\usbcam.inf driver package to the driver store.
    .EXAMPLE
        Add-WindowsDriverPackage -Path c:\drivers\*.inf -Install
        
        Adds and installs all *.inf driver packages from c:\drivers
    .LINK
        https://github.com/pauby/oxygen/blob/master/docs/add-windowsdriverpackage.md
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
    [OutputType([boolean])]
    Param (
        # Path to the .inf file of the drive rpackage. Note that this can use wildcards.
        # So you can you c:\drivers\*.inf.
        # The path will be checked and exception thrown if it does not exist.
        [Parameter(Mandatory, Position = 0)]
        [ValidateScript( { Test-Path $_ } )]
        [string]$Path,

        # Will install the driver package(s).
        [switch]$Install
    )

    if ($Install.IsPresent) {
        Write-Verbose "Installing driver package '$Path' to the store."
        $cmd = "pnputil.exe -i -a $Path"
        $msg = 'Installing driver package and adding it to the store'
    }
    else {
        Write-Verbose "Adding driver package $Path to the store."
        $cmd = "pnputil.exe -a $Path"
        $msg = 'Adding driver package to the store'
    }

    if ($PSCmdlet.ShouldProcess($Path, $msg)) {
        $cmd | Out-Null
    }

    if ($LastExitCode -ne 0) {
        Write-Verbose "Driver package $Path failed to be added / installed."
        $false
    }
    else {
        Write-Verbose "Driver package $Path was added / installed"
    }
    
    $true
}