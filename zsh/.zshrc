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
POWERLEVEL9K_MODE="awesome-patched"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
plugins=(zsh-syntax-highlighting zsh-autosuggestions git vi-mode)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vim=nvim
alias ls=lsd
alias j=z
alias jj=zi
alias lg=lazygit
alias bt=btop

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
DEFAULT_USER=$(whoami)
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# Gruvbox color scheme
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'

# Darcula color scheme
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color=dark
# --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
# --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'
#source /usr/share/fzf/completion.zsh
#source /usr/share/fzf/key-bindings.zsh

# catppuccin color theme macchiato
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" \
--reverse \
--border rounded \
--no-info \
--pointer=' ' \
--marker=' ' \
--ansi \
--color=border:#1e1e2e,bg+:#181c24,bg:#0D1116,spinner:#F712FF,hl:#987afb \
--color=fg:#ebfafa,header:#987afb,info:#0D1116,pointer:#f16c75 \
--color=marker:#19dfcf,fg+:#37f499,prompt:#f16c75,hl+:#04d1f9"

#
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS" \
# --reverse \
# --border rounded \
# --no-info \
# --pointer=' ' \
# --marker=' ' \
# --ansi \
# --color=border:#9991ab,bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#9991ab,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
#
export FZF_CTRL_R_OPTS=$FZF_CTRL_R_OPTS"--border-label=' history ' \
--prompt='  '"

export FZF_CTRL_T_OPTS=$FZF_CTRL_T_OPTS"--border-label=' find files' \
--prompt='  ' \
--preview 'bat --color=always --style=numbers --line-range=:500 {}'"

export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/.config/bin

# Set vi mode for bash/zsh shell
# set -o vi

# # tmuxp settings
# export DISABLE_AUTO_TITLE='true'
# alias tpl='tmuxp load '
#
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

# obsidian vault location
export SECOND_BRAIN=~/'Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes Workspace/'

# lazygit config change directory
export XDG_CONFIG_HOME="$HOME/.config"

# for ls colors using vivid
export LS_COLORS="$(vivid generate $HOME/.config/vivid/themes/custom-theme.yml)"

# bat color theme
export BAT_THEME="Catppuccin-mocha"

eval "$(zoxide init zsh)"

# git config
export GIT_CONFIG="$HOME/.gitconfig"
#
# Sketchybar interactivity overloads
function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

function zen () {
  "$HOME/.config/sketchybar/plugins/zen.sh $1"
}
