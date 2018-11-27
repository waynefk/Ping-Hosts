$ou = "OU=Servers,DC=contoso,DC=com"
$computers = (Get-ADComputer -Filter * -SearchBase $ou).Name | Sort-Object -Property Name

workflow Ping-Hosts
    {
        param
            (
                [string[]]$computers
            )
    
        foreach -parallel ($computer in $computers)
            {
                Test-Connection -ComputerName $computer -Count 2 -Quiet
            }
    }

Ping-Hosts $computers
