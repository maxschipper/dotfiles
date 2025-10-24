#!/usr/bin/env bash
result=$(echo -e "Lock\nReboot\nHibernate\nPower off" | fuzzel --dmenu --placeholder="POWER MENU" --hide-prompt -l 4)

if [[ "${result}" = "Power off" ]]; then
  systemctl poweroff -i
elif [[ "${result}" = "Lock" ]]; then
  loginctl lock-session
elif [[ "${result}" = "Hibernate" ]]; then
  systemctl hibernate
elif [[ "${result}" = "Reboot" ]]; then
  systemctl reboot
fi
