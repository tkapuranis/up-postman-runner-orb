#!/bin/bash
DATENOW=$( date '+%F_%H:%M:%S' )
TITLE="$CIRCLE_PROJECT_REPONAME $CIRCLE_BRANCH $DATENOW"
echo "$TITLE"
echo export TESTRAIL_TITLE="${TITLE}" >> "$BASH_ENV"
source "$BASH_ENV"