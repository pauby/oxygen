---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Enable-WindowsPageFile.md
schema: 2.0.0
---

# Enable-WindowsPageFile

## SYNOPSIS
Enables the Windows pagefile.

## SYNTAX

```
Enable-WindowsPageFile [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Enables the Windows pagefile on the local computer.

## EXAMPLES

### EXAMPLE 1
```
Enable-WindowsPageFile
```

Enables the Windows page file on the local computer.

## PARAMETERS

### -Force
Force enbling the pagefile regardless of it's current state.

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
History : 1.0 - 20/04/18 - Initial release

## RELATED LINKS

[Disable-PageFile]()

[Remove-PageFile]()

