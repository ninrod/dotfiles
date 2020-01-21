# exercism
exercism_completion_file=~/.config/exercism/exercism_completion.zsh
if [ -f $exercism_completion_file ]; then
  source $exercism_completion_file
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/ninrod/.sdkman"
export SDKMAN_INIT_FILE="${SDKMAN_DIR}/bin/sdkman-init.sh"
[[ -s ${SDKMAN_INIT_FILE} ]] && source $SDKMAN_INIT_FILE
