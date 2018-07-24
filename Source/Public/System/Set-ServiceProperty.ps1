function Set-ServiceProperty {
    <#
    .SYNOPSIS
    Sets the properties of a service.

    .DESCRIPTION
    Sets the properties of a service on the local computer or a remote computer.

    .EXAMPLE
    Set-ServiceProperty -Name 'abc' -ServiceCredential (Get-Credential)

    Sets the Logon Username and Password for the service 'abc' on the local computer.
    .NOTES
    Author:  Paul Broadwith (https://github.com/pauby)
    History: 1.0 - 24/07/2018 - Initial release
    #>

    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
    Param (
        # Name of the computer where the service is running.
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $ComputerName = 'localhost',  #TODO Need to put a check in here for the computer - it might not respond to a ping - maybe New-CimSession?

        # Name of the service to change.
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [ValidateScript( { Get-Service -Name $_ } )]
        [string]
        $Name,

        # New service credentials
        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [PSCredential]
        $ServiceCredential,

        # Forces the service to stop if it's running
        [switch]
        $Force
    )

    Begin {
        $errorCode = @( 'Changes Made Successfully', 'Not Supported', 'Access Denied', 'Dependent Services Running',
            'Invalid Service Control', 'Service Cannot Accept Control', 'Service Not Active', 'Service Request timeout',
            'Unknown Failure', 'Path Not Found', 'Service Already Stopped', 'Service Database Locked',
            'Service Dependency Deleted', 'Service Dependency Failure', 'Service Disabled', 'Service Logon Failed',
            'Service Marked For Deletion', 'Service No Thread', 'Status Circular Dependency', 'Status Duplicate Name',
            'Status Invalid Name', 'Status Invalid Parameter', 'Status Invalid Service Account', 'Status Service Exists',
            'Service Already Paused'
        )
    }

    Process {
        ForEach ($computer in $ComputerName) {
            # stop the service if it's running and we have the Force parameter
            $serviceStopped = $false
            if ((Get-Service -Name $Name).Status -eq 'Running' -and $Force.IsPresent) {
                if ($PSCmdlet.ShouldProcess($Name, "Stopping service")) {
                    $serviceStopped = $true
                    Stop-Service -Name $Name -Force
                    Write-Verbose "Stopped service '$Name'."
                }
            }

            if ($PSCmdlet.ShouldProcess($Name, "Changing service properties")) {
                $changeParams = @{}
                switch ($PSBoundParameters.Keys) {
                    'ServiceCredential' {
                        $changeParams.StartName = $ServiceCredential.UserName
                        $changeParams.StartPassword = $ServiceCredential.GetNetworkCredential().Password
                    }
                }

                $params = @{
                    ClassName = 'Win32_Service'
                    Filter    = "Name='$Name'"
                }

                if ($computer -ne 'localhost') {
                    $params.ComputerName = $computer
                }

                $result = Get-CimInstance @params | Invoke-CimMethod -MethodName "Change" -Arguments $changeParams
                # See https://msdn.microsoft.com/en-us/library/aa384901.aspx

                if ($result.ReturnValue -gt 0) {
                    throw "Error code '$result' changing service '$Name' - $errorCode[$result.ReturnValue]"
                }

                Write-Verbose 'Service changes made successfully.'
            }

            # Start the service again if we stopped it earlier
            if ($serviceStopped -eq $true) {
                if ($PSCmdlet.ShouldProcess($Name, "Starting service")) {
                    Start-Service -Name $Name
                    Write-Verbose "Started service '$Name' as we stopped it earlier."
                }
            }
        }
    }

    End {}
}