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