if [[ -z ${EMACS+x} ]]; then
  export EDITOR="e"

  # simplest possible vi key configuration
  # no delays when switching keymaps
  export KEYTIMEOUT=5
  # bootstrap vi-mode
  bindkey -v

  # much more complex vi keys configuration
  # source ~/.zsh.d/nin-vi-mode.zsh
else
  export EDITOR="emacsclient"
  bindkey -e
  ## command specific history search
  ### emacs bindings
  bindkey "^[[A" history-beginning-search-backward
  bindkey "^[[B" history-beginning-search-forward
fi
