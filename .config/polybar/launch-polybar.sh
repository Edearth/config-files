#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bottom_bar >>/tmp/bottom_bar.log 2>&1 &

echo "Bar launched..."
