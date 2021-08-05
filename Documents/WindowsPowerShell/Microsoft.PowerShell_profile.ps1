Import-Module posh-git
Import-Module oh-my-posh
Import-Module DockerCompletion

Set-PoshPrompt -Theme ~/.jay.omp.json

Enable-PoshTooltips

# Functions / Aliases
function config { 
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME @args
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

# use own cd alias
Set-Alias -Name cd -Value change-dir -Option AllScope

# touch alias
Set-Alias -Name touch -Value New-Item