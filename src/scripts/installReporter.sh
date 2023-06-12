#!/bin/bash
npm install newman-reporter-testrail@1.0.52 --global
TESTRAIL_RUN_NAME="$CIRCLE_PROJECT_REPONAME $CIRCLE_BRANCH $DATENOW"
echo "$TESTRAIL_RUN_NAME"
echo export TESTRAIL_TITLE="${TESTRAIL_RUN_NAME}" >> "$BASH_ENV"
echo "$BASH_ENV"
source "$BASH_ENV"
echo "$TESTRAIL_TITLE"