OPTIONS=$(cd $SCRIPTPATH; cd ../../; readlink -f options)
LINK_OPTIONS=$(readlink -f ~/.options)
if [[ ! -e $LINK_OPTIONS ]] && [[ -e $OPTIONS ]]; then
  echo "symlinking options"
  echo "first arg: $OPTIONS"
  echo "second arg: $LINK_OPTIONS"
  ln -s $OPTIONS $LINK_OPTIONS
fi
ensure_dotpath
source $SHELL_OPTIONS_FILE
export DOTPATH
