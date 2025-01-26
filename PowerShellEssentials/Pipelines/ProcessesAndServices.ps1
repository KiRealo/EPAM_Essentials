$processes=[System.Diagnostics.Process]::GetProcesses() | Select-Object -First 100 | ForEach-Object {
    if($_.Id -and $_.ProcessName ){
    [PSCustomObject]@{ 
        PID= $_.Id
        ProcessName = $_.ProcessName } 
    }
}

$services=service --status-all
$servicesNewList=$services | ForEach-Object {
    $field=$_ -split '\s{2,}' | Where-Object {$_.Trim()}
    if($field[0] -match '\[ \+ \]'){
    [PSCustomObject]@{
        Service = $field[1]
        Status = $field[0]
    }
}
}


$answer=$servicesNewList | ForEach-Object {
    $serShortName=$_.Service

    $matchProc=$processes | Where-Object {$_.ProcessName -like "*$serShortName*"}
    [PSCustomObject]@{
        ServiceName = $_.Service
        Status = $_.Status
        Processes = $matchProc
        }
    
}
$hashT=@{}
$answer | ForEach-Object {
    $hashT[$_.ServiceName]=@($_.Status, $_.Processes)
}
$hashT
