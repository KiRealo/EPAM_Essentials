[string[]]$array=@(("0","1","2"),("a","b","c"),("x","y","z"))

2.
> $arrayHash=@(@{"lol" = "laugh of laugh"; "rofl" = "hz"},@{"102.7" = "MixFm" ; "100" = "pikFm"}, @{"wmata" = "trapka"})

$arrayHash[0]["lol"]

3

$arrayHash=@{"fun"=@{"lol" = "laugh of laugh"; "rofl" = "hz"};"fm"=@{"102.7" = "MixFm" ; "100" = "pikFm"};"pl"= @{"wmata" = "trapka"}}

4

$hashTable.getEnumerator() | Sort-Object Value
