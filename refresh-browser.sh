#!/bin/bash

TYPE=${1:-Chrome Canary}
# osascript -e 'tell application "Google Chrome" to tell the active tab of its first window to reload'
osascript -e "tell application \"Google $TYPE\" to tell the active tab of its first window to reload"

