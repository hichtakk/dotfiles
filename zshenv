# ~/.zshenv

# vcs_info
## see http://qiita.com/mollifier/items/8d5a627d773758dd8078
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats \
       '(%{%F{white}%K{green}%}%s%{%f%k%})-[%{%F{white}%K{blue}%}%b%{%f%k%}]'
zstyle ':vcs_info:*' actionformats \
       '(%{%F{white}%K{green}%}%s%{%f%k%})-[%{%F{white}%K{blue}%}%b%{%f%k%}|%{%white}%K{red}%}%a%{%f%k%}]'
RPROMPT="%1(v|%F{green}%1v%f|)"

# compinit
#zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:default' list-colors ""
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' completer \
       _oldlist _complete _match _history _ignored _approximate _prefix
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' verbose yes
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"

setopt complete_in_word
setopt glob_complete
setopt hist_expand
setopt no_beep
setopt numeric_glob_sort
setopt magic_equal_subst


# aliases
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias la="ls -la"
alias lf="ls -F"
alias lh="ls -lh"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"

case "${OSTYPE}" in
darwin*)
    alias ldd='otool -L'
    alias ls="ls -G -w"
    ;;
freebsd*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

# color
autoload colors
colors
