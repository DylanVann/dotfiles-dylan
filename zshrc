# Path
export PATH="$HOME/.bin:$PATH"

# RBENV
eval "$(rbenv init - --no-rehash zsh)"

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Properly report term color. Fixes vim/tmux color issues.
export TERM="xterm-256color"
