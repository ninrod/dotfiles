pwd_hook() {
  touch $DIR_HISTORY
  local _cwd=$(pwd)
  local num=302
  lines=($_cwd)
  for line in $(awk '!a[$0]++' $DIR_HISTORY)
  do
    if [[ $_cwd !=  $line ]]; then
      lines+=($line)
    fi
  done
  printf "%s\n" "${lines[@]:0:${num}}" > $DIR_HISTORY
}

show_and_choose() {
  choice=$( tail -n +2 $DIR_HISTORY | cat - -b | fzf | awk '{print $2}')
  if [ -n "$choice" ]; then
    cd $choice
  fi
}

# Hook functions
chpwd_functions+=(pwd_hook)
typeset -U chpwd_functions
