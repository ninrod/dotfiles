# small hack for fixing `open` behaviour on OSx. Uneeded in linux.
if-shell "uname | grep -q Darwin" "set -g default-command 'reattach-to-user-namespace -l $def_shell'"

# use osx pbcopy
if-shell "uname | grep -q Darwin" "bind -t vi-copy y copy-pipe 'pbcopy'"