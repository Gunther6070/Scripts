$users = Get-LocalUser

foreach($user in $users) {

    $Title = "Do you want to remove user: " + $user
    $Prompt = "Enter your choice"
    $Choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Yes", "&No", "&Cancel")
    $Default = 1

    $Choice = $host.UI.PromptForChoice($Title, $Prompt, $Choices, $Default)

    switch($Choice)
    {
        0 { 
            $Title = "Are you sure?"
            $Choice = $host.UI.PromptForChoice($Title, $Prompt, $Choices, $Default)
            switch ($Choice) {
                0 {
                    Disable-LocalUser -Name $user
                }
                1 { break }
                2 { exit }
            }
    
        }
        1 { break }
        2 { exit }
    }
    
    
}