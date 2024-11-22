
function GeneratePassword {

    $charArray = [char[]]('a'[0]..'z'[0])

    $password = -join (1..9 | ForEach-Object { $charArray | Get-Random })
    return $password
}

function Encrypt {
    $key = [System.Text.Encoding]::UTF8.GetBytes("5748465926501746")  # 16-byte key
    $iv = [System.Text.Encoding]::UTF8.GetBytes("7685729104856472")   # 16-byte IV

    $plainText = "MySecretPassword"
    $plainBytes = [System.Text.Encoding]::UTF8.GetBytes($plainText)

    # Create AES encryptor
    $aes = [System.Security.Cryptography.Aes]::Create()
    $aes.Key = $key
    $aes.IV = $iv
    $encryptor = $aes.CreateEncryptor()

    # Perform encryption
    $encryptedBytes = $encryptor.TransformFinalBlock($plainBytes, 0, $plainBytes.Length)
    $encryptedString = [Convert]::ToBase64String($encryptedBytes)

    Write-Output "Encrypted String: $encryptedString"

}

function Decrypt {
    # Encrypted string to decrypt
    $encryptedString = "Ovj1dONK1cWmS0g0lwQD48C0c3Ln+V4BrZ+0b5VP1d0="
    $encryptedBytes = [Convert]::FromBase64String($encryptedString)

    $key = [System.Text.Encoding]::UTF8.GetBytes("5748465926501746")  # 16-byte key
    $iv = [System.Text.Encoding]::UTF8.GetBytes("7685729104856472")   # 16-byte IV

    # Create AES decryptor
    $aes = [System.Security.Cryptography.Aes]::Create()
    $aes.Key = $key
    $aes.IV = $iv
    $decryptor = $aes.CreateDecryptor()

    # Perform decryption
    $decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytes, 0, $encryptedBytes.Length)
    $decryptedString = [System.Text.Encoding]::UTF8.GetString($decryptedBytes)

    Write-Output "Decrypted String: $decryptedString"
    
}


Encrypt