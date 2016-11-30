if [[ -z ${EMACS+x} ]]; then
  export EDITOR="v"

  # simplest possible vi key configuration
  # no delays when switching keymaps
  # export KEYTIMEOUT=5
  # bootstrap vi-mode
  # bindkey -v

  # much more complex vi keys configuration
  source ~/.zsh.d/nin-vi-mode.zsh
else
  # export KEYTIMEOUT=1
  # bindkey -v
  source ~/.zsh.d/nin-vi-mode.zsh
fi

source ~/.zsh.d/expand-alias.zsh
