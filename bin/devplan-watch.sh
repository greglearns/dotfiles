#!/usr/bin/env bash

FILE=$1
CODE=~/code/devplan-code/result/bin/devplan
SHOW_COMMENTS=${2:-false}
SHOW_DONE=${3:-false}
DEPTH=${4:-3}
MATCH=${5:'^\. Devplan'}
echo $FILE, $SHOW_COMMENTS, $SHOW_DONE, $DEPTH,$MATCH.
ls $FILE | entr -c $CODE /_ $SHOW_DONE $SHOW_COMMENTS $DEPTH "$MATCH"
