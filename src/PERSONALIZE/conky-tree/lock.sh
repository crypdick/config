#!/usr/bin/env bash
#https://www.reddit.com/r/i3wm/comments/5w95fp/how_to_get_lockscreen_like_this/

icon="$HOME/src/conky-tree/gay_space_communism.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 2% -scale 5000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"
