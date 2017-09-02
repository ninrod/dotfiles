option_symlink() {
  local OPTIONS_LINK=~/.options

  echo "removing $OPTIONS_LINK"
  if [[ -f $OPTIONS_LINK ]] || [[ -h $OPTIONS_LINK ]]; then
    rm -f $OPTIONS_LINK
  elif [[ -d $OPTIONS_LINK ]]; then
    rm -rf $OPTIONS_LINK
  fi

  local ALTERNATIVE_OPTIONS=$(cd $SCRIPTPATH; cd ../../; realpath options)
  if [[ -e $ALTERNATIVE_OPTIONS ]]; then
    echo "symlinking alternative options. Using $ALTERNATIVE_OPTIONS configuration."
    ln -s $ALTERNATIVE_OPTIONS $OPTIONS_LINK
    return 0
  fi

  local abscur=$(cd $GIT_ROOT/options; realpath .)
  echo "symlinking default options. Using $abscur configuration."
  ln -s $abscur $OPTIONS_LINK
}

option_symlink
