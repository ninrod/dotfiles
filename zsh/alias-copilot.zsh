# function to wrap copilot prompt so you can ask freely without quotes
function ais() {
    # $* captures all arguments passed to the function as a single string
    copilot -p "$*"
}
