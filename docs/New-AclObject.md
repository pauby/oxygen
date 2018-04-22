---
external help file: oxygen-help.xml
Module Name: oxygen
online version: https://github.com/pauby/oxygen/blob/master/docs/New-AclObject.md
schema: 2.0.0
---

# New-AclObject

## SYNOPSIS
Creates a new ACL object.

## SYNTAX

```
New-AclObject [-SamAccountName] <String> [-Permission] <FileSystemRights>
 [[-AccessControl] <AccessControlType>] [[-Inheritance] <InheritanceFlags>] [[-Propagation] <PropagationFlags>]
 [<CommonParameters>]
```

## DESCRIPTION
Creates a new ACL object for use with module -Acl* functions.

## EXAMPLES

### EXAMPLE 1
```
New-AclObject -SamAccountName 'testuser' -Permission 'Modify'
```

Creates an ACL object to Allow Modify permissions without inheritance or propogation for the samAccountName 'testuser'

## PARAMETERS

### -AccessControl
Allow or deny the access rule (see https://msdn.microsoft.com/en-us/library/w4ds5h86(v=vs.110).aspx for information).
Default is 'Allow'

```yaml
Type: AccessControlType
Parameter Sets: (All)
Aliases:
Accepted values: Allow, Deny

Required: False
Position: 3
Default value: Allow
Accept pipeline input: False
Accept wildcard characters: False
```

### -Inheritance
Inheritance rules to be applied (see https://msdn.microsoft.com/en-us/library/system.security.accesscontrol.inheritanceflags(v=vs.110).aspx for information).
Default is 'None'

```yaml
Type: InheritanceFlags
Parameter Sets: (All)
Aliases: InheritanceFlag
Accepted values: None, ContainerInherit, ObjectInherit

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Permission
Permissions / rights to be applied (see https://msdn.microsoft.com/en-us/library/system.security.accesscontrol.filesystemrights(v=vs.110).aspx for information)

```yaml
Type: FileSystemRights
Parameter Sets: (All)
Aliases: AccessRight
Accepted values: ListDirectory, ReadData, WriteData, CreateFiles, CreateDirectories, AppendData, ReadExtendedAttributes, WriteExtendedAttributes, Traverse, ExecuteFile, DeleteSubdirectoriesAndFiles, ReadAttributes, WriteAttributes, Write, Delete, ReadPermissions, Read, ReadAndExecute, Modify, ChangePermissions, TakeOwnership, Synchronize, FullControl

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Propagation
Propogation method for the rules (see https://msdn.microsoft.com/en-us/library/system.security.accesscontrol.propagationflags(v=vs.110).aspx for information).
Default is 'None'

```yaml
Type: PropagationFlags
Parameter Sets: (All)
Aliases: PropogationFlag
Accepted values: None, NoPropagateInherit, InheritOnly

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SamAccountName
samAccountName to create the object for

```yaml
Type: String
Parameter Sets: (All)
Aliases: Sam, Username

Required: True
Position: 1
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

### System.Security.Principal.NTAccount

## NOTES
Author  : Paul Broadwith (https://github.com/pauby)
Project : Oxygen (https://github.com/pauby/oxygen)
History : v1.0 - 20/04/18 - Initial

Code was created using https://technet.microsoft.com/en-us/library/ff730951.aspx as a basis.

## RELATED LINKS

[Add-Acl]()

[Set-Owner]()

[https://github.com/pauby/oxygen/blob/master/docs/new-aclobject.md](https://github.com/pauby/oxygen/blob/master/docs/new-aclobject.md)

