Import-Module posh-git
Import-Module oh-my-posh
Import-Module DockerCompletion

Set-PoshPrompt -Theme ~/.jay.omp.json

Enable-PoshTooltips


## Alias Functions ##

# Git Config Bare Repo alias
function config { 
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME @args
}

# Start Docker Desktop
function start-dd {
    & "C:\Program Files\Docker\Docker\Docker Desktop.exe"
}
