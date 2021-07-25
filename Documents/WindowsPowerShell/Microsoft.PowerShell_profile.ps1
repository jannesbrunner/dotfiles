Import-Module posh-git
Import-Module oh-my-posh
Import-Module DockerCompletion
Set-Theme Paradox

# Functions / Aliases
function config { 
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME @args
}
