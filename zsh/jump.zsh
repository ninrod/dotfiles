# boostrap jump
if command -v jump > /dev/null 2>&1; then
  eval "$(jump shell)"
else
  print "jump command is not installed"
fi