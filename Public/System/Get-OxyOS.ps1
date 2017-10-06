function Get-OxyOS {

    Param (
        [Parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string]$ComputerName = "localhost"
    )

    Begin {}

    Process {
        try {
            $osData = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $ComputerName
        }
        catch {
            throw $Error[0]
        }

        @{
            name = $osData.Caption;
            architecture = $osData.OSArchitecture;
            platform = switch ($osData.ProductType) { 
                1 { "Workstation" }
                2 { "Domain Controller" } 
                3 { "Server" }
            }
            type = switch ($osData.OSType) { 
                18 { "Windows" } 
            }
            version = $osData.Version;
            buildnumber = $osData.BuildNumber;
         }
    }

    End {}
}