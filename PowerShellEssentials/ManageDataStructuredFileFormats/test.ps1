Import-Module PowerShell-yaml
$listOfShit=Get-Process | Where-Object {$_.ProcessName -match "systemd"} | Select-Object ProcessName, Id, StartTime, PM 
$listOfShit | ConvertTo-Csv | Add-Content -Path ./SysCSV.csv #CSV
$listOfShit | ConvertTo-Json | Add-Content -Path ./SysJSON.json #JSON
$xmlShit=[xml]$( $listOfShit | ConvertTo-Xml -Depth 2)
$path=Join-Path -Path (Resolve-Path ./).Path -ChildPath "SysXML.xml" 
$xmlShit.Save($path)
$hashOfShit=foreach($shit in $listOfShit){@{$listOfShit.IndexOf($shit)=@{ProcessName=$shit.ProcessName; Id=$shit.Id; StartTime=$shit.StartTime; PM=$shit.PM}}}
$pathYAML=Join-Path -Path (Resolve-Path ./).Path -ChildPath "SysYAML.yaml"
ConvertTo-Yaml -Data $hashOfShit -OutFile $pathYAML