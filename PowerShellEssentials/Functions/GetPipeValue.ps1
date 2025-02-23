function GetPipeValue {
    process{
        Write-Output "Данный из пайпа: $_"
    }
}
7,8,9 | GetPipeValue