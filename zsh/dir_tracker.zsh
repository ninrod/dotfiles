cd() {
  builtin cd $1
  sed -i "1i$(pwd)" $DIR_HISTORY
  content=$(awk '!a[$0]++' $DIR_HISTORY)
  echo $content > $DIR_HISTORY
  local EOL='$'
  local NUM=$DIR_TRACKER_NUM
  sed -i "${NUM},${EOL} d" $DIR_HISTORY
}


show_and_choose() {
  local choice=$(tail -n +2 $DIR_HISTORY | cat - -b | fzf | awk '{print $2}')
  [[ -n $choice ]] && cd $choice
}
