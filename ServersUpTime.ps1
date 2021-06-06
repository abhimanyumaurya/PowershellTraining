$ServerList = Get-Content "c:\temp\server.txt"

Foreach ($server in $ServerList)
{

    $computerdetails = Get-WmiObject -ComputerName $server -Class "win32_operatingsystem" -Namespace "root\cimv2" -Property * 

    $Serveruptime = Get-Host -ErrorAction stop | select @{Name='ServerNmae';e={"Localhost"}},@{Name='uptime';e={$computerdetails.lastbootuptime}}

    $Serveruptime

}