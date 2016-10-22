# -*- mode: sh -*-

SHELL_USER_CONFIG_FILE="${HOME}/.options/shell-options.conf"
if [[ -e "$SHELL_USER_CONFIG_FILE" ]]; then
  . "$SHELL_USER_CONFIG_FILE"
fi

source ~/.zsh.d/envbootstrap.zsh
source ~/.zsh.d/options.zsh
source ~/.zsh.d/completions.zsh
source ~/.zsh.d/termcolors.zsh
source ~/.zsh.d/fixescapecodes.zsh
source ~/.zsh.d/zleconfig.zsh
source ~/.zsh.d/functions.zsh
source ~/.zsh.d/alias.zsh
source ~/.zsh.d/alias-git.zsh
source ~/.zsh.d/alias-dir.zsh
source ~/.zsh.d/alias-docker.zsh
source ~/.zsh.d/alias-emacs.zsh
source ~/.zsh.d/alias-vim.zsh
source ~/.zsh.d/prompt.zsh
source ~/.zsh.d/ninplug.zsh
source ~/.zsh.d/plugins.zsh

# lock dependency location
source ~/.zsh.d/deps-location.zsh

# load step
load_plugins

# colors for GNU ls (from coreutils)
eval $(dircolors ~/.lscolors)
