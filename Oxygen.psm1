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
.NOTES
    File Name	: Oxygen.psm1
    Author		: Paul Broadwith (paul@pauby.com)
	History		: 0.1 - 13/07/16 - Initial version
                  0.2 - 14/07/16 - Modified to recurse through module folders and dot source *.ps1 files but exclduing .Tests.ps1 
#>

#Requires -Version 4
Set-StrictMode -Version Latest

$functions = get-childitem *.ps1 -recurse -exclude *.tests.ps1
foreach ($function in $functions) {
    . $function
}

Export-ModuleMember -Function *