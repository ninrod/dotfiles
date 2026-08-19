# exercism
exercism_completion_file=~/.config/exercism/exercism_completion.zsh
if [ -f $exercism_completion_file ]; then
  source $exercism_completion_file
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

echo "passa por aqui?"

export SDKMAN_DIR="/home/filipecls/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

echo "sim, passa por aqui"

alias python='uv run python'

source ~/.rvm/scripts/rvm
