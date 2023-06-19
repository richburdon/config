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


# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
