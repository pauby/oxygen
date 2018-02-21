#Requires -Module PSBuildHelper
$ModuleName = 'Oxygen'

Set-ProjectRoot -Path $PSScriptRoot
$thisModule = Import-TestedModule -Name $ModuleName

InModuleScope $ModuleName {

    Describe "Set-Shortcut" {

        It "Should throw for invalid data" {
            { Set-Shortcut -Path "" -Target "abc" } | Should throw "Cannot validate argument"
            { Set-Shortcut -Path "$env:USERPROFILE\notepad.lnk" -Target "" } | Should throw "null or empty"
            { Set-Shortcut -Path "" -Target "" } | Should throw "Cannot validate argument"
        }

        It "Should create a shortcut" {
            $shortcut = "$env:USERPROFILE\Desktop\notepad.lnk"
            Set-Shortcut -Path $shortcut -Target "$env:SystemRoot\System32\notepad.exe" | Should Be $true
            $shortcut | Should exist
            Remove-Item $shortcut
        }
    }
}