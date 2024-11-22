
$passwords = @("W9fpaajW", "yFs6mMcT", "jFA9sxpp", "RmvD1z6f", "8UADjeUy", "EvIKiw4k", "8stTQoMx", "qV0qRwrY", "Y6yIZ1N7", "ZKZ31ndr", "yc7NEDyM", "o3k22VRB", "32tQvbIb", "VNz84bFV", "v0A0l4Pf", "rF7f5z2l", "OzYj7NvD", "O79OyroU", "CS2wAPqo", "GifZ92YM", "iO2ClVz9", "wm9VJr9B", "2ZYbI24F", "oH2tEhOM", "pp9vdpYH", "HlhdSOs3", "Z7qUs81I", "H3C2quKA", "nQ67EkBZ", "J1Om6Zfi", "3fLJjYyG", "A6yYyi0O", "Y5IpEZcS", "fHyvTD54", "swYb11aG", "d7f2X04V", "IagVlC51", "35XJQ0Kv", "8pirEvPy", "ENP3nr6r")
$randNum = Get-Random -Maximum 40
$users = Get-LocalUser
$domainUsers = Get-ADUser -Filter * | Select-Object Name, SamAccountName

$password = $passwords[$randNum]

foreach($user in $users) {
    Set-ADAccountPassword -Identity $user -NewPassword $password
}

foreach($user in $domainUsers) {
    Set-ADAccountPassword -Identity $user -NewPassword $password
}

$randNum