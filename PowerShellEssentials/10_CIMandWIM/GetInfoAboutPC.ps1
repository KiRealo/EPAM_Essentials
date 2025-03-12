# Укажите имя удаленного компьютера
$remoteComputer = "Имя_удаленного_компьютера"

# Получение информации о процессоре
$cpuInfo = Get-WmiObject -Class Win32_Processor -ComputerName $remoteComputer
$cpuModel = $cpuInfo.Name
$cpuMaxClockSpeed = ($cpuInfo.MaxClockSpeed / 1000) # Преобразуем в GHz

# Получение информации о RAM
$memoryInfo = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $remoteComputer
$totalRAM = [math]::round($memoryInfo.TotalVisibleMemorySize / 1MB, 2) # Преобразуем в GB
$freeRAM = [math]::round($memoryInfo.FreePhysicalMemory / 1MB, 2) # Преобразуем в GB

# Получение информации о свободном месте на диске
$diskInfo = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'" -ComputerName $remoteComputer
$freeDiskSpace = [math]::round($diskInfo.FreeSpace / 1GB, 2) # Преобразуем в GB

# Получение информации о версии ОС
$osInfo = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $remoteComputer
$osVersion = $osInfo.Version

# Получение списка установленных обновлений (hot fixes)
$hotFixes = Get-WmiObject -Class Win32_QuickFixEngineering -ComputerName $remoteComputer | Select-Object -Property HotFixID

# Получение списка остановленных служб
$stoppedServices = Get-WmiObject -Class Win32_Service -ComputerName $remoteComputer -Filter "State='Stopped'" | Select-Object -Property Name, DisplayName

# Вывод собранных данных
Write-Host "Информация о системе на компьютере: $remoteComputer"
Write-Host "---------------------------------------------"
Write-Host "Модель процессора: $cpuModel"
Write-Host "Максимальная тактовая частота процессора: $cpuMaxClockSpeed GHz"
Write-Host "Общий объем RAM: $totalRAM GB"
Write-Host "Свободный объем RAM: $freeRAM GB"
Write-Host "Свободное место на диске C: $freeDiskSpace GB"
Write-Host "Версия ОС: $osVersion"
Write-Host "Установленные обновления (Hot Fixes):"
$hotFixes | ForEach-Object { Write-Host $_.HotFixID }
Write-Host "Остановленные службы:"
$stoppedServices | ForEach-Object { Write-Host "$($_.Name) - $($_.DisplayName)" }