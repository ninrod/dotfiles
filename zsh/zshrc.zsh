# -*- mode: sh -*-

SHELL_USER_CONFIG_FILE="${HOME}/.options/shell-options.conf"
if [[ -e "$SHELL_USER_CONFIG_FILE" ]]; then
  . "$SHELL_USER_CONFIG_FILE"
fi

source $DOTPATH/zsh/envbootstrap.zsh
source $DOTPATH/zsh/options.zsh
source $DOTPATH/zsh/completions.zsh
source $DOTPATH/zsh/termcolors.zsh
source $DOTPATH/zsh/fixescapecodes.zsh
source $DOTPATH/zsh/zleconfig.zsh
source $DOTPATH/zsh/functions.zsh
source $DOTPATH/zsh/alias.zsh
source $DOTPATH/zsh/alias-git.zsh
source $DOTPATH/zsh/alias-dir.zsh
source $DOTPATH/zsh/alias-docker.zsh
source $DOTPATH/zsh/alias-emacs.zsh
source $DOTPATH/zsh/alias-vim.zsh
source $DOTPATH/zsh/prompt.zsh
source $DOTPATH/zsh/ninplug.zsh
source $DOTPATH/zsh/plugins.zsh

# load step
deps="${DOTPATH}/zsh/deps"
load_plugins

# colors for GNU ls (from coreutils)
eval $(dircolors ~/.lscolors)
