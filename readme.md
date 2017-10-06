# Oxygen

PowerShell module for automating the setup of Windows Workstations and Servers without the use of Group Policy and Active Directory.

> NOTE: The code in this module is not yet ready for prime time. It's currently a collection of code that either I've put together myself, code I've found or code I've been given. Where I've found or been given code, appropriate credit has been or will be given. Some of the functions are nothing more than wrappers for registry changes or command line executables with appropriate switches or parameters. Some of the code has no error handling, appropriate output, comments, or adhere to any standards - see the [todo](#todo) for what is and will be done. If you use any of this code, make sure you understand what it does beforehand.

# Current State

Working towards baseline.

## System Requirements

PowerShell version 4 and .NET framework 4.5 is required.

## Versioning

[Semantic versioning](http://semver.org/) will be used for x.y.z (major.minor.patch) levels;

## Changelog

See [here](changelog.md).

## Todo

### To Achieve Baseline

* [ ] Rewrite functions adhering to [standards](https://github.com/PoshCode/PowerShellPracticeAndStyle "PowerShell Best Practices"), [approved verbs](https://msdn.microsoft.com/en-us/library/ms714428.aspx) and add error handling and output;
* [ ] Add documentation for each function;
* [ ] Pester tests and PSScriptAnalyser rules (**to be decided**) for each function as appropriate;
* [ ] Create module build;