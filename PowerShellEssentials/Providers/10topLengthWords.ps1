# $array=($text -split '[ ,:.\.\.\.\…]+').Trim() 
#     for($j=0 ;$j -lt $array.Length - 1; $j++){
#         $swap=$false
#         for($i=0;$i -lt $array.Length -1 -$j;$i++){
#             if(($array[$i]).Length -lt ($array[$i+1]).Length){
#                 $temp=$array[$i]
#                 $array[$i]=$array[$i+1]
#                 $array[$i+1]=$temp
#                 $swap=$true
#         }
#     }
#     if(-not $swap){
#         break
#     }
# }
# $array



$text=@"
A party of large Orcs, Uruk-hai, sent by Saruman, 
and other Orcs sent by Sauron and led by Grishnákh, 
attack the Fellowship. Boromir tries to protect Merry and Pippin from the Orcs, 
but they kill him and capture the two hobbits. Aragorn, 
Gimli and Legolas decide to pursue the Orcs taking Merry and Pippin to Saruman
"@

$array=($text -split '[ ,:.\.\.\.\…]+').Trim() | Sort-Object {$_.Length} -Descending
$array | Add-Content -Path ./FileToAddHere