# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME=""

# Update
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

# Which plugins would you like to load?
plugins=(git colored-man-pages zsh-syntax-highlighting zsh-autosuggestions)

# Fix zsh black ${WORD} highlighting
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]="fg=red,bold"


source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/.local/bin:$PATH

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Configs local to computer are in $ZSH_CONFIG
