Import-Module PowerShell-yaml
$CSVshit=Get-Content -Path ./SysCSV.csv | ConvertFrom-Csv
$csvHASHshit=foreach($shit in $CSVshit){@{$shit.Id=@{ProcessName=$shit.ProcessName; Id=$shit.Id; StartTime=$shit.StartTime; PM=$shit.PM}}}

$JSONshit=Get-Content -Path ./SysJSON.json | ConvertFrom-Json
$jsonHASHshit=foreach($shit in $JSONshit){@{$shit.Id=@{ProcessName=$shit.ProcessName;StartTime=$shit.StartTime; PM=$shit.PM}}}

$XMLshit=New-Object System.Xml.XmlDocument
$XMLpath=Join-Path -Path (Resolve-Path ./).Path -ChildPath "./SysXML.xml"
$XMLshit.Load($XMLpath)


$YAMLshit= ConvertFrom-Yaml -Yaml $($(Get-Content ./SysYAML.yaml) -join "`n")
# Get-Content ./SysYAML.yaml -Raw | ConvertFrom-Yaml
$YAMLshit