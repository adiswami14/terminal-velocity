# Main class through where all of the Powershell code will be run

while($true) {
    $command = Read-Host -Prompt "Enter command" # Get command from powershell
    $command_arr = $command.Split(" ")

    if($command_arr[0].ToLower() -eq "quit") {
        break
    } elseif ($command_arr[0].ToLower() -eq "search") {
        sh chrome_runner.sh $command_arr[1..($command_arr.Length - 1)]
    } elseif ($command_arr[0].ToLower() -eq "play") {
        #Start-Process -FilePath "/Applications/"
        Find-Module -Name "PSSpotify"
        if($?) {
            Write-Host -Object "Module Found!"
        }
        # Actual playing and everything should go here
    } elseif ($command_arr[0].ToLower() -eq "status") {
        sh status_checker.sh
    } elseif ($command_arr[0].ToLower() -eq "open") {
         # Recurse to find projects
        python project_opener.py $command_arr[1..($command_arr.Length - 1)]
    } else {
        Write-Host -Object "Not a valid command. Try again!"
    }

    # Now, need to implement functionality for opening up projects on VSCode, and other functionality such as opening spotify
}

Write-Host -Object "Terminal-Velocity closing..."