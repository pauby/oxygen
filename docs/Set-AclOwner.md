---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Set-AclOwner.md
schema: 2.0.0
---

# Set-AclOwner

## SYNOPSIS
Set the owner of an object.

## SYNTAX

```
Set-AclOwner [-Path] <String> [-SamAccountName] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the owner of an object.
This is related to the 'Acl' group of cmdlets, hence the name.

## EXAMPLES

### EXAMPLE 1
```
Set-AclOwner -Path c:\myfile.txt -SamAccountName 'chewie'
```

Will set the account (group or user) 'chewie' to be the owner of 'c:\myfile.txt'

## PARAMETERS

### -Path
Path to set the owner of.

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

### -SamAccountName
The samAccountName to set as the object owner.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Sam, Username

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
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
History : v1.0 - 20/04/18 - Initial

## RELATED LINKS

[Add-Acl]()

[New-AclObject]()

[https://github.com/pauby/oxygen/blob/master/docs/set-aclowner.md](https://github.com/pauby/oxygen/blob/master/docs/set-aclowner.md)

