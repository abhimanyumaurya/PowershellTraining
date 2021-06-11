$path = "C:\temp"

$ItemPath = Get-ChildItem -path "$Path" -directory -Name -Recurse

foreach($item in $itempath)
{
    

   $path1 = "$path\$Item"
   
    $acl = Get-Acl $path1
     $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("vf-root\amaurya","Modify","ObjectInherit","None","Allow")
     $acl.SetAccessRule($AccessRule)
     $acl | Set-Acl $path1

}


