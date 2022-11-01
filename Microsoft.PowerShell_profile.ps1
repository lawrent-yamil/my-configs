Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\agnoster.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons

# Acortardor para limpiar la consola
function c { Clear-Host }

# Acortardor para abrir vscode y que no dependa de la consola
function vs {
  # Current directory
  $dir = Get-Location
  if ($args.Length -eq 0) {
    code $dir
  } else {
    code $args
  }
}

# Acortador para abrir mysql
function my {
  if ($args.Length -eq 0) {
    mysql -u root -p
  } else {
    mysql -u root -p $args
  }
}

# Git usual commands
function g {

  # If no arguments are passed, show the status
  if ($args.Length -eq 0) {
    git status
  } else {
    # If the first argument is "a" or "add", add all files
    if ($args[0] -eq "a" -or $args[0] -eq "add") {
      git add .
    }
    # If the first argument is "c" or "commit", commit with the message
    if ($args[0] -eq "c" -or $args[0] -eq "commit") {
      git commit -m $args[1]
    }
    # If the first argument is "p" or "push", push to the current branch
    if ($args[0] -eq "p" -or $args[0] -eq "push") {
      git push
    }
    # If the first argument is "pl" or "pull", pull from the current branch
    if ($args[0] -eq "pl" -or $args[0] -eq "pull") {
      git pull
    }
    # If the first argument is "s" or "status", show the status
    if ($args[0] -eq "s" -or $args[0] -eq "status") {
      git status
    }
    # If the first argument is "b" or "branch", show the branches
    if ($args[0] -eq "b" -or $args[0] -eq "branch") {
      git branch
    }
    # If the first argument is "co" or "checkout", checkout to the branch
    if ($args[0] -eq "co" -or $args[0] -eq "checkout") {
      git checkout $args[1]
    }
    # If the first argument is "m" or "merge", merge the branch
    if ($args[0] -eq "m" -or $args[0] -eq "merge") {
      git merge $args[1]
    }
  }
}