$testEnv = Initialize-TestEnvironment

Describe 'Function Testing - Set-Shortcut' {
    Context 'Input' {
        It 'should be true if mandatory parameters have not been changed' {
            $mandatoryParams = @( 'Path', 'DestinationUri' )
            $result = Get-FunctionParameter -Name 'Set-Shortcut' | Where-Object { $_.Value.Attributes.Mandatory -eq $true }
            
            @($result).count | Should -Be @($mandatoryParams).Count
            [bool]($result | ForEach-Object { $mandatoryParams -contains $_.key }) | Should -Be $true  
        }

        It 'should throw for invalid data' {
            { Set-Shortcut -Path '' -DestinationUri 'abc' } | Should throw 'Cannot validate argument'
            { Set-Shortcut -Path "$env:USERPROFILE\notepad.lnk" -DestinationUri '' } | Should throw 'null or empty'
            { Set-Shortcut -Path '' -DestinationUri '' } | Should throw 'Cannot validate argument'
        }
    }

    Context 'Output' {
        It 'should create a shortcut' {
            $shortcut = "$env:USERPROFILE\Desktop\notepad.lnk"
            Set-Shortcut -Path $shortcut -DestinationUri "$env:SystemRoot\System32\notepad.exe" | Should Be $true
            $shortcut | Should exist
            Remove-Item $shortcut
        }
    }
}