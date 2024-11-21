$users = Get-LocalUser

foreach($user in $users) {

    $Title = "Do you want to remove user: " + $user
    $Prompt = "Enter your choice"
    $Choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Yes", "&No", "&Cancel")
    $Default = 1

    $Choice = $host.UI.PromptForChoice($Title, $Prompt, $Choices, $Default)

    switch($Choice)
    {
        0 { Write-Host "Yes - Write your code"}
        1 { Write-Host "No - Write your code"}
        2 { Write-Host "Cancel - Write your code"}
    }
    
    
}