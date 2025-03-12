class rever{
    [string]$string

    [string]Reverse([string]$str){
        $this.string=$str
        $arr=$this.string.ToCharArray()
        [array]::Reverse($arr)
        $str=-join $arr
        return $str
    }
}