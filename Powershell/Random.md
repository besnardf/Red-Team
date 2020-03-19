- Find PS in non-standard processes
```powershell
Get-Process |  Where {$_.modules -like "*System.Management.Automation*"} | Select name,id,modules | Format-List
```

- Get AD subnets
```powershell
[System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest().Sites.Subnets
```
