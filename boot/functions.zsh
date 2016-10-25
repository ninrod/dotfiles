ensure_options_file() {
  if [[ ! -d $SHELL_OPTIONS_DIR ]]; then
    mkdir -p $SHELL_OPTIONS_DIR
  fi
  local options_file="$(readlink -f $SHELL_OPTIONS_FILE)"
  if [[ ! -e $options_file ]]; then
    cp boot/options/shell-options.zsh $SHELL_OPTIONS_DIR
  fi
}
ensure_dotpath() {
  ensure_options_file
  local options_file="$(readlink -f $SHELL_OPTIONS_FILE)"
  local temp_file="$(readlink -f ~/.options/temp.conf)"
  awk '!/^DOTPATH/' $options_file > $temp_file && mv $temp_file $options_file
  echo "DOTPATH=${GIT_ROOT/$HOME/~}" >> $options_file
}
verifylink() {
  local symlink=${1:a}
  if [[ -e $symlink ]] && [[ ! -h $symlink ]]; then
    echo -e "${Yellow}$symlink${Rst} is a ${Red}regular${Rst} file on your system."
    echo -e "rename/backup the file ${Yellow}$symlink${Rst}, and run the script again."
    exit 1
  fi
}
updatelinks() {
  local symlink=${1:a}
  local symlink_old_target=${1:A}
  local symlink_new_target=${2:A}
  if [[ ! -h $symlink ]]; then
    echo -e "$symlink ${Green}->${Rst} $symlink_new_target"
  elif [[ $symlink_old_target != $symlink_new_target ]]; then
    rm $symlink
    echo -e "$1 ${Red}-${Black}X${Rst}->${Rst} $symlink ${Green}->${Rst} $symlink_new_target"
  else
    echo -e "$1 ${Green}ok.${Rst}"
    return 0
  fi
  ln -s $symlink_new_target $symlink
}
