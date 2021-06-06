$Serverlist = Get-Content "c:\temp\servers.txt"

foreach($server in $Serverlist)
{

    $service = Get-Service -ComputerName $server | where {$_.name -eq "BITS"}

    if ($service.Status -eq "Stopped")
    {
        $service.Start()
    }

    else
    {
        Write-host "Service is already Started"
    }
    
}