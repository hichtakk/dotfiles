# ~/.zshrc

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## keybinds
bindkey -d

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
    ${HOME}/go/bin(N-/)
    ${HOME}/.cargo/bin(N-/)
)

# load config
function _init-loader() {
    export ZSHDIR=${:-~/.zsh.d}
    if [ -e $ZSHDIR ]; then
      for init in `ls $ZSHDIR/*.zsh`; do
          source $init
      done
    else
      echo "Directory ${ZSHDIR} not found. Unable to load zsh config."
    fi
}
_init-loader
