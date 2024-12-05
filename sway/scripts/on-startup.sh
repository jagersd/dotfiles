#!/usr/bin/bash

export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

if grep -qE "nvidia|fglrx" /proc/modules; then
	export WLR_NO_HARDWARE_CURSORS=1
fi

systemctl --user import-environment XDG_SESSION_TYPE XDG_SESSION_DESKTOP XDG_CURRENT_DESKTOP PATH SWAYSOCK

