class Pow {
    [int]$mnozitel1
    [int]$mnozitel2

    Pow([int]$mn1,[int]$mn2){
        $this.mnozitel1=$mn1
        $this.mnozitel2=$mn2
    }
    [int]Piw(){
        return $this.mnozitel1*$this.mnozitel2
    }
}