$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$here = Split-Path -Parent $here
Import-Module $here\Oxygen

InModuleScope Oxygen {

    Describe "Test-ObjectProperty" {
        It "Should throw an error for invalid input" {
            { Test-ObjectProperty -InputObject $null -PropertyName "test" } | Should throw "null"
            { Test-ObjectProperty -InputObject (New-Object -TypeName PSObject) -PropertyName $null } | Should throw "null or empty"
            { Test-ObjectProperty -InputObject (New-Object -TypeName PSObject) -PropertyName "" } | Should throw "null or empty"
        }

        It "Should return `$false when the object has no properties" {
            Test-ObjectProperty -InputObject (New-Object -TypeName PSObject) -PropertyName "test" | Should Be $false
        }

        It "Should return `$false when the property is not found on the object" {
            $test = New-Object -TypeName PSObject -Property @{ "a" = 1; "b" = 2 }
            $test | Test-ObjectProperty -PropertyName "c" | Should Be $false
        }

        It "Should return `$true when the property is found on the object" {
            $test = New-Object -TypeName PSObject -Property @{ "a" = 1; "b" = 2 }
            $test | Test-ObjectProperty -PropertyName "b" | Should Be $true
        }
    }
}

Remove-Module Oxygen