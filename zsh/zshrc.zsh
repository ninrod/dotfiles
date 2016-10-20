# -*- mode: sh -*-

# load user environment {{{

SHELL_USER_CONFIG_FILE="${HOME}/.options/shell-options.conf"
if [[ -e "$SHELL_USER_CONFIG_FILE" ]]; then
  . "$SHELL_USER_CONFIG_FILE"
fi

source $DOTPATH/zsh/envbootstrap.zsh

# }}}

source $DOTPATH/zsh/options.zsh
source $DOTPATH/zsh/completions.zsh

source $DOTPATH/zsh/termcolors.zsh
source $DOTPATH/zsh/fixescapecodes.zsh
source $DOTPATH/zsh/zleconfig.zsh

source $DOTPATH/zsh/functions.zsh
source $DOTPATH/zsh/alias.zsh
source $DOTPATH/zsh/alias-docker.zsh

source $DOTPATH/zsh/prompt.zsh

source $DOTPATH/zsh/ninplug.zsh

deps="${DOTPATH}/deps"

# plugin selection
plugin_paths+=(Tarrasch/zsh-bd)
plugin_paths+=(ninrod/docker-zsh-completion)
plugin_paths+=(rupa/z)
plugin_paths+=(supercrabtree/k)
plugin_paths+=(zsh-users/zsh-completions)
plugin_paths+=(zsh-users/zsh-syntax-highlighting)

# plugin options {{{

# options for zsh-users/zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=red'

# }}}

# load step
load_plugins

# colors for GNU ls (from coreutils)
eval $(dircolors ~/.lscolors)
