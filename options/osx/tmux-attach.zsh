[[ -z $TMUX ]] && [[ -z $EMACS ]] && { tmux attach || exec tmux new-session -A -s tmux -n shell; }
