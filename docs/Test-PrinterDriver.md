---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Test-PrinterDriver.md
schema: 2.0.0
---

# Test-PrinterDriver

## SYNOPSIS
Tests if the printer driver is present on the system.

## SYNTAX

```
Test-PrinterDriver [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
Tests if the printer driver is present on the system.

## EXAMPLES

### EXAMPLE 1
```
Test-PrinterDriver "HP LaserJet 4"
```

This would test if the printer driver 'HP LaserJet 4' was installed.

## PARAMETERS

### -Name
Printer driver name

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

[Test-PrinterDriverStore]()

[Test-PrinterPort]()

[https://github.com/pauby/oxygen/blob/master/docs/test-printerdriver.md](https://github.com/pauby/oxygen/blob/master/docs/test-printerdriver.md)

