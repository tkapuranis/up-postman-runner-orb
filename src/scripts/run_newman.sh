#!/usr/bin/env bash
# shellcheck source=/dev/null

# Source the bash env if TESTRAIL_TITLE is empty
if [ -z "$TESTRAIL_TITLE" ]; then
  source "$BASH_ENV"
  echo "$TESTRAIL_TITLE"
fi

# Initialize NEWMAN_ARGS with collection value
NEWMAN_ARGS="$COLLECTION"
echo "$NEWMAN_ARGS"

# Appends Newman CLI args
buildNewmanCommand() {
    NEWMAN_ARGS+=$1
    echo "$NEWMAN_ARGS"
}

# Evaluate Newman args and build run command
if [ "$ENVIRONMENT" != "" ]; then
    buildNewmanCommand " --environment $ENVIRONMENT"
fi

if [ "$REPORTERS" != "" ]; then
    buildNewmanCommand " --reporters $REPORTERS"
fi

if [ "$GLOBALS" != "" ]; then
    buildNewmanCommand " --globals $GLOBALS"
fi

if [ "$ITERATION_COUNT" != "" ]; then
    buildNewmanCommand " --iteration-count $ITERATION_COUNT"
fi

if [ "$ITERATION_DATA" != "" ]; then
    buildNewmanCommand " --iteration-data $ITERATION_DATA"
fi

if [ "$FOLDER" != "" ]; then
    buildNewmanCommand " --folder $FOLDER"
fi

if [ "$EXPORT_ENVIRONMENT" != "" ]; then
    buildNewmanCommand " --export-environment $EXPORT_ENVIRONMENT"
fi

if [ "$EXPORT_GLOBALS" != "" ]; then
    buildNewmanCommand " --export-globals $EXPORT_GLOBALS"
fi

if [ "$EXPORT_COLLECTION" != "" ]; then
    buildNewmanCommand " --export-collection $EXPORT_COLLECTION"
fi

if [ "$TIMEOUT" != "" ]; then
    buildNewmanCommand " --timeout $TIMEOUT"
fi

if [ "$TIMEOUT_REQUEST" != "" ]; then
    buildNewmanCommand " --timeout-request $TIMEOUT_REQUEST"
fi

if [ "$TIMEOUT_SCRIPT" != "" ]; then
    buildNewmanCommand " --timeout-script $TIMEOUT_SCRIPT"
fi

if [ "$INSECURE" != "" ]; then
    buildNewmanCommand " --insecure $INSECURE"
fi

if [ "$IGNORE_REDIRECTS" != "" ]; then
    buildNewmanCommand " --ignore-redirects $IGNORE_REDIRECTS"
fi

if [ "$DELAY_REQUEST" != "" ]; then
    buildNewmanCommand " --delay-request $DELAY_REQUEST"
fi

if [ "$ADDITIONAL_OPTIONS" != "" ]; then
    buildNewmanCommand " $ADDITIONAL_OPTIONS"
fi

# Execute Newman command
echo newman args: "$NEWMAN_ARGS"
newman run "$NEWMAN_ARGS"