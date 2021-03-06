#!/bin/bash

if which osascript > /dev/null; then
  TYPE=${1:-Chrome Canary}
  # TYPE=${1:-Chrome}
  echo refreshing $TYPE
  osascript -e "tell application \"Google $TYPE\" to tell the active tab of its first window to reload"
fi


if which xdotool > /dev/null; then
  BROWSER=Chrome
  RELOAD="CTRL+R"

  CUR_WID=$(xdotool getwindowfocus)

  #gets the first $BROWSER window, if you have more than one
  #$BROWSER window open, it might not refresh the right one,
  #as an alternative you can search by the window/html title
  WID=$(xdotool search --onlyvisible --class $BROWSER|head -1)
  #TITLE="window/html file title"
  #WID=$(xdotool search --title "$TITLE"|head -1)
  xdotool windowfocus $WID
  #xdotool windowactivate $WID
  xdotool key --clearmodifiers ${RELOAD}
  #xdotool windowactivate $CUR_WID
  xdotool windowfocus $CUR_WID
fi

