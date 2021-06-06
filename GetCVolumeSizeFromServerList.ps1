$ServerList = Get-Content "c:\temp\server.txt"

Foreach ($server in $ServerList)
{

    $computerdetails = Get-WmiObject -ComputerName $server -Class "win32_logicaldisk" -Namespace "root\cimv2" -Property * | where {$_.deviceid -eq "C:"}

    $Serviceobj = Get-disk -ErrorAction stop | select @{Name='ServerName';e={$server}},@{Name='DiskSize';e={$computerdetails.Size}},`
    @{Name='DiskSpace';e={$computerdetails.freespace}},@{Name='DriveLetter';e={$computerdetails.deviceid}}

    $Serviceobj

}
