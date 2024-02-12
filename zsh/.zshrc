# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"
plugins=(zsh-syntax-highlighting zsh-autosuggestions git vi-mode)
source $ZSH/oh-my-zsh.sh

# alias
alias vim=nvim
alias ls=lsd
alias j=z
alias jj=zi
alias lg=lazygit
alias bt=btop

# Golang Env Varialbes
# export GOPATH=$HOME/code/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ajay/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ajay/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ajay/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ajay/google-cloud-sdk/completion.zsh.inc'; fi

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
# 
# 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#source /usr/share/fzf/completion.zsh
#source /usr/share/fzf/key-bindings.zsh

# catppuccin color theme macchiato
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" \
# --reverse \
# --border rounded \
# --no-info \
# --pointer=' ' \
# --marker=' ' \
# --ansi \
# --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
# --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
# --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

# catppuccin mocha color theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" \
--reverse \
--border rounded \
--no-info \
--pointer=' ' \
--marker=' ' \
--ansi \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export FZF_CTRL_R_OPTS=$FZF_CTRL_R_OPTS"--border-label=' history ' \
--prompt='  '"

export FZF_CTRL_T_OPTS=$FZF_CTRL_T_OPTS"--border-label=' find files' \
--prompt='  '"

export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/.config/bin

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"
eval "$(direnv hook zsh)"

# Set default Editor  as nvim
export EDITOR=/usr/local/bin/nvim
export PATH="/usr/local/opt/libpq/bin:$PATH"

# zoxide
#
# export _ZO_ECHO=1 # Print the matched directory before navigating to it
#
## Specifies the direcotry in which the data is stored 
# export _ZO_DATA_DIR='/Users/ajay/Library/Application Support/zoxide' # Defualt create db on '/Users/ajay/Library/Application Support/zoxide' location
#
# Exclude the specified dir from the database
# export _ZO_EXCLUDE_DIRS='$HOME:$HOME/private/*'

# Export tmux config file
export TMUX_CONF=$HOME/.config/tmux/tmux.conf

eval "$(zoxide init zsh)"
