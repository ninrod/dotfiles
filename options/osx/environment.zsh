# setting up PATH
CUSTOM_SCRIPTS_BASE=~/.dotfiles/scripts


# dotfiles scripts
EMACS_SCRIPTS=$CUSTOM_SCRIPTS_BASE/emacs
VIM_SCRIPTS=$CUSTOM_SCRIPTS_BASE/vim
ZSH_SCRIPTS=$CUSTOM_SCRIPTS_BASE/zsh
GIT_SCRIPTS=$CUSTOM_SCRIPTS_BASE/git
OSX_SCRIPTS=~/.options/osx/scripts
CUSTOM_SCRIPTS=$EMACS_SCRIPTS:$ZSH_SCRIPTS:$VIM_SCRIPTS:$OSX_SCRIPTS:$GIT_SCRIPTS
GNUBIN_PATH=/usr/local/opt/coreutils/libexec/gnubin

# RUST

RUST_BIN=~/.cargo/bin

mountpath () {
  PATH="$GNUBIN_PATH:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin"
  PATH="$PATH:$CUSTOM_SCRIPTS"
  PATH=$PATH:$RUST_BIN
  export PATH
}
mountpath

export BSSH_SERVERS_FILE="$HOME/code/sources/secrets/bssh.servers"

# manpath
GNUMANPATH="/usr/local/opt/coreutils/libexec/gnuman"
MANPATH="$GNUMANPATH:$MANPATH"
export MANPATH

# node version manager
nvm_config() {
  cd $(readlink -f ~/.dotfiles)
  cd ..
  [[ ! -e secrets/nvm.zsh ]] && return 0
  source secrets/nvm.zsh
  if [[ -z ${USE_NVM+x} ]] || [[ $USE_NVM = 0 ]]; then
    return 0
  fi
  export NVM_DIR="$HOME/.nvm"
  [[ -e $NVM_DIR/nvm.sh ]] && source $NVM_DIR/nvm.sh
}
curdir=$(pwd -P)
nvm_config
cd $curdir
