
# ===============
# Command history
# ===============

# fh - repeat history
function fzf-history() {
  title='fzf-history'
  BUFFER=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --prompt="[${title}]> " | sed 's/ *[0-9]* *//')
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fzf-history
bindkey '^R' fzf-history


# =========
# Processes
# =========

# fkill - kill process
function fzf-kill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}


# ===
# Git
# ===

# fbr - checkout git branch
#fbr() {
#  local branches branch
#  branches=$(git branch -vv) &&
#  branch=$(echo "$branches" | fzf +m) &&
#  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
#}

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
function fzf-git-checkout() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fshow - git commit browser
function fzf-git-commit-browse() {
  git log --graph --color=always \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
          fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
                --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}


# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
function fzf-tmux-session() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}

# fd - cd to selected directory
function fzf-cd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
function fzf-ls-with-a() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}


# cdf - cd into the directory of the selected file
function fzf-cd-with-file() {
  local file
  local dir
  file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

exec-oneliner() {
  local oneliner_f
  oneliner_f="${ONELINER_FILE:-~/.commnad.list}"

  [[ ! -f $oneliner_f || ! -s $oneliner_f ]] && return

  local cmd q k res accept
  while accept=0; cmd="$(
    cat <$oneliner_f \
      | sed -e '/^#/d;/^$/d' \
      | perl -pe 's/^(\[.*?\]) (.*)$/$1\t$2/' \
      | perl -pe 's/(\[.*?\])/\033[31m$1\033[m/' \
      | perl -pe 's/^(: ?)(.*)$/$1\033[30;47;1m$2\033[m/' \
      | perl -pe 's/^(.*)([[:blank:]]#[[:blank:]]?.*)$/$1\033[30;1m$2\033[m/' \
      | perl -pe 's/(!)/\033[31;1m$1\033[m/' \
      | perl -pe 's/(\|| [A-Z]+ [A-Z]+| [A-Z]+ )/\033[35;1m$1\033[m/g' \
      | fzf --ansi --multi --no-sort --tac --query="$q" \
      --print-query --expect=ctrl-v --exit-0
      )"; do
    q="$(head -1 <<< "$cmd")"
    k="$(head -2 <<< "$cmd" | tail -1)"
    res="$(sed '1,2d;/^$/d;s/[[:blank:]]#.*$//' <<< "$cmd")"
    [ -z "$res" ] && continue
    if [ "$k" = "ctrl-v" ]; then
      vim "$oneliner_f" < /dev/tty > /dev/tty
    else
      cmd="$(perl -pe 's/^(\[.*?\])\t(.*)$/$2/' <<<"$res")"
      if [[ $cmd =~ "!$" || $cmd =~ "! *#.*$" ]]; then
        accept=1
        cmd="$(sed -e 's/!.*$//' <<<"$cmd")"
      fi
      break
    fi
  done

  local len
    if [[ -n $cmd ]]; then
      BUFFER="$(tr -d '@' <<<"$cmd" | perl -pe 's/\n/; /' | sed -e 's/; $//')"
      len="${cmd%%@*}"
      CURSOR=${#len}
      if [[ $accept -eq 1 ]]; then
        zle accept-line
      fi
    fi
    zle redisplay
}
zle -N exec-oneliner
bindkey '^x^x' exec-oneliner


function fzf-ghq-look-from-list() {
    local selected
    selected="$(ghq list --full-path | fzf --prompt='[fzf-ghq-look]> ')"
    if [ -n "$selected" ]; then
        BUFFER="cd $selected"
        CURSOR=$#BUFFER
    fi
    zle reset-prompt
}


# Default Options
_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --select-1
    --exit-0
    --exact
    --inline-info
    --prompt='[fzf]> '
    --color fg:-1,bg:-1,hl:$blue,fg+:$green,bg+:-1,hl+:$red
    --color info:-1,prompt:-1,pointer:$green,marker:$base3,spinner:$yellow
    --bind=alt-v:page-up
    --bind=ctrl-v:page-down
    --bind=ctrl-z:toggle-all
    --bind=ctrl-k:kill-line
    --reverse
    --border
    --no-sort
    --tac
    --ansi
    --select-1
    --exit-0
    --bind=\"ctrl-x:execute(LC_ALL=C sed -i '' '/{}/d' $HISTFILE)\"
    --bind=\"ctrl-s:execute({2..})\"
    --bind=\"ctrl-l:execute(vim hoge)\"
  "
    #--bind=\"ctrl-x:execute(LC_ALL=C sed -i '/{}/d' $HISTFILE)\"
}
_gen_fzf_default_opts


_fzf-my_functions() {
    if type "fzf" >/dev/null 2>&1; then
        eval $(grep -E '^function\s+.+\(.*\)' ${HOME}/.zsh.d/* | awk '{print $2}' | sed -e 's/(.*)//' | \
                   fzf --prompt="[fzf-my-functions]> " --preview="type {}" --preview-window=up:10)
    else
        echo "Command fzf not found."
    fi
    zle reset-prompt
}
zle -N _fzf-my_functions
bindkey "^]" _fzf-my_functions
