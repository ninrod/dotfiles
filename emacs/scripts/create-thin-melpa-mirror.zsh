#!/usr/bin/env zsh

set -o pipefail

dotfiles_dir="$HOME/.dotfiles"
mirror_dir="$dotfiles_dir/deps/emacs/ninrod/thin-melpa-mirror"
mirror_package="$dotfiles_dir/deps/emacs/redguardtoo/elpa-mirror/elpa-mirror.el"
init_file="$HOME/.emacs.d/init.el"
log_dir="$dotfiles_dir/emacs/scripts/logs"

mkdir -p -- "$log_dir" || {
  print -u2 -- "Could not create log directory: $log_dir"
  exit 1
}

while true; do
  log_file="$log_dir/[$(date +%Y-%m-%d-%H-%M-%S)]-thin-elpa-mirror.log"
  [[ -e "$log_file" ]] || break
  sleep 1
done

if ! (set -C; : > "$log_file") 2>/dev/null; then
  print -u2 -- "Could not create log file: $log_file"
  exit 1
fi

create_mirror() {
  print -r -- "Log file: $log_file"
  print -r -- "Checking mirror repository: $mirror_dir"

  if [[ ! -d "$mirror_dir/.git" && ! -f "$mirror_dir/.git" ]] ||
      ! git -C "$mirror_dir" rev-parse --is-inside-work-tree >/dev/null; then
    print -u2 -- "Mirror repository is not cloned: $mirror_dir"
    return 1
  fi

  if [[ ! -f "$init_file" || ! -f "$mirror_package" ]]; then
    print -u2 -- "Missing Emacs init file or elpa-mirror package: $init_file, $mirror_package"
    return 1
  fi

  print -r -- "Creating mirror in: $mirror_dir"
  emacs --batch -l "$init_file" -l "$mirror_package" \
    --eval='(setq elpamr-default-output-directory "~/.dotfiles/deps/emacs/ninrod/thin-melpa-mirror/")' \
    --eval='(setq elpamr-enable-log t)' \
    --eval='(unwind-protect (elpamr-create-mirror-for-installed) (when (get-buffer elpamr--log-buffer) (princ (with-current-buffer elpamr--log-buffer (buffer-string)))))'
  local emacs_exit_status=$?

  if (( emacs_exit_status != 0 )); then
    print -u2 -- "Mirror creation failed (Emacs exit status: $emacs_exit_status)."
    return "$emacs_exit_status"
  fi

  print -r -- "Mirror creation completed."
}

create_mirror 2>&1 | tee -- "$log_file"
