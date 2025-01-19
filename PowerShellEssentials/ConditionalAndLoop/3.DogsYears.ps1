$dogYears=@(0)*$args[0]
foreach($year in $dogYears){
        if ($humanYear -lt 21) {
                $humanYear+=10.5
                Write-Output $humanYear
                continue
        }
        $humanYear+=4
        Write-Output $humanYear
}
Write-Output "Human years of dog: $humanYear"
$humanYear=0