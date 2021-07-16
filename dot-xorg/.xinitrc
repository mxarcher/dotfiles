#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi





# MyConfig
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export LANG=zh_CN.UTF-8


# Autostart

# using gnome-keyring with xinitrc
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

xsetroot -cursor_name left_ptr &

# Autohide the cursor when inactive
# unclutter --ignore-scrolling &

nvidia-settings --assign CurrentMetaMode="DP-2: nvidia-auto-select +0+0 {ForceCompositionPipeline=On}" 
exec bspwm
