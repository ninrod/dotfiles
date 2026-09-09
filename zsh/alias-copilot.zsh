# you only live once.
#
function yolo() {
    local argument
    local copilot_model="gpt-5.6-terra"
    local -a copilot_arguments=()

    for argument in "$@"; do
        if [ "$argument" = "--opus" ]; then
            copilot_model="claude-opus-5"
        else
            copilot_arguments+=("$argument")
        fi
    done

    local -a copilot_options=(
        --allow-all
        --no-ask-user
        --model "$copilot_model"
        --effort high
    )

    if [ "${#copilot_arguments[@]}" -eq 1 ] && [ -f "${copilot_arguments[1]}" ]; then
        case "${copilot_arguments[1]}" in
            *.txt|*.md|*.org)
                command copilot "${copilot_options[@]}" --interactive "$(< "${copilot_arguments[1]}")"
                ;;
            *)
                print -u2 -- "yolo: specification files must use .txt, .md, or .org: ${copilot_arguments[1]}"
                return 2
                ;;
        esac
    elif [ "${#copilot_arguments[@]}" -gt 0 ]; then
        command copilot "${copilot_options[@]}" "${copilot_arguments[@]}"
    elif [ ! -t 0 ]; then
        command copilot "${copilot_options[@]}" --interactive "$(cat)"
    else
        command copilot "${copilot_options[@]}"
    fi
}

# function to wrap copilot prompt with reliable pipe support
function ais() {
    local stdin_content=""
    local full_query=""

    # check if there is data coming from a pipe
    if [ ! -t 0 ]; then
        stdin_content=$(cat)
    fi

    # if pipe has data, concatenate it cleanly with the user prompt
    if [ -n "$stdin_content" ]; then
        full_query="$*

        Context from pipe:
        $stdin_content"
        copilot -p "$full_query"
    else
        # no pipe data, just run the prompt
        copilot -p "$*"
    fi
}
