if [[ -z ${EMACS+x} ]]; then
  export EDITOR="vim"

  # simplest possible vi key configuration
  # no delays when switching keymaps
  # bootstrap vi-mode
  # export KEYTIMEOUT=1
  # bindkey -v

  # much more complex vi keys configuration
  source ~/.zsh.d/nin-vi-mode.zsh
else
  # export KEYTIMEOUT=1
  # bindkey -v
  source ~/.zsh.d/nin-vi-mode.zsh
fi

source ~/.zsh.d/expand-alias.zsh

if [[ $TERM = linux ]]; then
  sudo loadkeys ~/.options/arch/vconsole/rebinds.map
fi
