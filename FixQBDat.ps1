#lang: powershell 
#created: 2-11-2021
#written by: Adam Terrell 
#contact: aterrell@vertisys.com
$DATPath = "C:\temp\qbregistration.dat"
$QBRegistrationOriginal = Get-Content -path $DATPath -raw 
$QBFind = @("pro","superpro","bel","belacct")
$QBReplace = "accountant"
foreach ($QBFindVal in $QBFind) {
    if($QBRegistrationOriginal -match "\b$QBFindVal\b") {
        write-host -ForegroundColor Green "Found Instance of $QBFindVal To Replace"
$QBRegistrationReplaced = $QBRegistrationOriginal -replace "\b$QBFindVal\b", $QBReplace
Set-Content -Path $DATPath -Value $QBRegistrationReplaced
    }
    else {
        write-host -ForegroundColor Green "No Instances of $QBFindVal Found"
    }
}
