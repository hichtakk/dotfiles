# set prompt
RPROMPT="[%~]"
PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
PROMPT="%{${fg[green]}%}%n%{${fg[blue]}%}@%m%{${reset_color}%}%# "


# VCS info to prompt
# see http://tkengo.github.io/blog/2013/05/12/zsh-vcs-info/
#     http://qiita.com/mollifier/items/8d5a627d773758dd8078

autoload -Uz vcs_info

# git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{green}+"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}*"
zstyle ':vcs_info:git:*' formats '[%r:%b:%c%u%f]'
zstyle ':vcs_info:git:*' actionformats '[%r:%c%u%b%f] <!%a>'

precmd() { vcs_info }   # call vcs_info before prompt
setopt prompt_subst
PROMPT='${vcs_info_msg_0_}> '

autoload -Uz is-at-least
if is-at-least 4.3.11; then
    zstyle ':vcs_info:git+set-message:*' hooks \
                                           git-hook-begin \
                                           git-untracked
    function +vi-git-hook-begin() {
      if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
        # 0以外を返すとそれ以降のフック関数は呼び出されない
        return 1
      fi
      return 0
    }

    # untracked ファイル表示
    function +vi-git-untracked() {
      if command git status --porcelain 2> /dev/null \
          | awk '{print $1}' \
          | command grep -F '??' > /dev/null 2>&1 ; then

          # unstaged (%u) に追加
          hook_com[unstaged]+='%f%F{red}?'
      fi
    }
fi
