---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Set-WindowsRegion.md
schema: 2.0.0
---

# Set-WindowsRegion

## SYNOPSIS
Sets the Regional Settings for Windows.

## SYNTAX

```
Set-WindowsRegion [-Path] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets the Regional Settings for Windows like you would do by going to
Control Panel -\> Regional Settings

This function is basically a wrapper around rundll32.exe.

## EXAMPLES

### EXAMPLE 1
```
Set-Region -Path c:\temp\region-uk.xml
```

Sets the regional settings to that contained in c:\temp\region-uk.xml

## PARAMETERS

### -Path
Path to the regional settings XML file.

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

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://github.com/pauby/oxygen)
History : v1.0 - 20/04/18 - Initial

## RELATED LINKS
