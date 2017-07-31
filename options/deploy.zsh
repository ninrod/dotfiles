option_symlink() {
  local OPTIONS_LINK=~/.options

  echo "removing $OPTIONS_LINK"

  if [[ -d $OPTIONS_LINK ]]; then
    echo "$OPTIONS_LINK is a dir. removing"
    rm -rf $OPTIONS_LINK
  else
    echo "$OPTIONS_LINK: not a dir"
  fi

  if [[ -f $OPTIONS_LINK ]]; then
    echo "$OPTIONS_LINK is a regular file. removing"
    rm -f $OPTIONS_LINK
  else
    echo "$OPTIONS_LINK: not a regular file"
  fi


  if [[ -h $OPTIONS_LINK ]]; then
    echo "$OPTIONS_LINK is symbolic link. removing."
    rm -f $OPTIONS_LINK
  else
    echo "$OPTIONS_LINK: not symbolic link."
  fi


  local ALTERNATIVE_OPTIONS=$(cd $SCRIPTPATH; cd ../../; readlink -f options)
  if [[ -e $ALTERNATIVE_OPTIONS ]]; then
    echo "symlinking alternative options. Using $ALTERNATIVE_OPTIONS configuration."
    ln -s $ALTERNATIVE_OPTIONS $OPTIONS_LINK
    return 0
  fi

  local abscur=$(cd $GIT_ROOT/options; readlink -f .)
  echo "symlinking default options. Using $abscur configuration."
  ln -s $abscur $OPTIONS_LINK
}

option_symlink