---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Test-PrinterDriverStore.md
schema: 2.0.0
---

# Test-PrinterDriverStore

## SYNOPSIS
Test if the specified printer driver exists in the printer driver store.

## SYNTAX

```
Test-PrinterDriverStore [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
Test if the specified printer driver exists in the printer driver store.

## EXAMPLES

### EXAMPLE 1
```
Test-PrinterDriverStore -Name "HP LaserJet PS"
```

Tests if the printer driver named "HP LaserJet PS" exists in the printer driver store.

## PARAMETERS

### -Name
Specifies the name of the printer driver to test.

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

### [boolean]

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://www.github.com/pauby/oxygen)
History : v1.0 - 20/04/18 - Initial

## RELATED LINKS

[Reset-Printer]()

[Reset-PrinterDriver]()

[Reset-PrinterPort]()

[Test-Printer]()

[Test-PrinterDriver]()

[Test-PrinterPort]()

[https://github.com/pauby/oxygen/blob/master/docs/test-printerdriverstore.md](https://github.com/pauby/oxygen/blob/master/docs/test-printerdriverstore.md)

