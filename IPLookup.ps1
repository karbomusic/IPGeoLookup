# https://ipapi.co/8.8.8.8/json/
# https://ipapi.co

# Lookup a list of IPs from a text file

Clear-Host

Function GetLocation($ip)
{
    $url = "https://ipapi.co/$ip/json/";
    $response = Invoke-RestMethod -Uri $url;
    return $response;
}

$ipList = Get-Content "ips.txt";

$GeoList = "";

foreach($ip in $ipList){
    $obj = GetLocation($ip);
    Write-Host $ip "|" $obj.city "|" $obj.region "|" $obj.country
    $GeoList += $obj.city + "|" + $obj.region + "|" + $obj.country + "\r\n";
    [System.Threading.Thread]::Sleep(5000);
}

Set-Content "GeoList.txt" $GeoList
Write-Host Complete.