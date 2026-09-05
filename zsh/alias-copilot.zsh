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
