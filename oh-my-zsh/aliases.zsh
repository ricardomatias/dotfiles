# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -Fh'
alias la='ls -aFh'
alias ldot='ls -dFh .*'

# Advanced Aliases.
# Use with caution
#

# Python
alias workoff="deactivate"

# Docs
alias docs_xkb="less /usr/share/X11/xkb/rules/base.lst"

# Editor
alias vim="/usr/bin/vim"
alias st="subl3 -a"

# Config Files
alias zshrc='vim ~/.zshrc' # Quick access to the ~/.zshrc file
alias my_aliases='nano ~/.oh-my-zsh/custom/aliases.zsh'


# Node REPL

function mancy (){
  cd ~/Projects/Open\ Source/Mancy
  npm start &
  cd -
}

# BPMN.io
alias atest='TEST_BROWSERS=Chrome grunt auto-test'
alias tst='grunt test'
alias guab='grunt auto-build'

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

## Pacman
alias ls_orphans="pacman -Qdt"
alias rm_orphans="pacman -Rns `pacman -Qdt | cut -d " " -f 1`"
alias pac_ls_ver="expac -s '%-30n %v'"
alias pac_size="pacman -Qi | egrep '^(Name|Installed)' | cut -f2 -d':' | paste - - |
column -t | sort -nrk 2 | grep MiB | less"


# Spotify fix
alias spoty="spotify --force-device-scale-factor=1.0000001"

# Xorg
alias screenres="xdpyinfo | grep -B2 resolution"
alias cursors="find /usr/share/icons ~/.icons -type d -name 'cursors'"

# GLOBAL ALIASES
alias -g NUL="> /dev/null 2>$1 .log"

# GIT REPLACE
alias gl='git log --graph --full-history --all --color --pretty=tformat:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%x1b[33m(%an)%x1b[0m"'

alias flushdns='dscacheutil -flushcache'

alias bpmn-chrome='chrome --load-and-launch-app="$APP_DIR" $@'

function simple_server() {
 echo "Starting a simple Python server on port 8080.."
 python -m SimpleHTTPServer 8080
}


function upgrade() {
  if [ "$1" -eq "npm" ]; then
    echo "Updating npm.."
    npm ls -g | cut -d " " -f 2 | sed -e "1d" -e "/npm@/d" -e "s/@.*//g" | xargs npm update -g
  else
    echo "Updating npm.."
    npm ls -g | cut -d " " -f 2 | sed -e "1d" -e "/npm@/d" -e "s/@.*//g" | xargs npm update -g
    echo "Updating oh-my-zsh.."
    upgrade_oh_my_zsh
    echo "Updating Arch.."
    pacaur -Syu
    echo "All done. =)"
  fi
}

function restart() {
  source ~/.zshrc
  clear
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

function switch_cherry() {
  echo "reset keymap.."
  setxkbmap -model "macbook79" -layout "macintosh_vndr/pt" -option ""

  echo "applying Cherry keyboard mapping.."
  setxkbmap -model "macbook79" -layout "macintosh_vndr/pt" -variant "nodeadkeys" -option "terminate:ctrl_alt_bksp,ctrl:swap_lalt_lctl,lv3:lwin_switch,altwin:swap_alt_win,caps:escape" -v 10

  echo "setting xmodmap.."
  xmodmap ~/.Xmodmap-cherry

  echo "setting delay & repeat rate"
  xset r rate 250 20

  echo "Done"
}

function switch_macbook() {
  echo "reset keymap.."
  setxkbmap -model "macbook79" -layout "macintosh_vndr/pt" -option ""

  echo "applying Cherry keyboard mapping.."
  setxkbmap -model "macbook79" -layout "macintosh_vndr/pt" -variant "nodeadkeys" -option "terminate:ctrl_alt_bksp,lv3:lalt_switch,caps:escape,ctrl:swap_lwin_lctl,ctrl:swap_rwin_rctl,lv3:ralt_alt" -v 10

  echo "setting xmodmap.."
  xmodmap ~/.Xmodmap

  echo "Done"
}

function multiple_home() {

  echo "Setting up External Monitor.."
  xrandr --output HDMI3 --mode 1920x1080 --scale 2x2 --pos 0x0

  echo "Setting up Macbook Monitor.."
  xrandr --output eDP1 --scale 1x1 --pos 3840x0

  echo "Done"
}

# xrandr --output eDP1 --mode 2880x1800 --scale 1x1 --pos 0x0 --output HDMI1 --mode 1920x1080 --scale 1.75x1.75 --pos -3360x0 --output HDMI3 --mode 1920x1080 --scale 1.75x1.75 --pos 2880x0

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

# function multiple_camunda() {
#   result="$(round $((2880 * $@)))"
#
#   echo "Switching to Camunda HQ.."
#   xrandr --output eDP1 --mode 2880x1800 --output HDMI3 --mode 1920x1080 --pos "$result"x0 --scale "$@"x"$@"
#
#   echo "Done"
# }

function multiple_camunda() {
  echo "Switching to Camunda HQ.."
  xrandr --output HDMI1 --auto --mode 1920x1080 --scale 1.5x1.5 --pos -2880x0 --output eDP1 --pos 0x0
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
