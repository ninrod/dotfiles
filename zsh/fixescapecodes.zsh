# various escape code fixes

# pgdown,pgup, home, end, delete, backspace and C-arrow keys
bindkey "^[[1~" beginning-of-line # home key
bindkey "^[[H" beginning-of-line # home key
bindkey "^[[4~" end-of-line # end key
bindkey "^[[F" end-of-line # end key

bindkey "^H" backward-delete-char # backspace key
bindkey "^?" backward-delete-char # backspace key
bindkey "^[[3~" delete-char # delete key

bindkey "^[OD" backward-word # C-< in tmux
bindkey "^[OC" forward-word # C-> in tmux
bindkey "^[[1;5D" backward-word # C-< outside tmux
bindkey "^[[1;5C" forward-word # C-> outside tmux

bindkey "^[[5~" up-line-or-search # pgup
bindkey "^[[6~" down-line-or-search #pgdown

# numeric keypad return fix (enter)
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]] && [[ -z ${EMACS+x} ]]; then
  bindkey "${terminfo[kent]}" accept-line 
fi

# Numeric Keypad fixes
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
bindkey -s "^[Ol" "+"
bindkey -s "^[OS" "-"
bindkey -s "^[OR" "*"
bindkey -s "^[OQ" "/"
