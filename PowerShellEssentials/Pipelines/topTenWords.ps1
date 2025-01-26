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
$hashT=@{}
$splitT=$text -split '[ ,:.\.\.\.\…]+'
$splitT=$splitT.Trim()
$splitT | ForEach-Object {
    if(-not $hashT[$_]){
    foreach($word in $splitT){
        if($word -like $_){
            $hashT[$_]+=1
        }
    }
}
}
$hashT.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 10