$filePath="/home/kirjuha/Documents"
 
# get-Process -name "chrome" | Select-Object -Property Name, ID, CPU, @{label="Memory(MB)"; expression={$_.PagedMemorySize/1024/1024/8}} | Format-Table

Get-ChildItem -Path $filePath | Select-Object -Property UnixMode, User, Group, LastWriteTime, @{label="Size(MB)";expression={$_.Length/1024/1024}}, Name | Format-Table