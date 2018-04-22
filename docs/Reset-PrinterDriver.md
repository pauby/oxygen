---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Reset-PrinterDriver.md
schema: 2.0.0
---

# Reset-PrinterDriver

## SYNOPSIS
Reset the specified printer driver.

## SYNTAX

```
Reset-PrinterDriver [-Name] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Reset the specified printer driver by removing it and adding it back again.

## EXAMPLES

### EXAMPLE 1
```
Reset-PrinterDriver -Name "HP LaserJet PS"
```

Remove and add the printer driver called "HP LaserJet PS"

## PARAMETERS

### -Name
Specifies the printer driver to reset.

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

## OUTPUTS

### [boolean]

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://github.com/pauby/oxygen)
History : v1.0 - 20 April 2018

## RELATED LINKS

[Reset-Printer]()

[Reset-PrinterPort]()

[Test-Printer]()

[Test-PrinterDriver]()

[Test-PrinterDriverStore]()

[Test-PrinterPort]()

