# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ninrod/.fzf/bin* ]]; then
  export PATH="$PATH:/home/ninrod/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ninrod/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/ninrod/.fzf/shell/key-bindings.zsh"

# customization
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'