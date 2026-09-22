set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x LANG en_US.UTF-8

# Homebrew
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
fish_add_path /opt/homebrew/sbin

# Android
set -x JAVA_HOME /Applications/Android\ Studio.app/Contents/jbr/Contents/Home
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x ANDROID_SDK_ROOT $HOME/Library/Android/sdk
set -x ANDROID_AVD_HOME $HOME/.android/avd
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin

fish_add_path ~/.local/bin

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end

# opencode
test -d $HOME/.opencode/bin; and fish_add_path $HOME/.opencode/bin

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# grok
test -d $HOME/.grok/bin; and fish_add_path $HOME/.grok/bin

# Node | fnm
# Kept LAST on purpose: fish re-prepends $fish_user_paths (which contains
# /opt/homebrew/bin) to PATH every time fish_add_path runs, so fnm's node
# would otherwise be shadowed by Homebrew's node.
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
