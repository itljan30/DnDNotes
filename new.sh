#!/bin/bash
#
# Generates a blank note for the next session using the current date to name it
#

NOTES_DIR="./notes"
CUR_DATE=$(date +"%Y-%m-%d")
CUR_SESSION=0

for note in $NOTES_DIR/*; do
    if [[ -f $note ]]; then
        PREVIOUS_SESSION=$(echo $note | grep -oP '(?<=session-)\d+') # grep command taken from AI so if bug look here
        if [[ $PREVIOUS_SESSION -gt $CUR_SESSION ]]; then
            CUR_SESSION=$PREVIOUS_SESSION
        fi
    fi
done

CUR_SESSION=$((CUR_SESSION + 1))

touch "$NOTES_DIR/$CUR_DATE-session-$CUR_SESSION.md"

echo "Created blank note for session $CUR_SESSION"
