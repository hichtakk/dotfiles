# 00-prompt.zsh

export STARSHI_CONFIG="${HOME}/.config/starship.toml"

if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
else
  # Fallback: simple prompt if starship is not installed
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%F{green}%n%F{blue}@%m%f%# " ||
    PROMPT="%F{cyan}%~%f %# "
fi
