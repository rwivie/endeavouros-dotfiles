#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
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

# user init scripts and settings
#[ -r ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -r ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -r ~/.xprofile ] && . ~/.xprofile

#==== for xsession-errors
#errfile="$HOME/.xsession-errors"
#if [ -z "$HOSTNAME" ]; then
#    errfile="$HOME/.xsession-errors"
#else
#    errfile="$HOME/.xsession-errors-$HOSTNAME"
#fi
#exec $1 &>> ${errfile}

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

##twm &
##xclock -geometry 50x50-1+1 &
##xterm -geometry 80x50+494+51 &
##xterm -geometry 80x20+494-0 &
##exec xterm -geometry 80x66+0+0 -name login
##exec i3 -V -d all &>> "$HOME/.i3.log"
exec i3

#==== for budgie ====
#export XDG_SESSION_TYPE=x11
##export GDK_BACKEND=x11
#export XDG_CURRENT_DESKTOP=Budgie:GNOME
#exec budgie-desktop

#==== for gnome ====
#export XDG_SESSION_TYPE=x11
#export GDK_BACKEND=x11
#exec gnome-session

#==== for gnome classic ====
#export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME
#export GNOME_SHELL_SESSION_MODE=classic
#exec gnome-session

##==== to run a session
## Here Xfce is kept as default
#session=${1:-xfce}
##==== use $xinit <session> or $startx ~/.xinitrc <session>
#case $session in
#    i3|i3wm           ) exec i3;;
##    kde               ) exec startplasma-x11;;
#    xfce|xfce4        ) exec startxfce4;;
#    # No known session, try to run it as command
#    *                 ) exec $1;;
#esac

