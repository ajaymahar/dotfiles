#
# ███████╗██╗███████╗██╗  ██╗
# ██╔════╝██║██╔════╝██║  ██║
# █████╗  ██║███████╗███████║
# ██╔══╝  ██║╚════██║██╔══██║
# ██║     ██║███████║██║  ██║
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
# A smart and user-friendly command line
# https://fishshell.com/


# TODO: waiting for fish support
# https://github.com/pkgxdev/pkgx/issues/845
# source (pkgx --shellcode)

eval (/usr/local/bin/brew shellenv)
zoxide init fish | source # 'ajeetdsouza/zoxide'
direnv hook fish | source # https://direnv.net/

##########FISH  THEME#######################

set -U fish_config theme save "Catppuccin Mocha"

##########PROMPT SETTING#######################
# set -U hydro_symbol_prompt "❱"
set -U hydro_symbol_prompt ""
# set -U hydro_symbol_git_dirty " ✗"
set -U hydro_symbol_git_ahead "↑"
set -U hydro_symbol_git_behind "↓"
# set -U hydro_color_prompt white
# set -U hydro_color_pwd green
# set -U hydro_color_git red
set -U hydro_fetch true
set -U fish_prompt_pwd_dir_length 0
set -U hydro_cmd_duration_threshold 1000
set -U hydro_ignored_git_paths " "
##############################################
set -g direnv_fish_mode eval_on_arrow                           # trigger direnv at prompt, and on every arrow-based directory change (default)

set -U fish_greeting                                            # disable fish greeting
# set -U fish_key_bindings fish_vi_key_bindings
set -U fish_key_bindings fish_default_key_bindings 

set -Ux EDITOR nvim                                             # 'neovim/neovim' text editor
set -Ux VISUAL nvim
set -Ux MANPAGER "sh -c 'col -bx | bat -l man'"

############################  TMUX ###############################################################
# fzf default option
set -Ux FZF_DEFAULT_OPTS "\
--reverse \
--border rounded \
--no-info \
--pointer=' ' \
--marker=' ' \
--ansi \
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,prompt:#cba6f7,hl+:#f38ba8"

set -Ux FZF_TMUX_OPTS "-p 55%,60%"
set -Ux FZF_CTRL_R_OPTS "--border-label=' history ' --prompt='  '"
set -Ux FZF_CTRL_T_OPTS "--border-label=' find files' --prompt='  '"

###################################################################################################
set -Ux TMUX_CONF $HOME/.config/tmux/tmux.conf                                                      # Export tmux config file
set -Ux SECOND_BRAIN ~/'Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes Workspace/'     # obsidian vault location
set -Ux XDG_CONFIG_HOME "$HOME/.config"                                                             # lazygit config change directory
set -Ux LS_COLORS "$(vivid generate $HOME/.config/vivid/themes/catppuciin-mocha.yml)"               # for ls colors using vivid

# golang - https://golang.google.cn/
set -Ux GOPATH (go env GOPATH)
######################  ADDING PATHS #########################
fish_add_path $GOPATH/bin
fish_add_path $HOME/.config/bin
##############################################################
