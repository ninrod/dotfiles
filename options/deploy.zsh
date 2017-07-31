OPTIONS=$(cd $SCRIPTPATH; cd ../../; readlink -f options)
LINK_OPTIONS=~/.options
if [[ -e $OPTIONS ]]; then
  echo "removing $LINK_OPTIONS"
  [[ -d $LINK_OPTIONS ]] && rm -rf $LINK_OPTIONS
  [[ -e $LINK_OPTIONS ]] && rm -f $LINK_OPTIONS
  echo "symlinking alternative options configuration"
  ln -s $OPTIONS $LINK_OPTIONS
else
  echo "symlinking default option configuration"
  ln -s . $LINK_OPTIONS
fi
