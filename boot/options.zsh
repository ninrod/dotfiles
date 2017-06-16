OPTIONS=$(cd $SCRIPTPATH; cd ../../; readlink -f options)
LINK_OPTIONS=~/.options
if [[ -e $OPTIONS ]]; then
  echo "removing $LINK_OPTIONS"
  [[ -d $LINK_OPTIONS ]] && rm -rf $LINK_OPTIONS
  [[ -e $LINK_OPTIONS ]] && rm -f $LINK_OPTIONS
  echo "symlinking options"
  echo "first arg: $OPTIONS"
  echo "second arg: $LINK_OPTIONS"
  ln -s $OPTIONS $LINK_OPTIONS
fi
ensure_dotpath
source $SHELL_OPTIONS_FILE
export DOTPATH
