alias f="project_jump"

project_paths=~/.options/project_paths.zsh
if [[ -e $project_paths ]]; then
  source $project_paths
fi

project_jump () {
  emulate -L zsh
  project=$1

  if [[ -z ${1+x} ]] && [[ -d ${PROJECT_PATHS[1]} ]]; then
    cd ${PROJECT_PATHS[1]}
    return 0
  fi

  for chosen_project ($PROJECT_PATHS); do
    if [[ -d "$chosen_project" ]] && [[ "${chosen_project:t}" == "$project" ]]; then
      cd "$chosen_project"
      return 0
    fi
  done

  echo "No such project '${project}'."
}

_project_jump () {
  emulate -L zsh
  typeset -a projects
  for project ($PROJECT_PATHS); do
    projects+=(${project})
  done
  compadd ${projects:t}
}
compdef _project_jump project_jump
