#!/bin/zsh

typeset -U path PATH
path=(~/.local/bin ~/.local/bin/statusbar $path)
export PATH

#==== exports
export EDITOR='nano'
#export VISUAL='mousepad'
export BROWSER="firefox"
export TERMINAL="kitty"

#==== qt5ct
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum

#==== uncomment this if running gnome wayland from tty1
#if [[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty ]]; then
#  MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
#fi

#==== use either mesa's radv or amd's amdvlk
#AMD_VULKAN_ICD=AMDVLK
export AMD_VULKAN_ICD=RADV


export LIBVA_DRIVER_NAME=radeonsi
#export VDPAU_DRIVER=nvidia
export VDPAU_DRIVER=radeonsi
#export VDPAU_DRIVER=radeonsi_drv_video

# XDG - set defaults as they may not be set
# See https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# and https://wiki.archlinux.org/index.php/XDG_Base_Directory_support
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

if [ ! -w ${XDG_RUNTIME_DIR:="/run/user/$UID"} ]; then
    echo "\$XDG_RUNTIME_DIR ($XDG_RUNTIME_DIR) not writable. Unsetting." >&2
    unset XDG_RUNTIME_DIR
else
    export XDG_RUNTIME_DIR
fi

#sleep 30 && dbus-update-activation-environment --systemd --all