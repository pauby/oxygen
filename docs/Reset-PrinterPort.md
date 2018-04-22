---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Reset-PrinterPort.md
schema: 2.0.0
---

# Reset-PrinterPort

## SYNOPSIS
Resets the printer port.

## SYNTAX

```
Reset-PrinterPort [-PortName] <String> [-PrinterHostAddress] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Resets the printer port configuration by removing then adding it with the new one.

You do not need administrator privileges to use Reset-PrinterPort

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -PortName
Specifies the Name of the port to be reset.
You can get this name using Get-PrinterPort.

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

### -PrinterHostAddress
Specifies the IP address of the printer port to be added.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

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

### [boolean]
.EXAMPLE]
Reset-PrinterPort -PortName "HPLJ" -PrinterHostAddress "192.168.10.100"

Removes the printer port called HPLJ and adds it back again with the same name and IP host address of 192.168.10.100

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen https://www.github.com/pauby/oxygen
History : v1.0 - 20/04/18 - Initial

## RELATED LINKS

[Reset-Printer]()

[Reset-PrinterDriver]()

[Test-Printer]()

[Test-PrinterDriver]()

[Test-PrinterDriverStore]()

[Test-PrinterPort]()

[https://github.com/pauby/oxygen/blob/master/docs/reset-printerport.md](https://github.com/pauby/oxygen/blob/master/docs/reset-printerport.md)

