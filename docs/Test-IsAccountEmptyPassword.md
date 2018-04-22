---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Test-IsAccountEmptyPassword.md
schema: 2.0.0
---

# Test-IsAccountEmptyPassword

## SYNOPSIS
Checks if an account password is empty.

## SYNTAX

```
Test-IsAccountEmptyPassword [-SamAccountName] <String> [[-ComputerName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Tests whether an account password is empty / blank.

## EXAMPLES

### EXAMPLE 1
```
Test-EmptyPassword -SamAccountName 'Administrator'
```

Tests if the 'Administrator' account on the local computer has an 
empty / blank password.

### EXAMPLE 2
```
Test-EmptyPassword -SamAccountName 'Administrator' -ComputerName 'server01'
```

Tests if the 'Administrator' account on'server01' has an empty / blank 
password.

## PARAMETERS

### -ComputerName
{{Fill ComputerName Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: .
Accept pipeline input: False
Accept wildcard characters: False
```

### -SamAccountName
{{Fill SamAccountName Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: Username

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

### [boolean]

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://github.com/pauby/oxygen)
History : 1.0 - 20/04/18 - Initial release

## RELATED LINKS

[Test-IsAdmin]()

