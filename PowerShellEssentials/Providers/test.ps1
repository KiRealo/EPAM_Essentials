
# # Разделение текста на слова и удаление лишних символов
# $array = ($text -split '[ ,:.…]+').Trim()

# # Сортировка по длине слов (от самого длинного к самому короткому)
# $sortedArray = $array | Sort-Object { $_.Length } -Descending

# # Вывод отсортированного массива
# $sortedArray



$text=@"
In the midway of this our mortal life,
I found me in a gloomy wood, astray
Gone from the path direct: and e’en to tell
It were no easy task, how savage wild
That forest, how robust and rough its growth,
Which to remember only, my dismay
Renews, in bitterness not far from death.
Yet to discourse of what there good befell,
All else will I relate discover’d there.
How first I enter’d it I scarce can say,
Such sleepy dullness in that instant weigh’d
My senses down, when the true path I left,
But when a mountain’s foot I reach’d, where clos’d
The valley, that had pierc’d my heart with dread,
I look’d aloft, and saw his shoulders broad
Already vested with that planet’s beam,
Who leads all wanderers safe through every way.
"@

$array=($text -split '[ ,:.\.\.\.\…]+').Trim() | Sort-Object {$_.Length} -Descending
$array



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