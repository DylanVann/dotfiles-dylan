# Shell colors using the terminal's own 16-color palette instead of hard-coded
# hex values, so fish follows whichever Ghostty theme is active (Xcode System
# Light in the macOS light appearance, Xcode System Dark in dark). The slot
# names below are chosen for the Xcode palettes: blue is Xcode's blue,
# magenta its keyword pink, red its string color, cyan its purple, yellow its
# number color, brblack its comment grey.

if not status is-interactive
    exit
end

# Syntax highlighting
set --global fish_color_normal normal
set --global fish_color_command blue
set --global fish_color_keyword magenta
set --global fish_color_param normal
set --global fish_color_option normal
set --global fish_color_quote red
set --global fish_color_redirection cyan
set --global fish_color_end yellow
set --global fish_color_error brred --bold
set --global fish_color_comment brblack
set --global fish_color_autosuggestion brblack
set --global fish_color_operator cyan
set --global fish_color_escape brcyan
set --global fish_color_cwd blue
set --global fish_color_cwd_root red --bold
set --global fish_color_user magenta
set --global fish_color_host cyan
set --global fish_color_host_remote green
set --global fish_color_status red
set --global fish_color_cancel --reverse
set --global fish_color_history_current --bold
set --global fish_color_valid_path --underline

# Selections/pager
set --global fish_color_selection --reverse
set --global fish_color_search_match --reverse
set --global fish_pager_color_completion normal
set --global fish_pager_color_description brblack
set --global fish_pager_color_prefix magenta --bold
set --global fish_pager_color_progress brblack
set --global fish_pager_color_selected_background --reverse

# fzf: the 16-color scheme uses the terminal palette too.
set --global --export FZF_DEFAULT_OPTS "--color=16"
