class SetPrint {
    [string]$str

    SetString([string]$strInput){
        $this.str=$strInput
    }

    [string]PrintString(){
        return $this.str.ToUpper()
    }

}