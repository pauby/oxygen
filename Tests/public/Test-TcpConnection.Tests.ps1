$testEnv = Initialize-TestEnvironment

Describe 'Function Testing - Test-TcpConnection' {
    Context 'Input' {
        It 'should be true if mandatory parameters have not been changed' {
            $mandatoryParams = @( 'Server', 'Port' )
            $result = Get-FunctionParameter -Name 'Test-TcpConnection' | Where-Object { $_.Value.Attributes.Mandatory -eq $true }
            
            @($result).count | Should -Be @($mandatoryParams).Count
            [bool]($result | ForEach-Object { $mandatoryParams -contains $_.key }) | Should -Be $true  
        }

        It 'should throw for invalid data' {
            { Test-TcpConnection -Server '' -Port 1 } | Should throw 'Cannot validate argument'
            { Test-TcpConnection -Server 'dummy' -Port 69000 } | Should throw 'Cannot validate argument'
        }
    }

    Context 'Output' {
        It 'should successfully connect to external sites' {
            Test-TcpConnection -Server 'google.com' -Port 80 | Should -Be $true
            Test-TcpConnection -Server 'google.com' -Port 80, 443 | Should -Be $true
            Test-TcpConnection -Server 'google.com', 'microsoft.com' -Port 80, 443 | Should -Be $true
        }
    }
}