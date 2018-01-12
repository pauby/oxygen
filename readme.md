# Oxygen (O2)

PowerShell module containing useful functions for automating, configuring or managing deployed Windows operating systems and or builds.

The initial idea for this module was to allow me to provide some of the configuration functionality that Group Policy provides in an Active Directory domain **without** Active Directory.

> NOTE: The code in this module is not yet ready for prime time. It's currently a collection of code that either I've put together myself, code I've found or code I've been given. Where I've found or been given code, appropriate credit has been or will be given *where I can*. Some of the functions are nothing more than wrappers for registry changes or command line executables with appropriate switches or parameters. Some of the code has no error handling, appropriate output, comments, or adhere to any standards - see the [todo](#todo) for what is and will be done. If you use any of this code, make sure you understand what it does beforehand.

## Installing Module

* The contents of the build directory can be installed into your module path;

## Versioning

[Semantic versioning](http://semver.org/) will be used for x.y.z (major.minor.patch) levels;

## System Requirements

PowerShell version 4 and .NET framework 4.5 is required.

## Changelog

See [here](changelog.md).

## Todo

### To Achieve Baseline

* [ ] Rewrite functions adhering to [standards](https://github.com/PoshCode/PowerShellPracticeAndStyle "PowerShell Best Practices"), [approved verbs](https://msdn.microsoft.com/en-us/library/ms714428.aspx) and add error handling and output;
* [ ] Add documentation for each function - help comments, helpmessage
* [ ] Pester tests and PSScriptAnalyser rules (**to be decided**) for each function as appropriate;
* [ ] Create module build;

#### Function Todo
* [ ] Rewrite the following functions to throw / write-error rather than return $true / $false:
    * Reset-Printer
    * Reset-PrinterDriver
    * Reset-PrinterPort
    * Add-WindowsDriverPackage