[CmdletBinding()]
param()

$nsrtdLst=@(22,9,12,4,1,10,6,3,7)
Write-Output "Unsorted list: $nsrtdLst"

for($i=0;$i -lt $nsrtdLst.Length-1;$i++){
    for($j=0;$j -lt $nsrtdLst.Length -1 -$i;$j++){
        if($nsrtdLst[$j] -gt $nsrtdLst[$j+1]){
            $temp=$nsrtdLst[$j]
            $nsrtdLst[$j]=$nsrtdLst[$j+1]
            $nsrtdLst[$j+1]=$temp
        }
    }
    Write-Verbose "$i Step List: $nsrtdLst" 
}
Write-Output "Sorted list: $nsrtdLst"