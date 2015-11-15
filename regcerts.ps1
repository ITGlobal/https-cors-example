$X509Store = [System.Security.Cryptography.X509Certificates.X509Store]
$StoreName = [System.Security.Cryptography.X509Certificates.StoreName]
$StoreLocation = [System.Security.Cryptography.X509Certificates.StoreLocation]
$OpenFlags = [System.Security.Cryptography.X509Certificates.OpenFlags]
$X509Certificate2  = [System.Security.Cryptography.X509Certificates.X509Certificate2]

$cert1 = New-Object $X509Certificate2(Join-Path $PSScriptRoot 'ssl-1\root.cer')
$cert2 = New-Object $X509Certificate2(Join-Path $PSScriptRoot 'ssl-2\root.cer')

$store = New-Object $X509Store($StoreName::Root, $StoreLocation::CurrentUser)
$store.Open($OpenFlags::ReadWrite)
$store.Add($cert1)
$store.Add($cert2)
$store.Close()
