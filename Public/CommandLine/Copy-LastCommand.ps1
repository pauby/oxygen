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

function Copy-LastCommand
{

<#
.SYNOPSIS
    Copies last command to the clipboard.

.DESCRIPTION
    Copies to the clipboatd the last command entered on the commnad line.

.EXAMPLE
     Copy-LastCommand

.INPUTS
    None

.OUTPUTS
    None

.NOTES
    Author  : itsteve (https://www.reddit.com/user/itsteve) (https://www.reddit.com/r/PowerShell/comments/34xx12/functions/)
    Website : http://pauby.com
    Twitter : @pauby
#>

    Get-History | Select -Last 1 | Select -ExpandProperty CommandLine | clip
}