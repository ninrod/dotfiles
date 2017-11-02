# setting up PATH
CUSTOM_SCRIPTS_BASE=~/.dotfiles/scripts

EMACS_SCRIPTS=$CUSTOM_SCRIPTS_BASE/emacs
VIM_SCRIPTS=$CUSTOM_SCRIPTS_BASE/vim
ZSH_SCRIPTS=$CUSTOM_SCRIPTS_BASE/zsh
GIT_SCRIPTS=$CUSTOM_SCRIPTS_BASE/git
OSX_SCRIPTS=~/.options/osx/scripts

CUSTOM_SCRIPTS=$EMACS_SCRIPTS:$ZSH_SCRIPTS:$VIM_SCRIPTS:$OSX_SCRIPTS:$GIT_SCRIPTS
GNUBIN_PATH=/usr/local/opt/coreutils/libexec/gnubin

# Rust stuff
CARGO_BIN=~/.cargo/bin
RUST_SRC_PATH=~/code/sources/rust/src

# java stuff
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_7_HOME=$(/usr/libexec/java_home -v1.7)
alias java7='export JAVA_HOME=$JAVA_7_HOME && mountpath'
alias java8='export JAVA_HOME=$JAVA_8_HOME && mountpath'
export JAVA_HOME=$JAVA_8_HOME

mountpath () {
  PATH="$GNUBIN_PATH:/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin"
  PATH="$PATH:$CUSTOM_SCRIPTS"
  PATH="$PATH:$JAVA_HOME/bin"
  PATH="$PATH:$CARGO_BIN"
  PATH="$PATH:$RUST_SRC_PATH"
  export PATH
}
mountpath

# manpath
GNUMANPATH="/usr/local/opt/coreutils/libexec/gnuman"
MANPATH="$GNUMANPATH:$MANPATH"
export MANPATH

# node version manager

export NVM_DIR="$HOME/.nvm"
[[ -e $NVM_DIR/nvm.sh ]] && source $NVM_DIR/nvm.sh
