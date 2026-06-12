#!/usr/bin/env bash

TEMP=4000

if pgrep -x gammastep > /dev/null; then
    # If running → turn off
    pkill -x gammastep &
else
    # If not running → turn on
    gammastep -O $TEMP &
fi
