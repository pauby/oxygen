---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Reset-Printer.md
schema: 2.0.0
---

# Reset-Printer

## SYNOPSIS
Reset the specified printer on the local computer.

## SYNTAX

```
Reset-Printer [-Name] <String> [-DriverName] <String> [-PortName] <String> [-IPAddress] <IPAddress> [-Force]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Reset the specified printer on the local computer by removing the printer,
driver and port and adding them back.

## EXAMPLES

### EXAMPLE 1
```
Reset-Printer -Name "HP LaserJet 4" -DriverName "HP LaserJet PS" -PortName "HPLJ4" -PrinterHostAddress "192.168.10.100"
```

Resets the printer called "HP LaserJet 4", driver named "HP LaserJet PS", port "HPLJ4" with IP address 192.168.10.100 by removing the port, driver and printer and then adding them back again.

## PARAMETERS

### -DriverName
Specifies the name of the driver to reset on the local computer.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Force
Force the removal

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IPAddress
Specifies the IP address of the printer to reset on the local computer.

```yaml
Type: IPAddress
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Name
Specifies the name of the printer to reset on the local computer.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PortName
Specifies the name of the port to reset on the local computer.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
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
History : v1.0 - 20 April 2014

## RELATED LINKS

[Reset-PrinterDriver]()

[Reset-PrinterPort]()

[Test-Printer]()

[Test-PrinterDriver]()

[Test-PrinterDriverStore]()

[Test-PrinterPort]()

