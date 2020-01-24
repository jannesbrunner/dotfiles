# Install oh my zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jay/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/zsh lesspipe)"


# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
fi

# PS1 Settings 
    # PowerLine Shell
    # See: https://github.com/b-ryan/powerline-shell
   function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# automatically piping ls -la to more
# ls() { if [[ $@ == "-la" ]]; then command ls -la | more; else command ls "$@"; fi; }

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias home="cd ~"
alias lst="tree -L 1"
alias sudo="sudo "
alias aliasgit="git config --get-regexp alias"
## Shortcuts System Specific

if [[ $(hostname) == 'v22018035923162686' ]]; then
   echo $USER @ $(hostname) 
   alias checkupdates='sudo apt-get update && sudo apt-get upgrade'
   alias dailylog='sudo logwatch --detail low --range today'
   alias weeklylog='sudo logwatch --detail low --range "-7 days"'       	

elif [[ $(hostname) == 'jbx1carbon' ]]; then
   echo $USER @ $(hostname)
   
   # Aliases
   alias db='cd $HOME/Dropbox'
   alias cloud='cd $HOME/Nextcloud'
   alias htw='cd $HOME/Nextcloud/Uni'
   alias projects='cd $HOME/Nextcloud/Projekte/'
   alias projekte='cd $HOME/Nextcloud/Projekte/'
   alias mapper='cd $HOME/Dropbox/HTW/Semester5/projekt/bp-htw-mapper'
   alias checkupdates='sudo dnf update && sudo dnf upgrade'   
   alias hdon='gsettings set org.gnome.desktop.interface text-scaling-factor 1.6'	
   alias hdoff='gsettings set org.gnome.desktop.interface text-scaling-factor 1.0'
   
   # VS Code
   alias updatecode='wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb && sudo dpkg -i /tmp/code_latest_amd64.deb'

   # Berlinale
   alias fmsui-start='nginx -c /home/jay/Documents/berlinale/nginx_fms_ui.conf -p /home/jay/Documents/berlinale/git/fms-ui'
   alias fmsui-stop='nginx -s stop'
   
   ### Path ###
   # Add Android tools to Path
   export ANDROID_HOME=$HOME/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   # Add Python Anaconda to Path
   export PATH=/home/jay/apps/anaconda3/bin:$PATH
   # Add RVM to PATH for scripting. (Ruby Version management)
   export PATH="$PATH:$HOME/.rvm/bin"
   # Add GO Language to Path
   export PATH=$PATH:/usr/local/go/bin
elif [[ $(hostname | grep -o Jays-MBP) == 'Jays-MBP' ]]; then
   echo Hello $USER !
   # Aliases
   alias db='cd $HOME/Dropbox'
   alias cloud='cd $HOME/MEGA'
   alias htw='cd $HOME/MEGA/Uni'
   alias projects='cd $HOME/MEGA/Projekte/'
   alias projekte='cd $HOME/MEGA/Projekte/'
   alias updateos='brew update'
   alias upgradeos='brew upgrade'
   alias install='brew cask install'

elif [[ $(hostname) == 'JB-Desktop' ]]; then
   echo Hello $USER !
   # Aliases
   alias winhome='cd /mnt/c/Users/Jay'
   alias db='cd /mnt/d/Dropbox'
   alias cloud='cd /mnt/e/MEGA'
   alias htw='cd /mnt/e/MEGA/Uni'
   alias projects='cd /mnt/e/MEGA/Projekte/'
   alias projekte='cd /mnt/e/MEGA/Projekte/'
   alias updateos='sudo apt update'
   alias upgradeos='sudo apt upgrade'
   alias install='sudo apt install'

else
   echo This machine is unknown.
fi

# This is for tracking dot files. Thanks to Nicola Paolucci. Check:
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
