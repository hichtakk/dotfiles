# locale
export LC_ALL=en_US.UTF-8

# for perl local warning
export PERL_BADLANG=0


#autoload -Uz vcs_info
#zstyle ':vcs_info:*' formats \
#       '(%{%F{white}%K{green}%}%s%{%f%k%})-[%{%F{white}%K{blue}%}%b%{%f%k%}]'
#zstyle ':vcs_info:*' actionformats \
#       '(%{%F{white}%K{green}%}%s%{%f%k%})-[%{%F{white}%K{blue}%}%b%{%f%k%}|%{%white}%K{red}%}%a%{%f%k%}]'


# pythonbrew functions
#[ -f ${HOME}/.pythonbrew/etc/bashrc ] && source ${HOME}/.pythonbrew/etc/bashrc


# set keybind 'shift-tab' to reverse completion
bindkey "\e[Z" reverse-menu-complete


# ssh 
function ssh_screen(){
    eval long_hostname=\${$#}
    short_hostname=`echo $long_hostname | cut -d. -f 1`
    screen -t $short_hostname ssh "$@"
}

function ssh_tmux() {
    eval long_hostname=\${$#}
    ssh_cmd="/usr/bin/ssh $@"
    short_hostname=`echo $long_hostname | cut -d. -f 1`
    echo $short_hostname
    tmux new-window -n $short_hostname $ssh_cmd
}

if [ x$TERM = xscreen ]; then
    alias ssh=ssh_tmux
fi


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

alias rr="command rm -rf"

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

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
    /usr/X11/bin(N-/)
    ${HOME}/.pythonbrew/bin(N-/)
)

case "${OSTYPE}" in
darwin*)
    #PATH=$PATH:/usr/X11/bin
    PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin
    alias ldd='otool -L'
esac


# Python Library load path setting
#typeset -xT PYTHONPATH python_path
#typeset -U python_path
#python_path=(
#    ./lib
#    #${HOME}/hg/sandbox/python(N-/)
#)


# use lv instead of less
if type lv > /dev/null 2>&1; then
    export PAGER="lv"
else
    export PAGER="less"
fi

if [ "${PAGER}" = "lv" ]; then
    ## -c: ANSI escape sequence color
    ## -l: 1 line
    export LV="-c -l"
else
    alias lv="${PAGER}"
fi

# pyenv
#export PYENV_ROOT=/usr/local/opt/pyenv

