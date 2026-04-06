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

# Source .zsh_custom if it exists
# (i.e. where I store device-dependent stuff)
[[ -f ~/.zsh_custom ]] && source ~/.zsh_custom

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
