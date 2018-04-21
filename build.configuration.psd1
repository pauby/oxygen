@{
    Dependency = @(
        @{  Name    = 'PowerShellGet'
            Type    = 'module'
            Version = 'latest'
        },
        @{  Name    = 'platyPS'
            Type    = 'module'
            Version = 'latest'
        },
        @{  Name    = 'PSCodeHealth'
            Type    = 'module'
            Version = 'latest'
        },
        @{  Name    = 'pandoc'
            Type    = 'Chocolatey'
            Version = 'latest'
        },
        @{  Name    = '7Zip'
            Type    = 'Chocolatey'
            Version = 'latest'
        }
    )

    Testing = @{
        CodeCoverageThreshold = 0.2
    }

    ModuleScript = @{
        Header = "Set-StrictMode -Version Latest"
    }
}