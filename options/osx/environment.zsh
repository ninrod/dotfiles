# setting up PATH
CUSTOM_SCRIPTS_BASE=~/.dotfiles/scripts

# dotfiles scripts
EMACS_SCRIPTS=$CUSTOM_SCRIPTS_BASE/emacs
VIM_SCRIPTS=$CUSTOM_SCRIPTS_BASE/vim
ZSH_SCRIPTS=$CUSTOM_SCRIPTS_BASE/zsh
GIT_SCRIPTS=$CUSTOM_SCRIPTS_BASE/git
OSX_SCRIPTS=~/.options/osx/scripts
CUSTOM_SCRIPTS=$EMACS_SCRIPTS:$ZSH_SCRIPTS:$VIM_SCRIPTS:$OSX_SCRIPTS:$GIT_SCRIPTS

# Pega a lista de diretórios GNU com esse comando:
# find /usr/local/opt -type d -follow -name gnubin -print
GNUCORE=/usr/local/opt/coreutils/libexec/gnubin
GNUINDENT=/usr/local/opt/gnu-indent/libexec/gnubin
GNUTAR=/usr/local/opt/gnu-tar/libexec/gnubin
GNUED=/usr/local/opt/ed/libexec/gnubin
GNUGREP=/usr/local/opt/grep/libexec/gnubin
GNUSED=/usr/local/opt/gnu-sed/libexec/gnubin
GNUGAWK=/usr/local/opt/gawk/libexec/gnubin
GNUMAKE=/usr/local/opt/make/libexec/gnubin
GNUFIND=/usr/local/opt/findutils/libexec/gnubin
GNUWHICH=/usr/local/opt/gnu-which/libexec/gnubin

# RUST
RUST_BIN=~/.cargo/bin

mountpath () {
  PATH="/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin"
  PATH="$PATH:$CUSTOM_SCRIPTS"
  PATH=$PATH:$RUST_BIN
  PATH=$GNUCORE:$GNUINDENT:$GNUTAR:$GNUED:$GNUGREP:$GNUSED:$GNUGAWK:$GNUMAKE:$GNUFIND:$GNUWHICH:$PATH
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
