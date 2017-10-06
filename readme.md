# Oxygen

PowerShell module containing useful functions to work with Windows for automating builds or manage your Windows workstations or servers. The goal is to provide *some* of the functionality of Group Policy without the overhead of Active Directory.

Replicating the functionality of Group Policy is a very tall order but it's not the goal of this project. The goal is to provide *some* of the functionality of group policy on end devices in an easy and simple way.

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