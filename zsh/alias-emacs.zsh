# -*- mode: sh -*-

# emacs client
e() {
  if [[ -t 0 ]]; then
    command emacsclient --tty "$@"
    return
  fi

  if (( $# )); then
    echo "e: piped input cannot be combined with arguments" >&2
    return 2
  fi

  local input_file exit_status
  input_file=$(mktemp "${TMPDIR:-/tmp}/emacs-stdin.XXXXXX") || return

  cat > "$input_file"
  exit_status=$?
  if (( exit_status )); then
    command rm -f -- "$input_file"
    return "$exit_status"
  fi

  command emacsclient --tty "$input_file"
  exit_status=$?
  command rm -f -- "$input_file"
  return "$exit_status"
}
alias et="emacsclient --tty"
alias eg="background-connect-emacs-daemon.sh"

# daemon
alias ed="up-emacs-daemon.sh"
alias ek="kill-emacs-server.sh"
alias er="ek && ed"
alias eu="emacsclient -e '(daemonp)'"
alias ei="emacsclient -e '(emacs-init-time)'"
