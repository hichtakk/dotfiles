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

_nyan() {
    _arguments \
        '(- *)'{-h,--help}'[show help]' \
        '*: :__nyan_modes'
}
__nyan_modes() {
  _values \
    'mode' \
    'neko[kawaii normal neko]' \
    'usagi[kawaii usa-neko]' \
    'kuma[kawaii kuma-neko]' \
    'github[kawaii octcat]'
}

compdef _nyan nyan


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
