# fish is the login shell; this is the safety net for anything that spawns zsh
# (scripts with a zsh shebang, tools that hard-code it). Just enough to find
# Homebrew and Node.

# Homebrew (static equivalent of `brew shellenv`, which costs ~15ms per shell)
typeset -U path fpath
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
path=(/opt/homebrew/bin /opt/homebrew/sbin $HOME/.local/bin $path)
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
export INFOPATH="/opt/homebrew/share/info${INFOPATH:+:$INFOPATH}"

# Node | fnm
command -v fnm > /dev/null && eval "$(fnm env --use-on-cd)"
