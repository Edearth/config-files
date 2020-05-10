#!/bin/sh

if emoji=$(cat ~/Scripts/emojis-unicode | rofi -dmenu -i -p 'Select emoji' -l 10 -fn Monospace-16 -theme "~/.config/rofi/onedark.rasi") ; then
	old_clipboard="$(xclip -o -selection clipboard)"
	old_primary="$(xclip -o -selection primary)"
	emoji="$(echo -n $emoji | cut -f1 -d' ')"
	echo -n "$emoji" | xclip -selection clipboard
	echo -n "$emoji" | xclip -selection primary
	xdotool key shift+Insert
	echo -n "$old_clipboard" | xclip -selection clipboard
	echo -n "$old_primary" | xclip -selection primary
fi

