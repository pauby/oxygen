$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$here = Split-Path -Parent $here
Import-Module $here\Oxygen

InModuleScope Oxygen {

    Describe "Get-WindowsSpecialFolderPath" {

        It "Should throw for invalid data" {
            { Get-WindowsSpecialFolderPath -Name $null } | Should throw "Cannot validate argument"
            { Get-WindowsSpecialFolderPath -Name "" } | Should throw "Cannot validate argument"
        }

        It "Should throw an error for invalid names" {
            $tests = @("Luke", "Han", "Chewie")
            foreach ($test in $tests) {
                { Get-WindowsSpecialFolderPath -Name $test } | Should throw
            }
        }

        It "Should return a path to the Windows Special Folder" {
            $tests = @("Desktop", "NetworkShortcuts", "Favorites")
            foreach ($test in $tests) {
                Get-WindowsSpecialFolderPath -Name $test | Should Be ([Environment]::GetFolderPath($test))
            }
        }
    }
}

Remove-Module Oxygen