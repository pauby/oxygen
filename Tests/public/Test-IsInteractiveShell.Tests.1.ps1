$testEnv = Initialize-TestEnvironment

Describe 'Function Testing - Test-IsInteractiveShell' {

    Context 'Output' {
        It "should pass for this shell" {
            Test-IsInteractiveShell | Should -Be ([Environment]::UserInteractive)
        }
    }
}