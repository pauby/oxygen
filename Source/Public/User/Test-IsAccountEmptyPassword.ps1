function Test-IsAccountEmptyPassword {
    <#
    .SYNOPSIS
        Checks if an account password is empty.
    .DESCRIPTION
        Tests whether an account password is empty / blank.
    .EXAMPLE
        Test-EmptyPassword -SamAccountName 'Administrator'

        Tests if the 'Administrator' account on the local computer has an 
        empty / blank password.
    .EXAMPLE
        Test-EmptyPassword -SamAccountName 'Administrator' -ComputerName 'server01'

        Tests if the 'Administrator' account on'server01' has an empty / blank 
        password.
    .INPUTS
        None
    .OUTPUTS
        [boolean]
    .NOTES
        Author  : Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : 1.0 - 20/04/18 - Initial release
    .LINK
        Test-IsAdmin
    .LINK
        https://github.com/pauby/oxygen/blob/master/docs/test-isaccountemptypassword.md
    #>
    [CmdletBinding()]
    [OutputType([boolean])]
    Param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [Alias('Username')]
        [string]
        $SamAccountName,
        
        [ValidateNotNullOrEmpty()]
        [string]
        $ComputerName = '.'
    )
    
    $user = [ADSI]("WinNT://$Computername/$SamAccountName, user")
    try {
        $user.invoke("ChangePassword", "", "DummyPassword")    
    }
    catch {
        return $false
    }
    
    $user.invoke("ChangePassword", "DummyPassword", "")  
    $true
}