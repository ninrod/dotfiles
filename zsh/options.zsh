# defining word endings
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# history config options
HISTFILE=$HOME/.zsh_history
HISTSIZE=2000000
SAVEHIST=2000000
setopt append_history
setopt extended_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups
setopt hist_ignore_space

# dir navigation options
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
setopt auto_cd

# glob options
setopt extended_glob # allows us to use ^ to negate globs
unsetopt nomatch # but when pattern matching fails, simply use the command as is. See robbyrussell/oh-my-zsh#449

# better completion
setopt menu_complete
