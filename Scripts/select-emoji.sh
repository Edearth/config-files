#!/bin/sh

if emoji=$(cat ~/Scripts/emojis-unicode | rofi -dmenu -i -p 'Select emoji' -l 10 -fn Monospace-16 -theme "~/.config/rofi/onedark.rasi") ; then
	old_clipboard="$(xclip -o -selection clipboard)"
	echo "$emoji" | cut -f1 -d' ' | tr -d '\n' | xclip -selection clipboard
	#notify-send "$(xclip -o -selection clipboard) copied to clipboard."
	which xdotool > /dev/null && xdotool key shift+Insert && echo -n "$old_clipboard" | xclip -selection clipboard
fi

