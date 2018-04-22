---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Set-NetworkShortcut.md
schema: 2.0.0
---

# Set-NetworkShortcut

## SYNOPSIS
Creates or replaces a network shortcut.

## SYNTAX

```
Set-NetworkShortcut [-Name] <String> [-DestinationUri] <String> [[-Username] <String>] [[-Icon] <Int32>]
 [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Creates or replaces a network shortcut.

## EXAMPLES

### EXAMPLE 1
```
Set-NetworkShortcut -Name 'MyShare' -DestinationUri '\\myserver\share'
```

Creates a network shortcut called 'MyShare' pointing to '\\\\myserver\share'.

### EXAMPLE 2
```
Set-NetworkShortcut -Name 'MyShare' -DestinationUri '\\myserver\share' -Icon 304
```

Creates a network shortcut called 'MyShare' pointing to '\\\\myserver\share' with icon number 304.

## PARAMETERS

### -DestinationUri
The destination URI for the shortcut.

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
{{Fill Force Description}}

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

### -Icon
Number of the icon to use.
By default this is 275.
Find more icons http://help4windows.com/windows_7_shell32_dll.shtml

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 275
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Display name of the short to be created.

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

### -Username
Username to set the shortcut for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: $env:USERNAME
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

### [PSObject]

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://github.com/pauby/oxygen)
History : 1.0 - 20/04/18 - Initial release

## RELATED LINKS

[Set-Shortcut]()

[https://github.com/pauby/oxygen/blob/master/docs/set-networkshortcut.md](https://github.com/pauby/oxygen/blob/master/docs/set-networkshortcut.md)

