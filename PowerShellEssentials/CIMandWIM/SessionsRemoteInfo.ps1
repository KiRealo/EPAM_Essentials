# Укажите имя удаленного компьютера
$remoteComputer = "Имя_удаленного_компьютера"

# Получаем все сессии входа
$logonSessions = Get-CimInstance -ClassName Win32_LogonSession -ComputerName $remoteComputer

# Фильтруем сессии: интерактивные (Interactive) и удаленные (RemoteInteractive)
$filteredSessions = $logonSessions | Where-Object {
    $_.LogonType -eq 2 -or $_.LogonType -eq 10
}

# Для каждой отфильтрованной сессии находим информацию о пользователе
foreach ($session in $filteredSessions) {
    # Получаем информацию о пользователе
    $account = Get-CimInstance -ClassName Win32_Account -Filter "SID='$($session.LogonId)'" -ComputerName $remoteComputer

    # Выводим информацию о сессии и пользователе
    Write-Host "Сессия: $($session.LogonId)"
    Write-Host "Тип входа: $($session.LogonType)"
    Write-Host "Пользователь: $($account.Name)"
    Write-Host "Домен: $($account.Domain)"
    Write-Host "Описание: $($account.Description)"
    Write-Host "---------------------------------------------"
}