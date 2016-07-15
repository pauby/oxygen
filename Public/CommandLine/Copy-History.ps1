#
# As this function was not written by me no licence has been included.
#

function Copy-History
{

<#
.SYNOPSIS
    Copies a previous command to the clipboard.

.DESCRIPTION
    Copies a previous command to the clipboard. Is mean to be used by piping results of Get-History through the pipeline.

.PARAMETER CommandLine
    Specifies the text to copy to the clipboard. If the result is piped straight from Get-History command then there is no need to specify the parameter.

.EXAMPLE
     Get-History | where { $_.Id -eq 14 } | Copy-History

     Copies the the previous command, with a history Id of 14, to the clipboard.

.INPUTS
    String

.OUTPUTS
    None

.NOTES
    Author  : itsteve (https://www.reddit.com/user/itsteve) (https://www.reddit.com/r/PowerShell/comments/34xx12/functions/)
    Website : http://pauby.com
    Twitter : @pauby
#>

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$True,
            ValueFromPipelinebyPropertyName=$True)]
        [ValidateNotNullOrEmpty()]
        [string]$CommandLine
    )

    Begin {
    }

    Process {
        $CommandLine | clip
    }

    End {
    }
}