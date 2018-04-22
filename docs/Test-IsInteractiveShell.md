---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/Test-IsInteractiveShell.md
schema: 2.0.0
---

# Test-IsInteractiveShell

## SYNOPSIS
Tests if the current shell is noninteractive.

## SYNTAX

```
Test-IsInteractiveShell [<CommonParameters>]
```

## DESCRIPTION
First, we check \`\[Environment\]::UserInteractive\` to determine if the
shell is running interactively.
An example of not running interactively
would be if the shell is running as a service.
If we are running
interactively, we check the Command Line Arguments to see if the
\`-NonInteractive\` switch was used or an abbreviation of the switch.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### [boolean]

## NOTES
Author  : Vertigion (https://github.com/Vertigion/Test-IsNonInteractiveShell)
Project : Oxygen (https://github.com/pauby/oxygen)
History : v1.0 - 20/04/18 - Initial

## RELATED LINKS

[Get-OS]()

