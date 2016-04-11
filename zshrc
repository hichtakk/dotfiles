# ~/.zshrc

## Environment variable configuration

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# set prompt
PROMPT="%n@%m> "
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


# history
alias history-all="history -E 1"
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
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


# completion
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit -u

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

## terminal configuration
#unset LSCOLORS
#case "${TERM}" in
#xterm)
#    export TERM=xterm-color
#    ;;
#kterm)
#    export TERM=kterm-color
#    # set BackSpace control character
#    stty erase
#    ;;
#cons25)
#    unset LANG
#    export LSCOLORS=ExFxCxdxBxegedabagacad
#    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#    zstyle ':completion:*' list-colors \
#      'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
#    ;;
#eterm-color)
#    export TERM=xterm-color
#    ;;
#esac


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

#source ~/.zshrc.antigen

# peco
function peco-history-selection() {
    BUFFER=`history -rn 1 | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

##
#if (( ${+commands[peco]} )); then
#  peco-go-to-dir () {
#    local line
#    local selected="$(
#      {
#        (
#          autoload -Uz chpwd_recent_filehandler
#          chpwd_recent_filehandler && for line in $reply; do
#            if [[ -d "$line" ]]; then
#              echo "$line"
#            fi
#          done
#        )
#        ghq list --full-path
#        for line in *(-/) ${^cdpath}/*(N-/); do echo "$line"; done | sort -u
#      } | peco --query "$LBUFFER"
#    )"
#    if [ -n "$selected" ]; then
#      BUFFER="cd ${(q)selected}"
#      zle accept-line
#    fi
#    zle clear-screen
#  }
#  zle -N peco-go-to-dir
#  bindkey '^[g' peco-go-to-dir
#fi

