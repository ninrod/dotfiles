# user git information set up
if [[ -n ${GIT_USER_NAME+x} ]]; then
  export GIT_USER_NAME
  git config --global user.name $GIT_USER_NAME
fi
if [[ -n ${GIT_USER_EMAIL+x} ]]; then
  export GIT_USER_EMAIL
  git config --global user.email $GIT_USER_EMAIL
fi

if [[ -n ${DOTPATH+x} ]]; then
  export DOTPATH
fi

# export relevant user options
if [[ -n ${DOT_TERMINAL_EMULATOR+x} ]]; then
  export DOT_TERMINAL_EMULATOR
fi
