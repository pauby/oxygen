---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Test-TcpConnection.md
schema: 2.0.0
---

# Test-TcpConnection

## SYNOPSIS
Tests connection to a port on a computer.

## SYNTAX

```
Test-TcpConnection [-Server] <String[]> [-Port] <Int32[]> [[-TimeOut] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Tests connection to a port on a computer by attempting to open and then
close it.

This function is superceded in PowerShell v5+ by Test-NetConnection and
has been kept for backwards compatibility.

## EXAMPLES

### EXAMPLE 1
```
Test-TcpConnection -Server 'myserver' -Port '123'
```

Tests if a connection can be established to port '123' on 'myserver'.

### EXAMPLE 2
```
Test-TcpConnection -Server 'server01', 'server02' -Port '80', '443'
```

Tests if a connection can be established to ports 80 and 443 on server01
and server02.

## PARAMETERS

### -Port
{{Fill Port Description}}

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Server
{{Fill Server Description}}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TimeOut
{{Fill TimeOut Description}}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 2
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
Author  : Unknown - Refactored by Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://github.com/pauby/oxygen)
History : 1.0 - 21/04/18 - Initial release

## RELATED LINKS
