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
