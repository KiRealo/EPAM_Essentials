function DeleteIfMoreThan {
    [CmdletBinding()]
    param (
        [parameter(Mandatory)]
        [int]$sizeBorder,

        [Parameter(Mandatory)]
        [string]$path
    )
    
    process {
        Get-ChildItem $path -File | ForEach-Object{
            $filePath=$_.FullName
            if($_.Length -gt $sizeBorder*1KB){Write-Output -Path $filePath} # Remove-item
        }
    }
}
DeleteIfMoreThan -sizeBorder 300 -path /home/kirjuha/Documents