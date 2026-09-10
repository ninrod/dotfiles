# bootstrap, keymap-select and cursor shape management {{{

# no delays when switching keymaps
export KEYTIMEOUT=1

# bootstrap vi-mode
bindkey -v

# }}}
# text objects support {{{

# since zsh 5.0.8, text objects were introduced. Let's use some of them.
# see here for more info: http://www.zsh.org/mla/workers/2015/msg01017.html
# and here: https://github.com/zsh-users/zsh/commit/d257f0143e69c3724466c4c92f59538d2f3fffd1

# using select-bracketed as intructed on: https://github.com/zsh-users/zsh/blob/master/Functions/Zle/select-bracketed#L6
# same as vim c+motion (change inside/around text-object).
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# using select-quoted as instructed on: https://github.com/zsh-users/zsh/blob/master/Functions/Zle/select-quoted#L6
# expands c+motion (change inside/around + text-object) to quotes.
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# }}}
# simple binds {{{

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'go' edit-command-line

bindkey -M vicmd '?' history-incremental-search-backward

# }}}
# my custom widgets {{{

# pressing <ESC> in normal mode is bogus: you need to press 'i' twice to enter insert mode again.
# rebinding <ESC> in normal mode to something harmless solves the problem.
nin-noop() {
  return 0
}
zle -N nin-noop
bindkey -M vicmd '\e' nin-noop

# function para colar do clipboard do Windows no Zsh
zsh-win32yank-paste() {
  local clipboard
  clipboard=$(win32yank.exe -o --lf)
  LBUFFER="${LBUFFER}${clipboard}"
}

# Cria o widget customizado
zle -N zsh-win32yank-paste

# Sobrescreve a tecla 'p' no vi-mode para usar a function
bindkey -M vicmd 'p' zsh-win32yank-paste


# function para enviar a selection do vi-mode para o clipboard do Windows
zsh-win32yank-yank() {
  zle vi-yank
  print -r -- "$CUTBUFFER" | win32yank.exe -i --crlf
}

# Cria o widget customizado no ZLE
zle -N zsh-win32yank-yank

# Remapeia 'y' e 'Y' no modo de comando e selection visual
bindkey -M vicmd 'y' zsh-win32yank-yank
bindkey -M vicmd 'Y' zsh-win32yank-yank
bindkey -M visual 'y' zsh-win32yank-yank

# }}}
