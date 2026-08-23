# exercism
exercism_completion_file=~/.config/exercism/exercism_completion.zsh
if [ -f $exercism_completion_file ]; then
  source $exercism_completion_file
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

alias python='uv run python'

source ~/.rvm/scripts/rvm


if [[ $unamestr:l == *"127801"*  ]]; then
  export DISPLAY=$(ip route show | grep default | awk '{print $3}'):0
  export WAYLAND_DISPLAY=
fi

