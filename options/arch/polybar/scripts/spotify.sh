#!/usr/bin/env bash

# lifted from vulgrim: https://github.com/vulgrim/dotfiles/blob/master/.config/polybar/spotify.sh

prepend_zero () {
    seq -f "%02g" $1 $1
}

artist=$(echo -n $(playerctl metadata artist))
song=$(echo -n $(playerctl metadata title))

echo -n "$artist - $song"