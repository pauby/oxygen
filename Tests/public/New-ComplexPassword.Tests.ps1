$testEnv = Initialize-TestEnvironment

Describe 'Function Testing - New-ComplexPassword' {
    Context 'Input' {
        It "should throw for invalid data" {
            { New-ComplexPassword -Complexity 'ABC' } | Should throw
        }
    }

    Context 'Output' {
        It "should return a complex password" {
            $pwdLen = 15
            $pwd = New-ComplexPassword -Length $pwdLen
            $pwd | Should -BeOfType System.String
            $pwd.Length | Should -Be $pwdLen
        }
    }
}