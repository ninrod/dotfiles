# helper functions {{{

# terminal cursor shape support
# parameters ($1)
  # block shape: 2
  # underline: 4
  # line shape: 6
# tmux escape string: echo -ne "\ePtmux;\e\e[2 q\e\\"
# normal escape string: echo -ne "\e[6 q"
# more info: https://github.com/mintty/mintty/wiki/CtrlSeqs#cursor-style
nin-cursor-shape-mintty() {
  local tmuxescape="\ePtmux;\e\e[${1} q\e\\"
  local normalescape="\e[${1} q"
  if [[ -n ${TMUX+x} ]]; then
    echo -ne $tmuxescape
  else
    echo -ne $normalescape
  fi
}
nin-cursor-shape-mintty-block() {
  nin-cursor-shape-mintty 2
}
nin-cursor-shape-mintty-line() {
  nin-cursor-shape-mintty 6
}
nin-cursor-shape-mintty-underscore() {
  nin-cursor-shape-mintty 4
}

nin-cursor-shape-block() {
  nin-cursor-shape-mintty-block
}
nin-cursor-shape-line() {
  nin-cursor-shape-mintty-line
}
nin-cursor-shape-underscore() {
  nin-cursor-shape-mintty-underscore
}

# }}}
# bootstrap, keymap-select and cursor shape management {{{

# Oliver Kiddle <opk@zsh.org> optimization:
# If you change the cursor shape, consider taking care to reset it when
# not in ZLE. zle-line-finish is only run when ZLE is succcessful so the
# best place for the reset is in POSTEDIT:

if [[ -z ${EMACS+x} ]]; then
  POSTEDIT+=$'\e[2 q'
fi

# manage cursor shape under different keymaps on iTerm2
function zle-keymap-select() {

  if [[ -z ${EMACS+x} ]]; then
    if [[ $KEYMAP = vicmd ]]; then
      nin-cursor-shape-underscore
    elif [[ $KEYMAP = main ]]; then
      nin-cursor-shape-line
    fi
  fi

  zle reset-prompt
  zle -R
}
zle -N zle-keymap-select

# when we hit <cr> return cursor shape to block
nin-accept-line() {
  nin-cursor-shape-block
  zle .accept-line
}
zle -N nin-accept-line

# ^J and ^M are the same as <cr>

if [[ -z ${EMACS+x} ]]; then
  bindkey "^@" nin-accept-line
  bindkey "^J" nin-accept-line
  bindkey "^M" nin-accept-line
  bindkey -M vicmd "^@" nin-accept-line
  bindkey -M vicmd "^J" nin-accept-line
  bindkey -M vicmd "^M" nin-accept-line
fi

# when we cancel the current command, return the cursor shape to block
TRAPINT() {
  if [[ -z ${EMACS+x} ]]; then
    nin-cursor-shape-block
    print -n " ${Purple}[${Cyan}ctrl-c${Purple}]${Rst}"
  else
    print -n " [ctrl-c]"
  fi
  return $(( 128 + $1 ))
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

# no delays when switching keymaps
export KEYTIMEOUT=5
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

# add support for the surround plugin emulation widget
# due to KEYTIMEOUT set to a low number, you have to press the chords very, very fast.
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround

# }}}
# simple binds {{{

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'gs' edit-command-line

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

# }}}
