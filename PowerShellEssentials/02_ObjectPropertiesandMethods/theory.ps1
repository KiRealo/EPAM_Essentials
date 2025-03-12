class Dice {
    [int]$Max
    [int]$Min

    Dice(){
        $this.Max=6
        $this.Min=0
    }

    Dice([int]$max,[int]$min){
        $this.Max=$max
        $this.Min=$min
    }

    [int]Roll() {
        return Get-Random -Maximum $this.Max -Minimum $this.Min
    }
}