set fish_greeting

set -x LANG en_US.UTF-8

# PATH
# Every entry is declared here with `fish_add_path -g` (session-only), so this
# file is the whole story. Without -g, fish_add_path writes to the universal
# $fish_user_paths in fish_variables, where entries outlive their removal from
# this file.

# Homebrew
fish_add_path -g /opt/homebrew/bin /opt/homebrew/sbin

fish_add_path -g ~/.local/bin

# Ghostty's CLI (ghostty +validate-config, etc.)
fish_add_path -g /Applications/Ghostty.app/Contents/MacOS

# Android
set -x JAVA_HOME /Applications/Android\ Studio.app/Contents/jbr/Contents/Home
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x ANDROID_SDK_ROOT $HOME/Library/Android/sdk
set -x ANDROID_AVD_HOME $HOME/.android/avd
fish_add_path -g $ANDROID_HOME/cmdline-tools/latest/bin

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
fish_add_path -g $PNPM_HOME

# bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path -g $BUN_INSTALL/bin

# asdf (ruby); the shims dir is all the Go rewrite needs on PATH
test -d $HOME/.asdf/shims; and fish_add_path -g $HOME/.asdf/shims

# JetBrains Toolbox shell scripts
test -d $HOME/.jetbrains; and fish_add_path -g $HOME/.jetbrains

# maestro (mobile UI testing)
test -d $HOME/.maestro/bin; and fish_add_path -g $HOME/.maestro/bin

# rover (Apollo GraphQL)
test -d $HOME/.rover/bin; and fish_add_path -g $HOME/.rover/bin

# opencode
test -d $HOME/.opencode/bin; and fish_add_path -g $HOME/.opencode/bin

# grok
test -d $HOME/.grok/bin; and fish_add_path -g $HOME/.grok/bin

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# Node | fnm
# Kept last on purpose: every fish_add_path call re-prepends $fish_user_paths
# (which holds /opt/homebrew/bin) to PATH, which would shadow fnm's node.
if type -q fnm
    fnm env --use-on-cd --version-file-strategy=recursive | source
end

type -q zoxide; and zoxide init fish | source

# Abbreviations
abbr -a -- - 'cd -'
abbr -a .. 'cd ..'
abbr -a ... 'cd ../..'
abbr -a .... 'cd ../../..'
abbr -a g git
abbr -a t tmux
abbr -a cl clear
abbr -a ll 'eza -la'
abbr -a localip 'ipconfig getifaddr en0'
abbr -a ip 'dig +short myip.opendns.com @resolver1.opendns.com'
abbr -a flush 'dscacheutil -flushcache; and sudo killall -HUP mDNSResponder'
