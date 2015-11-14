$makecert = 'C:\Program Files (x86)\Windows Kits\8.1\bin\x86\makecert.exe'
$pvk2pfx = 'C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Bin\pvk2pfx.exe'

& $makecert -n "CN=HTTPS_CORS_EXAMPLE_CA" -pe -a sha256 -len 2048 -r -cy authority -sv root.pvk root.cer

& $makecert -n "CN=localhost" -pe -a sha256 -len 2048 -iv root.pvk -ic root.cer -sky exchange -eku 1.3.6.1.5.5.7.3.1 -sv ssl.pvk ssl.cer
& $pvk2pfx -pvk ssl.pvk -spc ssl.cer -pfx ssl.pfx
