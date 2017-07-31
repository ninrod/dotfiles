export XDG_CONFIG_HOME="$HOME/.config"

# setting up PATH
CUSTOM_SCRIPTS=~/.dotfiles/scripts/emacs:~/.dotfiles/scripts/vim:~/.dotfiles/scripts/zsh
LINUX_SCRIPTS=~/.options/arch/scripts
PATH="$CUSTOM_SCRIPTS:$PATH"
PATH="$LINUX_SCRIPTS:$PATH"
export PATH

#nvm
# export NVM_DIR="$HOME/.nvm"
# [[ -e $NVM_DIR/nvm.sh ]] && source $NVM_DIR/nvm.sh
