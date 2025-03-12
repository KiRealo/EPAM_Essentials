[CmdletBinding()]
param()

# Define an unsorted list of integers
$nsrtdLst = @(22, 9, 12, 4, 1, 10, 6, 3, 7)

# Display the unsorted list
Write-Host "Unsorted List: $($nsrtdLst -join ', ')"

# Bubble Sort Algorithm
for ($i = 0; $i -lt $nsrtdLst.Length - 1; $i++) {
    for ($j = 0; $j -lt $nsrtdLst.Length - 1 - $i; $j++) {
        if ($nsrtdLst[$j] -gt $nsrtdLst[$j + 1]) {
            # Swap elements
            $temp = $nsrtdLst[$j]
            $nsrtdLst[$j] = $nsrtdLst[$j + 1]
            $nsrtdLst[$j + 1] = $temp
        }
    }

    # Display intermediate steps if -Verbose is enabled
    if ($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent) {
        Write-Verbose "$i Step List: $($nsrtdLst -join ', ')"
    }
}

# Display the final sorted list
Write-Output "Sorted List: $($nsrtdLst -join ', ')"