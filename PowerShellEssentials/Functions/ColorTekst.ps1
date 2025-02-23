function Funjka {
    param (
        [string]$inpStr,
        [switch]$red,
        [switch]$blue,
        [switch]$green
    )
    if($red){
        Write-Host $inpStr -ForegroundColor Red
    }
    elseif($blue){
        Write-Host $inpStr -ForegroundColor Blue
    }
    elseif($green){
        Write-Host $inpStr -ForegroundColor Green
    }
}