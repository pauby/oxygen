---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Get-OS.md
schema: 2.0.0
---

# Get-OS

## SYNOPSIS
Gets details of the operating system.

## SYNTAX

```
Get-OS [[-ComputerName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets details of the operating system.
This function is a nice wrapper
around the Get-CimInstance Win32_OperatingSystem call.
It does create a
hashtable with already determined information for the platform and type.

The format of the data returned is:

Name                Value
----                -----
version             10.0.16299 name                Microsoft Windows 10
Pro architecture        64-bit type                Windows platform
Workstation buildnumber         16299

* The 'platform' field can be 'Workstation', 'Domain Controller' or
  'Server'.
* The 'type' field will be 'Windows' or 'Unknown'.

## EXAMPLES

### EXAMPLE 1
```
Get-OS
```

Returns information about the operating system.

## PARAMETERS

### -ComputerName
Get operating system information of this computer.
Defaults to local
computer.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: .
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [hashtable]

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://github.com/pauby/oxygen)
History : 1.0 - 20/04/18 - Initial release

## RELATED LINKS

[Test-IsNonInteractiveShell]()

