$numbers=@()
$numbers+=1
$numbers+=1
Write-Output $numbers[0]

for ($i=1;$numbers[$i] -le $args[0];$i++){

        Write-Output $numbers[$i]
        $numbers+=$numbers[$i]+$numbers[$i-1]

}