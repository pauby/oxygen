---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Add-WindowsDriverPackage.md
schema: 2.0.0
---

# Add-WindowsDriverPackage

## SYNOPSIS
Adds a Windows driver to the driver store.

## SYNTAX

```
Add-WindowsDriverPackage [-Path] <String> [-Install] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function is a wrapper for the pnputil.exe program.
It adds a Windows
driver to the driver store by passing the .inf file.
$_

Using the -Install switch will also install install the driver package(s) too.

The functions' return value is dependent on the errorlevel from 
pnputil.exe.
If the errorlevel is 0 then this indicates successfully
and true is returned, otherwise false is returned.

## EXAMPLES

### EXAMPLE 1
```
Add-WindowsDriverPackage -Path c:\drivers\usbcam.inf
```

Adds c:\drivers\usbcam.inf driver package to the driver store.

### EXAMPLE 2
```
Add-WindowsDriverPackage -Path c:\drivers\*.inf -Install
```

Adds and installs all *.inf driver packages from c:\drivers

## PARAMETERS

### -Install
Will install the driver package(s).

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
Path to the .inf file of the drive rpackage.
Note that this can use wildcards.
So you can you c:\drivers\*.inf.
The path will be checked and exception thrown if it does not exist.

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

### None

## OUTPUTS

### [boolean]

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://github.com/pauby/oxygen)
History : v1.0 - 20/04/18 - Initial

## RELATED LINKS

[https://github.com/pauby/oxygen/blob/master/docs/add-windowsdriverpackage.md](https://github.com/pauby/oxygen/blob/master/docs/add-windowsdriverpackage.md)

