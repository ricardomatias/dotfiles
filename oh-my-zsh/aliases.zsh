# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -Fh'
alias la='ls -aFh'
alias ldot='ls -dFh .*'

# Advanced Aliases.
# Use with caution
#

# Docs
alias docs_xkb="less /usr/share/X11/xkb/rules/base.lst"

# Editor
alias vim="/usr/bin/vim"

# Config Files
alias zshrc='nano ~/.zshrc' # Quick access to the ~/.zshrc file
alias my_aliases='nano ~/.oh-my-zsh/custom/aliases.zsh'

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
alias mv='timeout 8 mv -iv'
alias mkdir='mkdir -p -v'
alias mkd='mkdir -p "$1" && cd "$1"'

# SYSTEM MANAGEMENT
alias systemctl="sudo systemctl"
alias reboot="sudo systemctl reboot"
alias shutdown="sudo systemctl poweroff"
alias netctl="sudo netctl"
alias reload_fonts="fc-cache -vf"

# GLOBAL ALIASES
alias -g NUL="> /dev/null 2>$1 .log"

# GIT REPLACE
alias gl='git log --graph --full-history --all --color --pretty=tformat:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%x1b[33m(%an)%x1b[0m"'

function simple_server() {
 echo "Starting a simple Python server on port 8080.."
 python -m SimpleHTTPServer 8080
}


function restart() {
  source ~/.zshrc
  clear
}

function trees () {
  find $@ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}

function multiple_home() {

  echo "Setting up External Monitor.."
  xrandr --output HDMI3 --mode 1920x1080 --scale 2x2 --pos 0x0

  echo "Setting up Macbook Monitor.."
  xrandr --output eDP1 --scale 1x1 --pos 3840x0

  echo "Done"
}

function multiple_work() {
  if [ "$1" -eq "3" ]; then
    echo "Setting up Three way setup .."
    xrandr --output eDP1 --mode 2880x1800 --scale 1x1 --pos -2880x0 --output HDMI1 --mode 1920x1080 --scale 1.75x1.75 --pos 0x0 --output HDMI3 --mode 1920x1080 --scale 1.75x1.75 --pos 3360x0
  else
    echo "Setting up Two way setup .."
    xrandr --output HDMI3 --mode 1920x1080 --pos 3360x0 --scale 1.75x1.75 --output eDP1 --mode 2880x1800 --scale 1x1 --pos 0x0
  fi

  echo "Done"
}

function multiple_off() {
  echo "Switching off External monitors.."
  xrandr --output HDMI3 --off --output HDMI1 --off

  echo "Done"
}

function round() {
  echo "$@" | awk '{print int($1+0.5)}'
}

function force-kill() {
  ps aux | grep $@ | awk {'print $2" "'} | xargs kill -9
}

function gi() {
  curl -s https://www.gitignore.io/api/$@
}

function delay {
 (sleep "$1" ; shift ; "$@") &
}


function pomodoro {
  id="stop"

  if [ "$1" = "start" ]; then
    notify-send "Time to focus!" -a pomodoro

    id="play"

    ((sleep 25m ; notify-send "Timer's up! Rest a bit.." -a pomodoro ; aplay ~/Music/stop-rest.wav ; id="stop") &) &>/dev/null

    ((sleep 15m ; notify-send "15 mins left.." -a pomodoro) &) &>/dev/null

    ((sleep 20m ; notify-send "5 mins left.." -a pomodoro) &) &>/dev/null

    ((sleep 24m ; notify-send "1 min left.." -a pomodoro) &) &>/dev/null

  elif [ "$1" = "rest" ]; then
    notify-send "Time to rest!" -a pomodoro

    id="rest"

    ((sleep 5m ; notify-send "Timer's up! Back to focus!" -a pomodoro ; aplay ~/Music/stop-rest.wav ; id="stop") &) &>/dev/null
  else
    if [ $id != "stop" ]; then
      echo "pomodoro is ticking away.."
    else
      echo "'start' or 'rest' ?"
    fi
  fi
}
