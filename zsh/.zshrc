# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2

# Theme
ZSH_THEME="prose"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git alias-tips sublime-text gitignore osx bower npm ssh-agent k zsh-syntax-highlighting virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

source "$HOME/.zsh/z"

export PATH=$PATH:~/bin

# set Chrome variable
alias chrome="/usr/bin/google-chrome-stable"

export CHROME_BIN="/usr/bin/chromium"

export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

export GOPATH=~/.go
export PATH=$PATH:$GOPATH/bin
export JAVA_HOME=/usr/lib/jvm/java-8-jdk
