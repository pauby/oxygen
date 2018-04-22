---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Test-IsAdmin.md
schema: 2.0.0
---

# Test-IsAdmin

## SYNOPSIS
Test for elevated privileges.

## SYNTAX

```
Test-IsAdmin [<CommonParameters>]
```

## DESCRIPTION
Test if the current session has elevated privileges.

Returns true if the current session has elevated privileges and false
otherwise.

## EXAMPLES

### EXAMPLE 1
```
Test-IsAdmin
```

Tests to see if the current session has elevated privileges.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [boolean]

## NOTES
Author  : Andy Arismendi (http://stackoverflow.com/users/251123/andy-arismendi)
Project : Oxygen (https://github.com/pauby/oxygen)
History : v1.0 - 20/04/18 - Initial

Also see http://stackoverflow.com/questions/9999963/powershell-test-admin-rights-within-powershell-script

## RELATED LINKS

[Test-IsInteractiveUser]()

