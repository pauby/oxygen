---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Add-Acl.md
schema: 2.0.0
---

# Add-Acl

## SYNOPSIS
Set an ace on an object.

## SYNTAX

```
Add-Acl [-Path] <String> [-AceObject] <FileSystemAccessRule> [<CommonParameters>]
```

## DESCRIPTION
Set an ace, created using New-Acl, on an object.

## EXAMPLES

### EXAMPLE 1
```
Add-Acl -Path 'C:\Windows\Notepad.exe' -AceObject $aceObj
```

Adds the access control entry object, $aceObj created using New-Acl, to 'C:\Windows\Notepad.exe'

## PARAMETERS

### -AceObject
Ace / Acl to set.
Create this using New-Acl.

```yaml
Type: FileSystemAccessRule
Parameter Sets: (All)
Aliases: Acl, AclObject

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Path to the object to set the acl on.

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

### None

## OUTPUTS

### System.Security.AccessControl.FileSecurity

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://github.com/pauby/oxygen)
History : v1.0 - 22/04/18 - Initial

Code was created using https://technet.microsoft.com/en-us/library/ff730951.aspx as a basis.

## RELATED LINKS

[New-AclObject]()

[Set-Owner]()

[https://github.com/pauby/oxygen/blob/master/docs/add-acl.md](https://github.com/pauby/oxygen/blob/master/docs/add-acl.md)

