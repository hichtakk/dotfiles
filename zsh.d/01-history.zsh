# history
alias history-all="history -E 1"
HISTFILE=~/.zsh_history
HISTSIZE=100000     # number of records saved on memory
SAVEHIST=100000     # number of records saved on file
setopt extended_history  # add timestamp to history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end