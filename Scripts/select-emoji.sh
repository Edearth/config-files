#!/bin/sh

if emoji=$(cat ~/Scripts/emojis-unicode | rofi -dmenu -i -p 'Select emoji' -l 10 -fn Monospace-16 -theme "~/.config/rofi/onedark.rasi") ; then
	echo "$emoji" | cut -f1 -d' ' | tr -d '\n' | xclip -selection clipboard
	notify-send "$(xclip -o -selection clipboard) copied to clipboard."
fi

