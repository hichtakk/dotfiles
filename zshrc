# ~/.zshrc

## Environment variable configuration

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# set prompt
PROMPT="> "
RPROMPT="[%~]"
PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
PROMPT="%{${fg[green]}%}%n%{${fg[blue]}%}@%m%{${reset_color}%}%# "

# auto change directory
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep sound when complete list displayed
setopt nolistbeep


## keybinds
bindkey -e # emacs like keybind
bindkey "\e[Z" reverse-menu-complete # 'shift-tab' to reverse completion


# completion
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit -u

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work


# Programming environments
## Golang
export GOPATH=${HOME}/.golang.d

## Perl
# for perl local warning
export PERL_BADLANG=0

## Python
# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi


# path
typeset -U path cdpath fpath manpath
path=(
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    /usr/bin(N-/)
    /bin(N-/)
    /usr/sbin(N-/)
    /sbin(N-/)
    ${HOME}/local/bin(N-/)
    ${HOME}/.pyenv(N-/)
)


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


# load config
function _load-inits() {
    ZSHDIR=~/.zsh.d
    for init in `ls $ZSHDIR`; do
        source ${ZSHDIR}/$init
    done
}
_load-inits
