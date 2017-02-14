#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# load terminal settings
[[ -f ~/.Xresources ]] && xrdb -merge $HOME/.Xresources

# start terminal daemon (improves start time)
urxvtd -q -o -f

# fix clip boards
autocutsel -fork -selection PRIMARY &

# screen lock integration
xss-lock -- i3lock &

# touchpad fix
if type synclient >/dev/null 2>&1; then
 synclient HorizTwoFingerScroll=1 &
 synclient TapButton2=3 &
fi

# Keyboard delay & rate
xset r rate 250 20

# set dpi
xrandr --dpi 200

# set keyboard
xmodmap ~/.Xmodmap

# set notification daemon
#dunst -config ~/.config/dunst/dunstrc

# start audio daemon
#pulseaudio --start

# exec window manager (i3)
exec i3 -V -d all > ~/.i3/log/debug.log 2>&1
