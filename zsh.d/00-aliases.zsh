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