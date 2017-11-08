export XDG_CONFIG_HOME="$HOME/.config"

# setting up PATH
CUSTOM_SCRIPTS=~/.dotfiles/scripts/emacs:~/.dotfiles/scripts/vim:~/.dotfiles/scripts/zsh
LINUX_SCRIPTS=~/.options/arch/scripts
CARGO_BIN=~/.cargo/bin
GO_BIN=~/go/bin
PATH="$CUSTOM_SCRIPTS:$PATH"
PATH="$LINUX_SCRIPTS:$PATH"
PATH="$CARGO_BIN:$PATH"
PATH="$GO_BIN:$PATH"
export PATH

# hack stolen from: https://github.com/rust-lang-nursery/rustfmt/issues/1687#issuecomment-308756211
export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$LD_LIBRARY_PATH

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

