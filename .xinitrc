#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#while ! xprop -root | grep -q Free; do sleep 1; done
#xrdb -merge ${HOME}/etc/Xresources
#setxkbmap -layout gb -variant dvorak
#xsetroot -solid black
#xset b off 
#exec xterm &
#exec speckeysd ${HOME}/etc/speckeysd.conf &
#exec x-focus-manager &
#exec x-session

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

setxkbmap -layout gb -variant dvorak
sxhkd -c .keybindingrc &
xsetroot -solid black &
tmux new -s irc -d
tmux send-keys -t irc 'irssi' C-m

dwm
