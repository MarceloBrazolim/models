#!/bin/bash
# ------------------------------------------------------------------
# [Hiro Fujisame] switches1
DETAILS="Serves as a complete draft to not start from zero everytime"
# ------------------------------------------------------------------

me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
VERSION=0.1.0
SUBJECT=subject-name-r4nd0nnumb3r
USAGE="./$me [options]"


##### Defaults #####


##### Functions #####

warn() {
rows="%-20s %s\n"
blank="\n"

printf "$blank"
printf "Warning:\n"
printf "  Informative/Warning text goes here"
printf "$blank"
printf "  use this function for important information and stuff"
printf "$blank"
printf "  CUM"
printf "$blank"
printf "$blank"
}

help() {
rows="%-20s %s\n"
blank="\n"

warn
printf "$blank"
printf "Details:\n"
printf "$rows" "  $DETAILS"
printf "$blank"
printf "Usage:\n"
printf "$rows" "  $USAGE"
printf "$blank"
printf "Options:\n"
printf "$rows" "  -h" "shows this menu"
printf "$rows" "  -v" "shows the program version"
printf "$blank"
exit
}


##### Switches #####

if [ $1 ]; then
  while [ -n "$1" ]; do
    case $1 in
      '-h'|'--help')
        help
        exit 0
      ;;
      '-v'|'--version')
        echo $VERSION
        exit 0
      ;;
      *)
        echo "$1: switch unknown"
        echo "To see the help menu, type $me --help."
        exit 1
      ;;

    esac;
    shift;
  done
fi


##### Locks #####

LOCK_FILE=$SUBJECT.lock

if [ -f "$LOCK_FILE" ]; then
   echo "Script is already running"
   exit
fi

trap "rm -f $LOCK_FILE" EXIT
touch $LOCK_FILE


##### Body #####

warn
