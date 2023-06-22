# Added by Toolbox App
export PATH="$PATH:/Users/burdon/Library/Application Support/JetBrains/Toolbox/scripts"

# Set PATH, MANPATH, etc., for Homebrew.
if [ -d /opt/homebrew ]; then
  # Apple silicon
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  # Intel
  eval "$(/usr/local/bin/brew shellenv)"
fi
