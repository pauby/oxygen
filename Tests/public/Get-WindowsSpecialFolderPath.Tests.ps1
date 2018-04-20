$testEnv = Initialize-TestEnvironment

Describe 'Function Testing - Get-WindowsSpecialFolderPath' {

    Context 'Input' {
        It 'should be true if mandatory parameters have not been changed' {
            $mandatoryParams = @( 'Name' )
            $result = Get-FunctionParameter -Name 'Get-WindowsSpecialFolderPath' | Where-Object { $_.Value.Attributes.Mandatory -eq $true }
            
            @($result).count | Should -Be @($mandatoryParams).Count
            [bool]($result | ForEach-Object { $mandatoryParams -contains $_.key }) | Should -Be $true  
        }

        It "should throw for invalid data" {
            { Get-WindowsSpecialFolderPath -Name $null } | Should throw "Cannot validate argument"
            { Get-WindowsSpecialFolderPath -Name "" } | Should throw "Cannot validate argument"
        }

        It "should throw an error for invalid names" {
            $tests = @("Luke", "Han", "Chewie")
            foreach ($test in $tests) {
                { Get-WindowsSpecialFolderPath -Name $test } | Should throw
            }
        }
    }

    Context 'Output' {
        It "should return a path to the Windows Special Folder" {
            $tests = @("Desktop", "NetworkShortcuts", "Favorites")
            foreach ($test in $tests) {
                Get-WindowsSpecialFolderPath -Name $test | Should Be ([Environment]::GetFolderPath($test))
            }
        }
    }
}