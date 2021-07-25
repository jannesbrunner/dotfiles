Import-Module posh-git
Import-Module oh-my-posh
Import-Module DockerCompletion
Set-Theme Paradox

# Functions / Aliases
function Update-Profile { Copy-Item "$env:userprofile\Microsoft.PowerShell_profile.ps1" -Destination $env:userprofile\Documents\WindowsPowerShell }
function config { 
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME @args
}

Update-Profile # Always update the profile from $HOME to $env:userprofile\Documents\WindowsPowerShell