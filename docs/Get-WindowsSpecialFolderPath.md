---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Get-WindowsSpecialFolderPath.md
schema: 2.0.0
---

# Get-WindowsSpecialFolderPath

## SYNOPSIS
Gets the path of a Windows special folder.

## SYNTAX

```
Get-WindowsSpecialFolderPath [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
Gets the path of a Windows special folder such as Network Shortcuts,
Desktop, etc.

This is a wrapper around \[Environment\]::GetFolderPath()

## EXAMPLES

### EXAMPLE 1
```
Get-WindowsSpecialFolderPath -Name "NetworkShortcuts"
```

Gets the network shortcuts folder path.

## PARAMETERS

### -Name
The name of the special folder.
This name must match one from the list
at https://msdn.microsoft.com/en-us/library/system.environment.specialfolder.aspx

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [string]

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://github.com/pauby/oxygen)
History : v1.0 - 20/04/18 - Initial

## RELATED LINKS
