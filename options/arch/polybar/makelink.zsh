#!/usr/bin/env zsh
# author: Filipe Silva (ninrod)

SCRIPTPATH=$(cd $(dirname $0); pwd -P) && cd $SCRIPTPATH
GIT_ROOT=$(git rev-parse --show-toplevel)

DIR=~/.config/polybar
FILE=gruvbox.conf
LAUNCHER=launch.sh
SYMLINK=$DIR/config
FULL_LAUNCHER=$DIR/$LAUNCHER

rm -rf $DIR
mkdir -p $DIR

ln -sf $(readlink -f $FILE) $(readlink -f $SYMLINK)
ln -sf $(readlink -f $LAUNCHER) $(readlink -f $FULL_LAUNCHER)

thinkpad_battery_udev_rule() {
  local src_dir=$(readlink -f scripts/thinkpad_battery_udev)
  local dst_dir=/etc/udev/rules.d
  local filename=95-battery.rules
  local src_file=$src_dir/$filename
  local dst_file=$dst_dir/$filename
  if [[ -e $dst_file ]]; then
    sudo rm $dst_file
  fi
  sudo ln -s $src_file $dst_file
}
thinkpad_battery_udev_rule