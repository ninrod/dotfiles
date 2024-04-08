# exercism
exercism_completion_file=~/.config/exercism/exercism_completion.zsh
if [ -f $exercism_completion_file ]; then
  source $exercism_completion_file
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ninrod/.sdkman"
[[ -s "/home/ninrod/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ninrod/.sdkman/bin/sdkman-init.sh"

eval "$(pyenv virtualenv-init -)"
