Import-Module posh-git
Import-Module oh-my-posh
Import-Module DockerCompletion
Set-Theme Paradox

# Functions / Aliases
function Update-Profile { Copy-Item "profile.ps1" -Destination "C:\Users\Jannes Brunner\Documents\WindowsPowerShell" }
function Git-Config { param($param1, $param2, $param3); git --git-dir=$env:USERPROFILE/.cfg/ --work-tree=$env:USERPROFILE $param1 $param2 $param3 }