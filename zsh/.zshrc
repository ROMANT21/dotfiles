# shell history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Don't navigate to directory
# by typing its name
unsetopt autocd

# Highlighted tab menu
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# Set ctrl key commands
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey '^[[Z' reverse-menu-complete

# syntax highlightning
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[comment]='fg=red,bold'

# Add local binaries to PATH
export PATH="$HOME/.local/bin:$PATH"

# starship
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
eval "$(starship init zsh)"
