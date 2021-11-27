#
# Chrome
# Parse Chrome profiles and enable launch from the terminal.
#

_profiles() {
  if [ -z "$1" ]
  then
    DIR=$HOME/Library/Application\ Support/Google/Chrome
    JQ='.profile.info_cache | keys[] as $k | "\($k) === \(.[$k].user_name)"'
    cat $DIR/Local\ State | jq $JQ
  else
    PROF=$1
    if [ "$PROF" = "0" ]
    then
      PROF=Default
    else
      PROF="Profile $PROF"
    fi

    open -n -a "Google Chrome" --args --profile-directory="$PROF"
  fi
}

alias chrome=_profiles
