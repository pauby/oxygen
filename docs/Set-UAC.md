---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Set-UAC.md
schema: 2.0.0
---

# Set-UAC

## SYNOPSIS
Enables or disables UAC.

## SYNTAX

### Enable
```
Set-UAC [-Enable] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Disable
```
Set-UAC [-Disable] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Enables or disables UAC by change the EnableLUA key in the registry at
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System.

## EXAMPLES

### EXAMPLE 1
```
Set-UAC -Enable
```

Enables UAC on the local computer.

### EXAMPLE 2
```
Set-UAC -Disable
```

Disables UAC on the local computer.

## PARAMETERS

### -Disable
{{Fill Disable Description}}

```yaml
Type: SwitchParameter
Parameter Sets: Disable
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Enable
{{Fill Enable Description}}

```yaml
Type: SwitchParameter
Parameter Sets: Enable
Aliases:

Required: False
Position: Named
Default value: False
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

### [PSCustomObject]

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://github.com/pauby/oxygen)
History : 1.0 - 21/04/18 - Initial release

## RELATED LINKS
