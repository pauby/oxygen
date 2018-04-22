$testEnv = Initialize-TestEnvironment

Describe 'Function Testing - Set-UAC' {

    Context 'Input' {
        It "should throw for invalid data" {
            { Set-UAC } | Should throw 'Parameter set cannot be resolved'
            { Set-UAC -Enable -Disable } | Should throw 'Parameter set cannot be resolved'
        }
    }

    Context 'Logic & Flow' {
        It "should call on 'New-ItemProperty'" {
            Mock New-ItemProperty -MockWith { return } -ModuleName $testEnv.ModuleName

            Set-UAC -Enable
            Assert-MockCalled -CommandName 'New-ItemProperty' -Times 1 -ModuleName $testEnv.ModuleName

            Set-UAC -Disable
            Assert-MockCalled -CommandName 'New-ItemProperty' -Times 1 -ModuleName $testEnv.ModuleName
        }
    }
}