# set prompt
PROMPT="> "
RPROMPT="[%~]"
PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
PROMPT="%{${fg[green]}%}%n%{${fg[blue]}%}@%m%{${reset_color}%}%# "
