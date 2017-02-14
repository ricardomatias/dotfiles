# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="prose"

# Uncomment the following line to disable command auto-correction.
DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

DISABLE_LS_COLORS="false"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git alias-tips sublime-text gitignore brew osx brew-cask bower npm ssh-agent zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:usr/local/bin:usr/bin:$PATH:/usr/local/opt/gems/bin

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='subl -w'
 else
   export EDITOR='subl -w'
 fi

export RBENV_ROOT="$(brew --prefix rbenv)"
export GEM_HOME="$(brew --prefix)/opt/gems"
export GEM_PATH="$(brew --prefix)/opt/gems"
export PATH="$(brew --prefix sqlite)/bin:$PATH"
export PATH="$(brew --prefix make)/bin:$PATH"
export PATH="$(brew --prefix jq)/bin:$PATH"
export PATH="$(brew --prefix unzip)/bin:$PATH"
export PATH="$(brew --prefix curl)/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
. `brew --prefix`/etc/profile.d/z.sh

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# sed manual
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

# Test Browsers
export TEST_BROWSERS="Chrome"

# Initialize RBENV
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities github

AUTO_CD=true

# Highlight
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line)
