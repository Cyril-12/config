#!/usr/bin/env bash
choice=$(printf '%s\n' \
'󰐥  Shutdown' \
'󰜉  Restart' \
'󰍃  Logout' \
'󰤄  Suspend' \
'󰌾  Lock' \
'󰀄  Switch User' |
rofi -dmenu -i -p Power -theme ~/.config/rofi/power-menu.rasi)
case "$choice" in
  *Shutdown) systemctl poweroff ;;
  *Restart) systemctl reboot ;;
  *Logout) i3-msg exit ;;
  *Suspend) systemctl suspend ;;
  *Lock) i3lock ;;
  *"Switch User") loginctl activate "$(loginctl list-sessions --no-legend | awk -v u="$(whoami)" '$3 != u {print $1; exit}')" ;;
esac
