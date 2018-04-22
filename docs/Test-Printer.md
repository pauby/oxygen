---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Test-Printer.md
schema: 2.0.0
---

# Test-Printer

## SYNOPSIS
Tests if the specified printer exists on the local computer.

## SYNTAX

```
Test-Printer [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
Tests if the specified printer exists on the local computer.

## EXAMPLES

### EXAMPLE 1
```
Test-Printer -Name "HP LaserJet 4"
```

Tests if the printer named "HP LaserJet 4" exists on the local computer.

## PARAMETERS

### -Name
Specified printer name to test.

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

[Test-PrinterDriver]()

[Test-PrinterDriverStore]()

[Test-PrinterPort]()

[https://github.com/pauby/oxygen/blob/master/docs/test-printer.md](https://github.com/pauby/oxygen/blob/master/docs/test-printer.md)

