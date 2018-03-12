#!/usr/bin/env bash

# main idea: all that you need to probe battery performance lie in this beautiful file:
# $ cat /sys/class/power_supply/BAT0/uevent
# additional helper files: $ ls /sys/class/power_supply/BAT0
# tip: thinkpads also have BAT1

format_minutes() {
  if (( $1 < 10 )); then
    echo "0"$1
    return 0
  fi
  echo $1
}

battery_print() {
  path_ac="/sys/class/power_supply/AC"
  path_battery_0="/sys/class/power_supply/BAT0"
  path_battery_1="/sys/class/power_supply/BAT1"

  ac=0
  battery_level_0=0
  battery_level_1=0
  battery_max_0=0
  battery_max_1=0

  if [ -f "$path_ac/online" ]; then
    ac=$(cat "$path_ac/online")
  fi

  if [ -f "$path_battery_0/energy_now" ]; then
    battery_level_0=$(cat "$path_battery_0/energy_now")
  fi

  if [ -f "$path_battery_0/energy_full" ]; then
    battery_max_0=$(cat "$path_battery_0/energy_full")
  fi

  if [ -f "$path_battery_1/energy_now" ]; then
    battery_level_1=$(cat "$path_battery_1/energy_now")
  fi

  if [ -f "$path_battery_1/energy_full" ]; then
    battery_max_1=$(cat "$path_battery_1/energy_full")
  fi

  battery_level=$(("$battery_level_0 + $battery_level_1"))
  battery_max=$(("$battery_max_0 + $battery_max_1"))

  battery_percent=$(("$battery_level * 100"))
  battery_percent=$(("$battery_percent / $battery_max"))
  battery_percent_float=$(bc -l <<< "($battery_level * 100) / $battery_max" | cut -c1-4)

  if [ "$ac" -eq 1 ]; then
    icon=""

    if [ "$battery_percent" -gt 97 ]; then
      echo "$icon"
    else
      echo "$icon ${battery_percent}%"
    fi
  else
    if [[ $(cat /sys/class/power_supply/BAT0/power_now) = 0 ]]; then
      power=$(cat /sys/class/power_supply/BAT1/power_now)
    else
      power=$(cat /sys/class/power_supply/BAT0/power_now)
    fi
    bat0_energy=$(cat /sys/class/power_supply/BAT0/energy_now)
    bat1_energy=$(cat /sys/class/power_supply/BAT1/energy_now)
    total_energy=$(bc -l <<< "$bat0_energy + $bat1_energy")
    hours=$(bc <<< "$total_energy/$power" | cut -c1-4)"hs"
    hours_discrete=$(bc <<< "$total_energy/$power")
    hours_float=$(bc -l <<< "$total_energy/$power")
    minutes=$(echo "scale=0; (($hours_float - $hours_discrete) * 60)/1" | bc)
    formatted_minutes=$(format_minutes $minutes)
    power_float=$(bc -l <<< "$power/1000000" | cut -c1-4)
    remaining=""${hours_discrete}:${formatted_minutes}

    if [ "$battery_percent" -gt 85 ]; then
      icon=""

    elif [ "$battery_percent" -gt 60 ]; then
      icon=""
    elif [ "$battery_percent" -gt 35 ]; then
      icon=""
    elif [ "$battery_percent" -gt 10 ]; then
      icon=""
    else
      icon=""
    fi
    echo "$icon ${battery_percent_float}% $remaining ${power_float}"
  fi
}

case "$1" in
  --update)
    pid=$(pgrep -xf "/bin/sh /home/ninrod/.options/arch/polybar/scripts/thinkpad_battery_udev/battery-combined-udev.sh")

    if [ "$pid" != "" ]; then
      kill -10 "$pid"
    fi
    ;;
  *)
    trap exit INT
    trap "echo" USR1

    while true; do
      battery_print

      sleep 3 &
      wait
    done
    ;;
esac
