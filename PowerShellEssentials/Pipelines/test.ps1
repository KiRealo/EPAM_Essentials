$processes=[System.Diagnostics.Process]::GetProcesses() | Select-Object -First 100 | ForEach-Object {
    if($_.Id -and $_.ProcessName ){
    [PSCustomObject]@{ 
        PID= $_.Id
        ProcessName = $_.ProcessName } 
    }
}


$services = systemctl list-units --type=service --no-pager | head -n 100 |
Select-Object -Skip 1 | Select-Object -SkipLast 5 | 
ForEach-Object {
        $fields = $_ -split '\s{1,}'
        if($fields[1] -and $fields[4]){
        
        [PSCustomObject]@{
                ServiceName = $fields[1]  
                Status      = $fields[4]  
            }
        }
        
}


$answer=$services | ForEach-Object {
    $serShortName=$_.ServiceName.Split('.')[0]
    if ($serShortName){
    $matchProc=$processes | Where-Object {$_.ProcessName -like "*$serShortName*"}
    [PSCustomObject]@{
        ServiceName = $_.ServiceName
        Status = $_.Status
        Processes = $matchProc
        }
    }
}

# $services[1].ServiceName.Split('.')[0]
$testProcAcpid = $processes | ForEach-Object {
    if($_.ProcessName -like "*acpid*"){
        Write-Output $_
    }
}
$servicesNew=service --status-all
$servicesNewList=$servicesNew | ForEach-Object {
    $_ -split '\s{2,}' 
}
$servicesNewList[3]