---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/New-ComplexPassword.md
schema: 2.0.0
---

# New-ComplexPassword

## SYNOPSIS
Creates a complex password.

## SYNTAX

```
New-ComplexPassword [[-Length] <Int32>] [[-Exclude] <Char[]>] [[-Complexity] <ComplexityOptions[]>]
 [<CommonParameters>]
```

## DESCRIPTION
Creates a complex password using one or more of upper case, lower case,
numbers and symbols.

## EXAMPLES

### EXAMPLE 1
```
New-ComplexPassword
```

Create a password with a length of 12 and using upper, lower, numbers and
symbols.

### EXAMPLE 2
```
New-ComplexPassword -Length 25 -Complexity Upper, Lower
```

Create a password with a length of 25 characters and using upper and lower
case characters.

### EXAMPLE 3
```
New-ComplexPassword -Exclude @('0') -Complexity Upper, Lower, Number
```

Create a password with a length of 12, using upper, lower and numbers but
excluding '0' (zero)

## PARAMETERS

### -Complexity
Create the password using these options.
Valid values are Upper, Lower, Number and Symbol.

```yaml
Type: ComplexityOptions[]
Parameter Sets: (All)
Aliases:
Accepted values: Upper, Lower, Number, Symbol

Required: False
Position: 3
Default value: @( [ComplexityOptions]::Upper, [ComplexityOptions]::Lower, [ComplexityOptions]::Number, [ComplexityOptions]::Symbol )
Accept pipeline input: False
Accept wildcard characters: False
```

### -Exclude
Characters to not include in the password.
For example you may to
choose to exclude '0' (zero) as it is visually close to 'O' (capital
oh)

```yaml
Type: Char[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Length
Length of the password to generate.
By default this is 12.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 12
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### [string]

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://github.com/pauby/oxygen)
History : v1.0 - 20/04/18 - Initial

## RELATED LINKS

[https://github.com/pauby/oxygen/blob/master/docs/new-complexpassword.md](https://github.com/pauby/oxygen/blob/master/docs/new-complexpassword.md)

