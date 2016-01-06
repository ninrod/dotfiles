# Ensures that $terminfo values are valid and updates editor information when
# the keymap changes.

# configurações do modo vi do zsh
export KEYTIMEOUT=1

function zle-keymap-select zle-line-init zle-line-finish {
  # The terminal must be in application mode when ZLE is active for $terminfo
  # values to be valid.
  if (( ${+terminfo[smkx]} )); then
    printf '%s' ${terminfo[smkx]}
  fi
  if (( ${+terminfo[rmkx]} )); then
    printf '%s' ${terminfo[rmkx]}
  fi

  zle reset-prompt
  zle -R
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
zle -N edit-command-line

bindkey -v

# allow vim to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 's' edit-command-line

bindkey -M vicmd 'k' vi-up-line-or-history
bindkey -M vicmd 'j' vi-down-line-or-history

# isso aqui é para que o `ci(` text object funcione no zle (somente a partir da versão 5.0.8 do zsh)
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# esse código faz com que o `vi"` funcione
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

### fix de escape codes do zsh

# home key
bindkey "^[[1~" beginning-of-line

# end key
bindkey "^[[4~" end-of-line

#delete key and backspace
bindkey "^[[3~" delete-char
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

#numeric keypad return (enter)
bindkey "${terminfo[kent]}" accept-line

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[blue]%}-- NORMAL --%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi
