$string=" kube-system   coredns-869cb84759-drhbg                     1/1     Running   0          4h5m"
$UnD=$string -replace '\s{2,}', ' '


Write-Output $UnD