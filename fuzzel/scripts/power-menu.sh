#!/usr/bin/env bash
result=$(echo -e "Shutdown\nReboot\nHibernate\nLog out" | fuzzel --dmenu --placeholder="POWER MENU" --hide-prompt -l 4)

if [[ "${result}" = "Shutdown" ]]; then
  systemctl poweroff -i
elif [[ "${result}" = "Hibernate" ]]; then
  systemctl hibernate
elif [[ "${result}" = "Reboot" ]]; then
  systemctl reboot
elif [[ "${result}" = "Log out" ]]; then
  loginctl terminate-user $USER
fi
