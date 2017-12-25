# Pah to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

COMPLETION_WAITING_DOTS="true"

plugins=(git)

export ZSH_THEME="agnoster"

# Path
export PATH="~/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# Ruby - rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Java - jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
export PATH=${JAVA_HOME}/bin:$PATH

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/tools/bin
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# gnubin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# aws
# source ~/.aws_credentials

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# aliases
source ~/.aliases

# lang
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Set default user to shorten prompt.
export DEFAULT_USER="$USER"

# tmuxinator completion
# source ~/.bin/tmuxinator.zsh

# fastlane
export PATH="$HOME/.fastlane/bin/fastlane_lib:$PATH"

# cd ~/repos

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi
