# enhanced copilot function with pipe support
function ais() {
    local input=""
    # check if stdin is connected to a pipe/file
    if [[ ! -t 0 ]]; then
        input=$(cat)
    fi

    # if there is piped input, append it to the prompt
    if [[ -n "$input" ]]; then
        copilot -p "$*:\n\n$input"
    else
        copilot -p "$*"
    fi
}
