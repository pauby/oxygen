---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Remove-WindowsPageFile.md
schema: 2.0.0
---

# Remove-WindowsPageFile

## SYNOPSIS
Removes the Windows PageFile.

## SYNTAX

```
Remove-WindowsPageFile [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Removes the Windows PageFile.

## EXAMPLES

### EXAMPLE 1
```
Remove-PageFile
```

Removes the Windows Pagefile on the current computer.

## PARAMETERS

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

[Enable-PageFile]()

