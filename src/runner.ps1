# Main class through where all of the Powershell code will be run

while($true) {
    $command = Read-Host -Prompt "Enter command" # Get command from powershell
    $command_arr = $command.Split(" ")

    if($command_arr[0].ToLower() -eq "quit") {
        break
    } elseif ($command_arr[0].ToLower() -eq "search") {
        sh chrome_runner.sh $command_arr[1..($command_arr.Length - 1)]
    } # elseif ($command_arr[0].ToLower() -eq "play") {
    #     Start-Process -FilePath "/Applications/"
    # }

    # Now, need to implement functionality for opening up projects on VSCode, and other functionality such as opening spotify
}

Write-Host -Object "Terminal-Velocity closing..."