# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -Fh'
alias la='ls -aFh'
alias ldot='ls -dFh .*'

# Advanced Aliases.
# Use with caution
#

alias e="/usr/local/bin/emacsclient -ct"
alias emacs-start="/usr/local/bin/emacs --daemon"
alias zshrc='emacs ~/.zshrc' # Quick access to the ~/.zshrc file
alias my_aliases='cd ~/.oh-my-zsh/custom/ && emacs my_patches.zsh && cd -'
alias mongo_bgstart='mongod --dbpath /path/to/my/mongodata --fork --logpath /path/to/my/mongod.log'
alias pg_start='postgres -D /usr/local/pgsql/data >logfile 2>&1 &'

# BPMN.io
alias atest='grunt auto-test'
alias tst='grunt test'
alias set_chromium='export CHROME_BIN="/Applications/Chromium.app/Contents/MacOS/Chromium"'
alias set_chrome='export CHROME_BIN="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"'
alias set_canary='export CHROME_BIN="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"'

# because typing 'cd' is A LOT of work!!
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias help='man'

alias rm='rm -Ird'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -pv'
alias mkd='mkdir -p "$1" && cd "$1"'

#GLOBAL ALIASES
alias -g NUL="> /dev/null 2>$1 .log"
alias -g G="| grep"

#GIT REPLACE
alias gl='git log --graph --full-history --all --color --pretty=tformat:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%x1b[33m(%an)%x1b[0m"'

# Mac Helpers
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles YES &&
killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles NO &&
killall Finder"

alias flushdns='dscacheutil -flushcache'

alias bpmn-chrome='chrome --load-and-launch-app="$APP_DIR" $@'

alias brew_keg='brew info --json=v1 --installed | jq "map(select(.keg_only == true and .linked_keg == null) | .name)"'

function init() {
 echo "Setting up .editorconfig.."
 cp ~/.editorconfig .
 echo "Setting up .jshintrc.."
 cp ~/.jshintrc .
 echo "Setting up gulpfile.js.."
 cp ~/gulpfile.js
 echo "Now add .gitignore and git init please, bye!"
}

function simple_server() {
 echo "Starting a simple Python server on port 8080.."
 python -m SimpleHTTPServer 8080
}


function upgrade() {
  echo "Updating brew.."
  brew update
  echo "Upgrading brew.."
  brew upgrade
  echo "Cleaning up brew and cask.."
  brew cleanup
  brew cask cleanup
  echo "Brew in the doctor.."
  brew doctor
  gem update
  gem update --system
  echo "Rehashing ruby environment.."
  rbenv rehash
  echo "Updating npm.."
  npm update -g
  restart
  echo "All done. =)"
}

function restart() {
  source ~/.zshrc
  clear
}

function cdf() { # short for `cdfinder`
  cd "$(osascript -e 'tell app "Finder" to POSIX path of
(insertion location as alias)')";
}

function trees () {
  find $@ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}

function mkp5 () {
  mkdir -pv $@
  cd $@
  touch $@.pde
  st .
}

function force-kill() {
  ps aux | grep $@ | awk {'print $2" "'} | xargs kill -9
}

function gi() {
  curl -s https://www.gitignore.io/api/$@
}

function restart-plasma() {
  killall plasmashell
  kstart 5plasmashell > /dev/null 2>&1 & disown
}
