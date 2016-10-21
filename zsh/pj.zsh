alias pjo="pj open"
alias f="pj"

project_paths=~/.options/project_paths.zsh
if [[ -e $project_paths ]]; then
  source $project_paths
fi

pj () {
    emulate -L zsh

    cmd="cd"
    project=$1

    if [[ "open" == "$project" ]]; then
        shift
        project=$*
        cmd=${=EDITOR}
    else
        project=$*
    fi

    for basedir ($PROJECT_PATHS); do
        if [[ -d "$basedir/$project" ]]; then
            $cmd "$basedir/$project"
            return
        fi
    done

    echo "No such project '${project}'."
}

_pj () {
    emulate -L zsh

    typeset -a projects
    for basedir ($PROJECT_PATHS); do
        projects+=(${basedir}/*(/N))
    done

    compadd ${projects:t}
}
compdef _pj pj
