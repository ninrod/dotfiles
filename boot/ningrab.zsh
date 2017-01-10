build_git_url() {
  local name="$1"
  local gitmask='https://github.com/'
  local url=${gitmask}${name}.git
  if [[ -n ${urlhash+x} ]] && ((${+urlhash[$name]})); then
    local url=${urlhash[$name]}
  fi
  echo $url
}

git_clone_error_msg() {
  if [[ ! $1 = 0 ]]; then
    echo -e "${Red}[ERROR]${Rst} git clone finished with return code: ${Red}${1}${Rst}. ${Yellow}aborting...${Rst}"
    echo -e "-------------------"
    return $1
  fi
}

# simplest dependency fetcher known to mankind
ningrab() {
  local name="$1"
  local url=$(build_git_url $name)
  local ref=$2
  echo "" && echo "-------------------"
  if [[ -d $name ]]; then
    echo -e "[${Green}${name}${Rst}] already cloned from ${Blue}${url}${Rst}"
  else
    echo -e "[${Red}${name}${Rst}] not cloned. cloning now from ${Blue}${url}${Rst}"
    if [[ -n ${2+x} ]]; then
      echo -e "the ref: ${Yellow}${ref}${Rst} was passed. Performing ${Blue}full${Rst} clone."

      git clone $url $name; rc=$?; git_clone_error_msg $rc
      if [[ ! $rc = 0 ]]; then
        return $rc
      fi

      local cwd=$(readlink -f .)
      cd $name
      git checkout --quiet $ref
      echo -e "[${Green}performing checkout${Rst}] ${Yellow}$(git branch --no-color --quiet --column=dense)${Rst}"
      cd $cwd
    else
      echo -e "no ref to checkout. ${Yellow}shallow${Rst} cloning."
      git clone --depth 1 $url $name; rc=$?; git_clone_error_msg $rc
      if [[ ! $rc = 0 ]]; then
        return $rc
      fi
    fi
    echo -e "[${Green}${name}${Rst}] sucessfully cloned."
  fi
  echo -e "-------------------"
}
