# oc: opencode wrapper function
#
function oc() {
    local -x VISUAL="vi" EDITOR="vi"
    if (( $+commands[emacsclient] )); then
        VISUAL="emacsclient -tty"
        EDITOR="$VISUAL"
    elif (( $+commands[nvim] )); then
        VISUAL="nvim"
        EDITOR="$VISUAL"
    fi
    if [[ ! -t 0 ]]; then
        local stdin_content
        stdin_content=$(cat) || return

        # Restore keyboard input after reading a pipe or redirected file.
        command opencode --prompt "$stdin_content" "$@" < /dev/tty
    else
        command opencode "$@"
    fi
}
