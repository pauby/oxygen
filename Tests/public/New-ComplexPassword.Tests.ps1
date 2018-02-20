#Requires -Module PSBuildHelper
$ModuleName = 'Oxygen'

Set-ProjectRoot -Path $PSScriptRoot
$thisModule = Import-TestedModule -Name $ModuleName

InModuleScope $ModuleName {
    Describe 'New-ComplexPassword' {

        It "should throw for invalid data" {
            { New-O2ComplexPassword -Complexity 'ABC' } | Should throw
        }

        It "should return a complex password" {
            $pwdLen = 15
            $pwd = New-O2ComplexPassword -Length $pwdLen
            $pwd | Should -BeOfType System.String
            $pwd.Length | Should -Be $pwdLen
        }
    }
}