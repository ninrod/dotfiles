if [[ -z ${EMACS+x} ]]; then
  export EDITOR="vim"

  # no delays when switching keymaps
  export KEYTIMEOUT=5
  bindkey -v
  autoload -Uz edit-command-line
  zle -N edit-command-line
  bindkey -M vicmd 'gs' edit-command-line
  # bindkey -M vicmd '?' history-incremental-search-backward
else
  export EDITOR="emacsclient"
  bindkey -e
  ## command specific history search
  ### emacs bindings
  bindkey "^[[A" history-beginning-search-backward
  bindkey "^[[B" history-beginning-search-forward
fi
