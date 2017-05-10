# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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
plugins=(git git-prompt git-remote-branch grunt gulp man node nvm npm sudo alias-tips sublime systemd tmux ubuntu z yarn zsh-navigation-tools zsh_reload gitignore docker docker-compose cp bower npm ssh-agent)

# ZSH
source "$HOME/.zsh/z"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# PATH
export PATH=$PATH:/home/ricardo/bin
export PATH="$PATH:`yarn global bin`"

# set Chrome variable
export CHROME_BIN="/usr/bin/chromium"

# set Chrome variable
alias chrome="/usr/bin/google-chrome-stable"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm


# FINAL STEP
source $ZSH/oh-my-zsh.sh

# Initialize TMUX
if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi
