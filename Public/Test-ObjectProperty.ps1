<#
# This file is part of the Oxygen distribution (https://github.com/pauby/Oxygen).
# Copyright (c) 2016 Paul Broadwith
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#>

<#
.SYNOPSIS
    Tests an oobject for a property.
.DESCRIPTION
    Tests an object for the existence of a property.
.NOTES
	Author		: Paul Broadwith (paul@pauby.com)
	History		: 1.0 - 26/04/16 - Initial version

	Credit		: Code originally taken from http://stackoverflow.com/questions/26997511/how-can-you-test-if-an-object-has-a-specific-property (author http://stackoverflow.com/users/520612/cb)

	Notes		: Code requires PowerShell v3 - see Credit link for v2 version
.LINK
    https://www.github.com/pauby/Oxygen
.PARAMETER InputObject
    The object to be tested.
.PARAMETER PropertyName
	The property name of the object to be tested.
.INPUTS
	The object to be tested. Is of type [psobject]
.OUTPUTS
	Whether the property exists or not. Is of type [boolean]
.EXAMPLE
    (New-Object -TypeName PSObject -Property @{ test = "testing"} | Test-ObjectProperty -PropertyName "test"

    Tests the object passed on the pipeline for a property named 'test'. In this example the result is $true.
#>

function Test-ObjectProperty
{
	[CmdletBinding()]
	[OutputType([boolean])]
	Param
	(
		[Parameter(Mandatory=$true, Position=1, ValueFromPipeline=$true)]
		[ValidateNotNull()]
		[object]$InputObject,

		[Parameter(Mandatory=$true)]
		[ValidateNotNullOrEmpty()]
		[string]$PropertyName
	)

	Begin
	{
	}

	Process
	{
        # check if the object has any properties to check
        # NOTE: not entirely sure we should be using [string]::IsNullOrEmpty() here but it works whereas -eq $null doesn't
        if ([string]::IsNullOrEmpty($InputObject.PSObject.Properties)) {
            $false
        }
        else {
            [bool]($InputObject.PSobject.Properties.name -match $PropertyName)
        }
	}

	End
	{
	}
}