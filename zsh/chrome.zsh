#
# Chrome
# Parse Chrome profiles and enable launch from the terminal.
# cd ~/Library/Application\ Support/Google/Chrome
# cat Local\ State | jq
#
# cat $HOME/Library/Application\ Support/Google/Chrome/Local\ State| jq '.profile.info_cache | keys[] as $k | "\($k) === \(.[$k].user_name) [\(.[$k].name)]'
# cat $HOME/Library/Application\ Support/Google/Chrome/Local\ State| jq '.profile.info_cache | [to_entries[] | {key, value}]'
# cat $HOME/Library/Application\ Support/Google/Chrome/Local\ State| jq '.profile.info_cache | to_entries[] | select(any(.value; .name=="DXOS")) | .key'
# cat $HOME/Library/Application\ Support/Google/Chrome/Local\ State| jq '.profile.info_cache | to_entries[] | select(any(.value; .name | startswith("DX"))) | .key'
# cat $HOME/Library/Application\ Support/Google/Chrome/Local\ State| jq '.profile.info_cache | to_entries[] | select(any(.value; .name | test("dx"; "i"))) | .key'
#

chrome_profiles() {
  DIR=$HOME/Library/Application\ Support/Google/Chrome
  FILE=Local\ State

  if [ -z "$1" ]
  then
    # Extract values.
    # https://stedolan.github.io/jq/tutorial
    JQ=".profile.info_cache | [to_entries[] | {profile:.key, name:.value.name, user_name:.value.user_name}]"

    # Output table.
    cat $DIR/$FILE | jq $JQ | jq -r '(["PROFILE", "NAME", "USERNAME"]), (.[] | [.profile, .name, .user_name]) | @tsv' | column -t -s $'\t'
  else
    if [ "$1" = "0" ]
    then
      PROFILE="Default"
    else
      JQ=".profile.info_cache | to_entries[] | select(any(.value; .name | test(\"$1\"; \"i\"))) | .key"
      PROFILE=$(cat $DIR/$FILE | jq --raw-output $JQ)
    fi

    echo "Chrome: $PROFILE"
    open -n -a "Google Chrome" --args --profile-directory=$PROFILE
  fi
}

alias chrome=chrome_profiles
alias c=chrome_profiles
