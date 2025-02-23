function SortBySize {
  
    [CmdletBinding()]
    param (
        [string]$path
    )
    
    process {
        Get-ChildItem $path -File | Sort-Object Length -Descending | Select-Object Name, Length
    }
    

}
SortBySize /home/kirjuha/Documents