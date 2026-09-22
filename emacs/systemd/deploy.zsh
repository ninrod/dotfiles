if [[ ! -d "$HOME/.config/systemd/user" ]]; then
  mkdir -p -- "$HOME/.config/systemd/user" || exit 1
fi
verifylink "$HOME/.config/systemd/user/emacs-daemon.service"
updatelinks "$HOME/.config/systemd/user/emacs-daemon.service" "$GIT_ROOT/emacs/systemd/emacs-daemon.service"
