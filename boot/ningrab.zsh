# source optional user custom git url definitions
url_hash_file=~/.options/urlhash.zsh
if [[ -e $url_hash_file ]]; then
  typeset -A urlhash
  source $url_hash_file
fi

build_git_url() {
  local name="$1"
  local gitmask='https://github.com/'
  local url=${gitmask}${name}.git
  if [[ -n ${urlhash+x} ]] && ((${+urlhash[$name]})); then
    local url=${urlhash[$name]}
  fi
  echo $url
}

# simplest dependency fetcher known to mankind
ningrab() {
  local name="$1"
  local url=$(build_git_url $name)
  local ref=$3
  echo "" && echo "-------------------"
  if [[ -d $name ]]; then
    echo -e "[${Green}${name}${Rst}] already cloned from ${Blue}${url}${Rst}"
  else
    echo -e "[${Red}${name}${Rst}] not cloned. cloning now from ${Blue}${url}${Rst}"
    if [[ -n ${3+x} ]]; then
      echo -e "the ref: ${Yellow}${ref}${Rst} was passed. Performing ${Blue}full${Rst} clone."
      git clone $url $name
      local cwd=$(readlink -f .)
      cd $name
      git checkout --quiet $ref
      git branch --no-color --quiet --column=dense
      cd $cwd
    else
      echo -e "no ref to checkout. ${Yellow}shallow${Rst} cloning."
      git clone --depth 1 $url $name
    fi
    echo -e "[${Green}${name}${Rst}] sucessfully cloned."
  fi
  echo -e "-------------------"
}
