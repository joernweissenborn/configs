export TERM="xterm-256color"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
	dnf
	fancy-ctrl-z
	git
	history-substring-search
	pip
	python
	sudo
	systemd
	thefuck
	virtualenv
	zsh-autosuggestions
	)

source $ZSH/oh-my-zsh.sh
eval $(thefuck --alias)

# User configuration

alias zreload="source ~/.zshrc"
alias edit_vim="vim ~/.vimrc"
alias update_vim_plugins="vim -c PluginUpdate -c quitall && vim -c PluginClean -c quitall"
alias edit_zsh="vim ~/.zshrc"
alias edit_tmux="vim ~/.tmux"
export PATH="$PATH:/home/joern/.local/bin"

# For Vim
alias vimclip="xclip -sel clip < ~/.vimbuffer"

# Golang
export GOPATH=/home/$USER/programming/golang/
export PATH="$PATH:${GOPATH}bin"
export PATH="$PATH:/home/$USER/programming/golang/bin"
export PATH="$PATH:/usr/local/go/bin"

# Dart

export PATH="$PATH:/opt/dartlang/bin"

# Python
alias python='/usr/bin/python3'
alias pip='/usr/bin/pip3'

# Conda
export PATH=/home/joern/anaconda3/bin:$PATH

# Webdev
export PATH="$PATH:/home/joern/.yarn/bin"

# Cargo
source $HOME/.cargo/env

# tmux
export TMUXP_CONFIGDIR=$HOME/configs/tmuxp
export DISABLE_AUTO_TITLE='true'
alias ta='tmux a -t'

# ssh key unlock
alias unlockmykeys='eval "$(ssh-agent)" && ssh-add'

# # Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/dsa_id"

# cheat

export CHEAT_USER_DIR=~/configs/cheatsheets

 # Powerlevel9k
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(history status command_execution_time ssh context dir)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(rbenv vcs anaconda root_indicator background_jobs battery time)

POWERLEVEL9K_DIR_SHOW_WRITABLE=true

# load zgen
source "${HOME}/.zgen/zgen.zsh"

zgen load djui/alias-tips

#Nitrokeys

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

source $HOME/.zshrc_local
