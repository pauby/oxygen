---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Set-Shortcut.md
schema: 2.0.0
---

# Set-Shortcut

## SYNOPSIS
Sets a Windows shortcut.

## SYNTAX

```
Set-Shortcut [-Path] <String> [-DestinationUri] <String> [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sets a Windows shortcut.
Do not sue this to create a network shortcut as
it will not give you the results you need.
Use Set-NetworkShoertcut
instead.

## EXAMPLES

### EXAMPLE 1
```
Set-Shortcut -Path 'c:\user\joe\desktop\notepad.lnk' -Target 'c:\windows\system32\notepad.exe'
```

Creates a shortcut to c:\windows\system32\notepad.exe on the desktop of the user 'joe'.

## PARAMETERS

### -DestinationUri
The destination of the shortcut.
This could be an application or a URL.

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
Remove the destination shortcut if it exists

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

### -Path
Path to the shortcut file.
Should end with '.lnk'.
The parent path of this must exist.
For example, if the path is c:\windows\system32\notepad.exe then c:\windows\system32 must exist.

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

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://www.github.com/pauby/oxygen)
History : v1.0 - 20/04/18 - Initial

## RELATED LINKS

[Set-NetworkShortcut]()

[https://github.com/pauby/oxygen/blob/master/docs/set-shortcut.md](https://github.com/pauby/oxygen/blob/master/docs/set-shortcut.md)

