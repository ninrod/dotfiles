if [[ -e "$SHELL_OPTIONS_FILE" ]]; then
  source "$SHELL_OPTIONS_FILE"
fi

# user git information set up
if [[ -n ${GIT_USER_NAME+x} ]]; then
  export GIT_USER_NAME
  git config --global user.name $GIT_USER_NAME
fi
if [[ -n ${GIT_USER_EMAIL+x} ]]; then
  export GIT_USER_EMAIL
  git config --global user.email $GIT_USER_EMAIL
fi
