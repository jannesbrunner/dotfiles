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

function change-dir {
    param(
        $direction
    )

    if (!$direction) {
        return
    }

    switch($direction) {
        "projects" {
            if(Test-Path "projects") { # projects dir in current dir present? cd into it...
                Set-Location "projects"
            } else {
                Set-Location 'D:\projekte' 
            }
        }

        default {
            Set-Location $direction
        }

    }
}

# touch alias
Set-Alias -Name touch -Value New-Item

# use own cd alias
Set-Alias -Name cd -Value change-dir -Option AllScope

# touch alias
Set-Alias -Name touch -Value New-Item

# fast node version manager (fnm)
fnm env --use-on-cd | Out-String | Invoke-Expression


