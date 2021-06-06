$Serverlist = Get-Content "c:\temp\servers.txt"

foreach($server in $Serverlist)
{

    $service = Get-Service -ComputerName vwp-ssdd02 | where {$_.name -eq "BITS"}
    
    Write-host $server "-" $service.Status 

}