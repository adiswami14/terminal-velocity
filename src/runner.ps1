# Main class through where all of the Powershell code will be run

Write-Host -Object "Terminal-Velocity starting..."

$name = $null
if([String]::IsNullOrWhiteSpace((Get-Content -Path "profile.txt"))) {
    $name = Read-Host -Prompt "Enter your name"
    Out-File -InputObject $name -FilePath "profile.txt"
} else {
    $name = Get-Content -Path "profile.txt"
}
Write-Host -Object "Hello, $name!"

while($true) {
    $command = Read-Host -Prompt "Enter command" # Get command from powershell
    $command_arr = $command.Split(" ")
    $command_word = $command_arr[0].ToLower()

    if($command_word -eq "quit") {
        break
    } elseif ($command_word -eq "search") {
        sh chrome_runner.sh $command_arr[1..($command_arr.Length - 1)]
    } elseif ($command_word -eq "status") {
        sh status_checker.sh
    } elseif ($command_word -eq "open") {
         # Recurse to find projects
        python project_opener.py $command_arr[1..($command_arr.Length - 1)]
    } elseif ($command_word -eq "profile") {
        Write-Host "Current Profile: $name"
        $name_change_question = Read-Host -Prompt "Change name? (Enter y for yes) "

        if($name_change_question.ToLower() -eq "y") {
            $name = Read-Host -Prompt "Enter your name"
            Out-File -InputObject $name -FilePath "profile.txt"
            Write-Host -Object "Name changed to $name!"
        }
    } elseif ($command_word -eq "gitupdate") {
        # git add, commit and push all in one command
        $commit_msg = $command_arr[1..($command_arr.Length - 1)]
        $confirmation = Read-Host -Prompt "Commit all files with message ""$($commit_msg)""? (Enter y for yes) "

        if ($confirmation.ToLower() -eq "y") {
            Invoke-Expression -Command "git add -A"
            Invoke-Expression -Command "git commit -m ""$($commit_msg)"" "
            Invoke-Expression -Command "git push"
        } else {
            Write-Host -Object "Commit cancelled."
        }
   } else {
        Write-Host -Object "Not a valid command. Try again!"
    }
}

Write-Host -Object "Terminal-Velocity closing..."