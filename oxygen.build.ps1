# This is taken directory from Invoke-Build .build.ps1 at https://github.com/nightroman/Invoke-Build/blob/master/.build.ps1
# will use this as a starting point
<#
.Synopsis
	Build script (https://github.com/pauby/PsTodoTxt)

.Description
	TASKS AND REQUIREMENTS
    Run tests
    Clean the project directory
#>

# Build script parameters are standard parameters
param(
    [switch]$NoTestDiff
)

# Ensure Invoke-Build works in the most strict mode.
Set-StrictMode -Version Latest

# Project variables
$BuildOptions = @{
    ModuleName          = 'Oxygen'
    PSGalleryApiKey     = $env:PSGALLERY_API_KEY
    BuildPath           = "$BuildRoot\build"
    SourcePath          = "$BuildRoot\source"
    TestsPath           = "$BuildRoot\tests"
    ModuleLoadPath      = "$($env:mysyncroot)\Coding\PowerShell\Modules"
}

$ManifestOptions = @{
    RootModule          = "$($BuildOptions.ModuleName).psm1"
    Author              = 'Paul Broadwith'
    CompanyName         = 'Paul Broadwith'
    Copyright           = "(c) 2017-$((Get-Date).Year) Paul Broadwith"
    Description         = 'Windows Management'
    PowerShellVersion   = '3.0'
    FormatsToProcess    = ''
#    FunctionsToExport   = (Get-ChildItem (Join-Path $BuildOptions.SourcePath -ChildPath "public\*.ps1") -Recurse).BaseName
    Tags                = 'Windows', 'GroupPolicy', 'Management', 'Automation', 'Configuration'
    ProjectUri          = "https://github.com/pauby/$($BuildOptions.Modulename)"
    LicenseUri          = "https://github.com/pauby/$($BuildOptions.Modulename)/blob/master/LICENSE"
    ReleaseNotes        = "https://github.com/pauby/$($BuildOptions.Modulename)/blob/master/CHANGELOG.md"
}

. .\build.ps1