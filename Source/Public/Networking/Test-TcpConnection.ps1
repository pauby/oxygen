Function Test-TcpConnection {
    <#
    .SYNOPSIS
        Tests connection to a port on a computer.
    .DESCRIPTION
        Tests connection to a port on a computer by attempting to open and then
        close it.

        This function is superceded in PowerShell v5+ by Test-NetConnection and
        has been kept for backwards compatibility.
    .EXAMPLE
        Test-TcpConnection -Server 'myserver' -Port '123'

        Tests if a connection can be established to port '123' on 'myserver'.
    .EXAMPLE
        Test-TcpConnection -Server 'server01', 'server02' -Port '80', '443'

        Tests if a connection can be established to ports 80 and 443 on server01
        and server02.
    .INPUTS
        None
    .OUTPUTS
        [boolean]
    .NOTES
        Author  : Unknown - Refactored by Paul Broadwith (https://github.com/pauby)
        Project : Oxygen (https://github.com/pauby/oxygen)
        History : 1.0 - 21/04/18 - Initial release
    .LINK
        https://github.com/pauby/oxygen/blob/master/docs/test-tcpconnection.md
    #>
    [CmdletBinding()]
    [OutputType([boolean])]
    param (
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Server,

        [Parameter(Mandatory, Position = 1)]
        [ValidateRange(0, 65535)]
        [int[]]
        $Port,

        [Parameter(Position = 2)]
        [int]
        $TimeOut = 2
    )

    $timeoutMs = $TimeOut * 1000

    ForEach ($s in $Server) {
        ForEach ($p in $Port) {
            $ip = [System.Net.Dns]::GetHostAddresses($s)
            $address = [System.Net.IPAddress]::Parse($ip[0])
            $socket = New-Object System.Net.Sockets.TCPClient

            Write-Verbose "Connecting to '$address' on port '$p'"
            try {
                $connect = $socket.BeginConnect($address, $p, $null, $null)
            }
            catch {
                Write-Warning "'$s' is not responding on port '$p'"
                return $false
            }

            Start-Sleep -Seconds $TimeOut

            if ($connect.IsCompleted) {
                $wait = $connect.AsyncWaitHandle.WaitOne($timeoutMs, $false)
                if (!$wait) {
                    $socket.Close()
                    Write-Warning "'$s' is not responding on port '$p'"
                    return $false
                }
                else {
                    try {
                        $socket.EndConnect($connect)
                        Write-Verbose "'$s' is responding on port '$p'"
                        return $true
                    }
                    catch { 
                        Write-Warning "'$s' is not responding on port '$p'" 
                    }
                    $socket.Close()
                    return $false
                }
            }
            else {
                Write-Warning "'$s' is not responding on port '$p'"
                return $false
            }
        } #end ForEach $Port
    } #end ForEach $Server
}