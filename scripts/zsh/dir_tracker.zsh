DIR_HISTORY=~/.dir_history.txt

if [[ ! -s $DIR_HISTORY ]]; then
  touch $DIR_HISTORY
  echo $HOME > $DIR_HISTORY
fi

cd() {
  builtin cd $1
  sed -i "1i$(pwd)" $DIR_HISTORY
  content=$(awk '!a[$0]++' $DIR_HISTORY)
  echo $content > $DIR_HISTORY
  local EOL='$'
  local NUM=22
  sed -i "${NUM},${EOL} d" $DIR_HISTORY
}


show_and_choose() {
  choice=$(tail -n +2 $DIR_HISTORY | cat - -b | fzf | awk '{print $2}')
  [[ -n $choice ]] && cd $choice
}

