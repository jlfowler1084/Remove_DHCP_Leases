$list = Get-DhcpServerv4Lease -ScopeId "Enter DCHP Scope ID" -ComputerName dhcpServer -AllLeases | Select-Object IPAddress -ExpandProperty IPAddress
$NewList = $list.IPAddresstoString 
    foreach ($IP in $NewList){ 
        $Online = Test-Connection -IPAddress $IP -Quiet -count 1 
        If ($Online -eq $false){ 
            Remove-DhcpServerv4Lease -IPAddress $IP -ComputerName pvbinfr-dhcp01 -Verbose
            }
        }
