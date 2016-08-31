# vcs_info
## see http://qiita.com/mollifier/items/8d5a627d773758dd8078
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats \
       '(%{%F{white}%K{green}%}%s%{%f%k%})-[%{%F{white}%K{blue}%}%b%{%f%k%}]'
zstyle ':vcs_info:*' actionformats \
       '(%{%F{white}%K{green}%}%s%{%f%k%})-[%{%F{white}%K{blue}%}%b%{%f%k%}|%{%white}%K{red}%}%a%{%f%k%}]'
RPROMPT="%1(v|%F{green}%1v%f|)"
