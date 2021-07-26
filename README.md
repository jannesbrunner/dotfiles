## Welcome to my DotFiles

Here you can find my dotfiles (configuration files) for several applications that I am using on
a daily basis like PowerShell, Git, Tmux, Bash and more. 

I'm working with Linux, Windows and MacOS.
MacOS is most of the time my default development system, especially for web dev tasks,
But I also find myself often on Windows and Linux for system server administration porposes.

### Useful links 
- [Dotfiles Github IO](https://dotfiles.github.io/) : Why would I want my dotfiles on GitHub?
- [The best way to store your files on Github](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/) : This is how I keep my dotfiles in sync. 

### Set Up dotfiles on new System

The whole idea is to keep track of config files via a Git Bare repository that sits in the home folder of each system.

#### Windows

- cd in Home folder with PowerShell (`cd $HOME`)
- Define function alias for the current scope:
```
function config { 
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME @args
}
```
- Create a gitignore in $HOME and put ".cfg" into it
- Pull the repo: `git clone --bare https://github.com/jannesbrunner/dotfiles.git $HOME/.cfg`
- Do not track untracked files via `config config --local status.showUntrackedFiles no`
- checkout the configs with `config checkout`

#### MacOS / Linux
- cd in Home folder (`cd ~`)
- Define function alias in current scope
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
- Create a gitignore in $HOME and put ".cfg" into it
- Pull the repo: `git clone --bare https://github.com/jannesbrunner/dotfiles.git $HOME/.cfg`
- Do not track untracked files via `config config --local status.showUntrackedFiles no`
- checkout the configs with `config checkout`


### Track Changes
As the alias is defined in the profile changes can easily get tracked:
- See status of tracked config files: `config status`
- Add new files / changes: `config add <file>`
- Use all known git commands with `config` as alias
