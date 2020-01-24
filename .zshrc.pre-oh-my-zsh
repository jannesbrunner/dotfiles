# Enable tmux
if command -v tmux>/dev/null; then
    if [ ! -z "$PS1" ]; then # unless shell not loaded interactively, run tmux
                [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && tmux
    fi
 fi


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "%(SHELL=/bin/zsh lesspipe)"


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac



# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


## Personal config for the bash ##

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
ls() { if [[ $@ == "-la" ]]; then command ls -la | more; else command ls "$@"; fi; }


# For shortcutting the dir display
PROMPT_DIRTRIM=3 

## Shortcuts
alias home="cd ~"
alias lst="tree -L 1"
alias sudo="sudo "
alias aliasgit="git config --get-regexp alias"

# react-native
alias rns="react-native start"
alias rna="react-native run-android"
alias rnl="react-native log-android"

# Tmux
alias kaw='tmux kill-server && tmux'



## Shortcuts System Specific

if [[ $(HOSTNAME) == 'v22018035923162686' ]]; then
   echo $USER @ $(HOSTNAME) 
   alias checkupdates='sudo apt-get update && sudo apt-get upgrade'
   alias dailylog='sudo logwatch --detail low --range today'
   alias weeklylog='sudo logwatch --detail low --range "-7 days"'     

elif [[ $(HOSTNAME) == 'JB-Desktop' ]]; then
   echo $USER @ $(HOSTNAME) 
   alias db='cd /mnt/d/Dropbox/'
   alias od='cd /mnt/d/OneDrive/'
   alias htw='cd /mnt/d/Dropbox/HTW/Semester5'
   alias wpd='cd /mnt/d/Dropbox/projekte/'
   alias checkupdates='sudo apt-get update && sudo apt-get upgrade'    	
  	

elif [[ $(HOSTNAME) == 'jbx1carbon' ]]; then
   echo $USER @ $(HOSTNAME)
   
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
   
else
   echo This machine is unknown.
fi

# This is for tracking dot files. Thanks to Nicola Paolucci. Check:
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Set bash language to English
export LANG=en_US.UTF-8







