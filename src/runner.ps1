# Main class through where all of the Powershell code will be run

while($true) {
    $command = Read-Host -Prompt "Enter command" # Get command from powershell
    $command_arr = $command.Split(" ")
    $command_word = $command_arr[0].ToLower()

    if($command_word -eq "quit") {
        break
    } elseif ($command_word -eq "search") {
        sh chrome_runner.sh $command_arr[1..($command_arr.Length - 1)]
    } elseif ($command_word -eq "play") {
        #Start-Process -FilePath "/Applications/"
        Find-Module -Name "PSSpotify"
        if($?) {
            Write-Host -Object "Module Found!"
        }
        # Actual playing and everything should go here
    } elseif ($command_word -eq "status") {
        sh status_checker.sh
    } elseif ($command_word -eq "open") {
         # Recurse to find projects
        python project_opener.py $command_arr[1..($command_arr.Length - 1)]
    } elseif ($command_word -eq "gitupdate") {
        # Recurse to find projects
        Invoke-Expression -Command "git add -A"
        Invoke-Expression -Command "git commit -m $($command_arr[1..($command_arr.Length - 1)])"
        Invoke-Expression -Command "git push"
   } else {
        Write-Host -Object "Not a valid command. Try again!"
    }

    # Now, need to implement functionality for opening up projects on VSCode, and other functionality such as opening spotify
}

Write-Host -Object "Terminal-Velocity closing..."