# < PS 5 compatibility
Add-Type -TypeDefinition @"
        public enum ComplexityOptions
        {
            Upper,
            Lower,
            Number,
            Symbol
        }
"@
function New-ComplexPassword {
    <#
    .SYNOPSIS
        Creates a complex password.
    .DESCRIPTION
        Creates a complex password using one or more of upper case, lower case,
        numbers and symbols.
    .OUTPUTS
        [string]
    .EXAMPLE
        New-ComplexPassword

        Create a password with a length of 12 and using upper, lower, numbers and
        symbols.
    .EXAMPLE
        New-ComplexPassword -Length 25 -Complexity Upper, Lower

        Create a password with a length of 25 characters and using upper and lower
        case characters.
    .EXAMPLE
        New-ComplexPassword -Exclude @('0') -Complexity Upper, Lower, Number

        Create a password with a length of 12, using upper, lower and numbers but
        excluding '0' (zero)
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : v1.0 - 20/04/18 - Initial
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '', Justification = 'No state is being changed')]
    [OutputType([string])]
    Param (
        # Length of the password to generate. By default this is 12.
        [ValidateRange(1, 999)]
        [Int]$Length = 12,

        # Characters to not include in the password. For example you may to
        # choose to exclude '0' (zero) as it is visually close to 'O' (capital
        # oh)
        [Char[]]$Exclude,

        # Create the password using these options. Valid values are Upper, Lower, Number and Symbol.
        [ComplexityOptions[]]$Complexity = @(
            [ComplexityOptions]::Upper,
            [ComplexityOptions]::Lower,
            [ComplexityOptions]::Number,
            [ComplexityOptions]::Symbol
        )
    )

    # initialise the pool of characters to create password from
    $pool = ''
    switch ($Complexity) {
        'Upper' {
            # uppercase chars 'A' to 'Z'
            Write-Verbose "Using upper case characters A-Z"
            $pool += (65..90 | ForEach-Object { [char]$_ }) -join ''
            continue
        }
        'Lower' {
            # lowercase chars 'a' to 'z'
            Write-Verbose "Using lower case characters a-z"
            $pool += (97..122 | ForEach-Object { [char]$_ }) -join ''
            continue
        }
        'Number' {
            # integers 0 to 9
            Write-Verbose "Using numbers 0-9"
            $pool += (0..9 | ForEach-Object { $_ }) -join ''
            continue
        }
        'Symbol' {
            Write-Verbose "Using symbols"
            $pool += '!"#$%&''()*+,-./:;<=>?@[\]^_`{|}~'
        }
    }   # end Switch

    # initialize the password
    $pwd = ''
    while ($pwd.Length -lt $Length) {
        # randomly generate the index of which pool character to use
        $index = Get-Random -Maximum $pool.Length

        # check that the character chosen is not on the exclude list
        if ($Exclude -cnotcontains $pool[$index]) {
            $pwd += $pool[$index]
        }
        else {
            Write-Verbose "Skipped $($pool[$index])"
        }
    }

    $pwd
}