# Colors please
export CLICOLOR=1

# Big, big history
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE

# Don't store duplicate entires
export HISTCONTROL=ignoredups:erasedups

# Make some commands not show up in history
export HISTIGNORE="open:open *:ls:ls *:cd:cd *:pwd;exit:date:* --help:wget *:curl *"

# Append to history, don't overwrite it
setopt APPEND_HISTORY

# Autocorrect typos in path names when using `cd`
setopt correct

# Editor, use TextMate
export EDITOR="/usr/local/bin/mate -w"

# Don't clear the screen after quitting a manual page
export MANPAGER="less --no-init"

# Commands that run each time a prompt is generated
export PROMPT_COMMAND="prompt-command; $PROMPT_COMMAND"
function prompt-command {
  # Save and reload the history after each command finishes
  # this lets multiple terminal windows work on the history together
  history -a;
  history -c;
  history -r;
  # Set window title to be the current directory
  echo -ne "\033]0;${PWD##*/}\007";
}

# Require Virtualenv for pip install anything
export PIP_REQUIRE_VIRTUALENV=true

# Let Homebrew modify PATH and set some other envs
eval "$(/opt/homebrew/bin/brew shellenv)"

# Go go pyenv
eval "$(pyenv init -)"

# Go go nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# And go go chruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
