#!/bin/bash
############################
#
############################

#!/bin/bash
# set -e;

if ! pgrep foot >/dev/null; then echo "Launching foot..." && swaymsg "exec foot"; fi
if ! pgrep chrome >/dev/null; then echo "Launching chrome..." && swaymsg "exec google-chrome-stable"; fi
if ! pgrep telegram >/dev/null; then echo "Launching telegram..." && swaymsg 'exec telegram-desktop'; fi
if ! pgrep teams >/dev/null; then echo "Launching teams..." && swaymsg 'exec /opt/teams-for-linux/teams-for-linux'; fi
# if [[ ! $(ps aux | grep io.elementary.music >/dev/null) ]]; then echo "Launching music player..." && swaymsg "exec io.elementary.music"; fi
