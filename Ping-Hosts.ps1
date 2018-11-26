<# This commented section is an unfinished experiment with logic on pulling in many names and breaking them up into smaller sections
$sourcefilename = "C:\Users\wayne\Documents\Scripts\filenames.txt"

$maxsize = 10

$filenumber = 1

$destfolder = "C:\Users\wayne\Documents\Scripts"

$linecount = 0

$content = get-content $sourcefilename | % { 
 Add-Content $destfolder\hosts$filenumber.txt "$_" 
  $linecount ++ 
  If ($linecount -eq $maxsize) { 
    $filenumber++ 
    $linecount = 0 
  } 
} 
#>


workflow Ping-Hosts
    {
        param
            (
                [string[]]$computers
            )
    
        foreach -parallel ($computer in $computers)
            {
                Test-NetConnection -ComputerName $computer
            }
    }

$computers = "localhost","Host2"

Ping-Hosts $computers
