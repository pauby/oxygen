function Test-EmptyPassword
{
    Param 
    (
        [Parameter(Mandatory=$true)]
        [string]
        $Username,
        
        [Parameter(Mandatory=$false)]
        [string]
        $Computername = "localhost"
    )
    
    $user = [ADSI]("WinNT://" + $Computername+ "/" + $Username + ", user")
    try 
    {
        $user.invoke("ChangePassword","","DummyPassword")    
    }
    catch [System.Exception] 
    {
        return $false
    }
    
    $user.invoke("ChangePassword","DummyPassword","")  
    return $true
}