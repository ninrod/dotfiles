if [[ -z ${EMACS+x} ]]; then
  export EDITOR="e"
  source ~/.zsh.d/nin-vi-mode.zsh
else
  export EDITOR="emacsclient"
  bindkey -e
  ## command specific history search
  ### emacs bindings
  bindkey "^[[A" history-beginning-search-backward
  bindkey "^[[B" history-beginning-search-forward
fi
