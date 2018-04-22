---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Test-PrinterPort.md
schema: 2.0.0
---

# Test-PrinterPort

## SYNOPSIS
Tests if the specified printer port exists on the computer.

## SYNTAX

```
Test-PrinterPort [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
Tests if the specified printer port exists on the computer.

## EXAMPLES

### EXAMPLE 1
```
Test-PrinterPort -PortName "TestPrinter"
```

Tests whether the port named TestPrinter exisst on the computer.

## PARAMETERS

### -Name
Specifies the name of the port to test.

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

[Test-PrinterDriverStore]()

