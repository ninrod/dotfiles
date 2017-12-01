if [[ ! -d $HOME/.fzf ]]; then
  print "$HOME/.fzf is missing. no fzf features will be loaded."
  return
fi

# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="$PATH:$HOME/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"

# customization
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'