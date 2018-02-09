#!/usr/bin/env bash

# stolen from polybar-scripts:
# https://github.com/x70b1/polybar-scripts/blob/master/polybar-scripts/battery-combined-tlp/battery-combined-tlp.sh

battery=$(sudo tlp-stat -b | tail -2 | head -n 1 | tr -d -c "[:digit:],.")

echo "# $battery %"