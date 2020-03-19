# https://techibee.com/active-directory/powershell-get-active-directory-sites-and-subnets-list/1412

[cmdletbinding()]            
param()            

$Sites = [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest().Sites            

foreach ($Site in $Sites) {            

 $obj = New-Object -Type PSObject -Property (            
  @{            
   "SiteName"  = $site.Name;            
   "SubNets" = $site.Subnets;            
   "Servers" = $Site.Servers            
  }            
 )            

 $Obj            
}
