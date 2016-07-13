$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$here = Split-Path -Parent $here
Import-Module $here\Oxygen

InModuleScope Oxygen {

    Describe "Test-WindowsSpecialFolderName" {
        It "Should throw for invalid data" {
            { Test-WindowsSpecialFolderName -Name $null } | Should throw "argument is null or empty"
            { Test-WindowsSpecialFolderName -Name "" } | Should throw "argument is null or empty"
        }
        It "Should return `$false for invalid names" {
            $tests = @("Luke", "Han", "Chewie")
            $tests | Test-WindowsSpecialFolderName | Should Be $false
        }

        It "Should return `$true for valid names" {
            $tests = @("Desktop", "NetworkShortcuts", "Favorites")
            foreach ($test in $tests) {
                Test-WindowsSpecialFolderName -Name $test | Should Be $true
            }
        }
    }
}

Remove-Module Oxygen