# -*- mode: sh -*-

source ~/.zsh.d/constants.zsh
source ~/.zsh.d/envbootstrap.zsh

source ~/.zsh.d/options.zsh
source ~/.zsh.d/termcolors.zsh
source ~/.zsh.d/fixescapecodes.zsh
source ~/.zsh.d/zleconfig.zsh
source ~/.zsh.d/functions.zsh

source ~/.zsh.d/alias.zsh
source ~/.zsh.d/alias-git.zsh
source ~/.zsh.d/alias-docker.zsh
source ~/.zsh.d/alias-emacs.zsh
source ~/.zsh.d/alias-vim.zsh
source ~/.zsh.d/alias-rust.zsh

source ~/.zsh.d/prompt.zsh
source ~/.zsh.d/ninplug.zsh

# load step
load_plugins

# init completion system
source ~/.zsh.d/completions.zsh

# colors for GNU ls (from coreutils)
eval $(dircolors ~/.lscolors)

source ~/.zsh.d/fzf.zsh

# custom plugins
source ~/.zsh.d/pj.zsh
source ~/.zsh.d/dir_tracker.zsh

# user last step
source ~/.zsh.d/call_user_last_hook.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
