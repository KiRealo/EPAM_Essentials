# Получение процессов
$processes = [System.Diagnostics.Process]::GetProcesses() | ForEach-Object {
    if ($_.Id -and $_.ProcessName) {  # Убедиться, что свойства не пустые
        [PSCustomObject]@{ 
            PID = $_.Id
            ProcessName = $_.ProcessName 
        }
    }
}

# Получение сервисов
$services = systemctl list-units --type=service --no-pager | head -n 100 |
Select-Object -Skip 1 | Select-Object -SkipLast 5 | 
ForEach-Object {
    $fields = $_ -split '\s{1,}'
    if ($fields.Length -ge 5 -and $fields[1] -and $fields[4]) {  # Убедиться, что массив имеет достаточную длину
        [PSCustomObject]@{
            ServiceName = $fields[1]  
            Status      = $fields[4]  
        }
    }
}

# Ассоциация процессов с сервисами
$answer = $services | ForEach-Object {
    if ($_.ServiceName) {  # Проверка, что ServiceName существует
        $serviceNamePrefix = $_.ServiceName.Split('.')[0]
        if ($serviceNamePrefix) {  # Проверка, что Split вернул результат
            $matchProc = $processes | Where-Object {
                $_.ProcessName -like "*$serviceNamePrefix*"
            }
            [PSCustomObject]@{
                ServiceName = $_.ServiceName
                Status      = $_.Status
                Processes   = if ($matchProc) { $matchProc } else { @() }  # Пустой массив, если нет процессов
            }
        }
    }
}

# Вывод результата
$answer