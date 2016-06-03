#
# ~/.zprofile
#

. /usr/share/nvm/init-nvm.sh

[[ -f ~/.zshrc ]] && . ~/.zshrc

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec ssh-agent startx

xmodmap ~/.Xmodmap

