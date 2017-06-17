# deploy symlinks

cd $GIT_ROOT
for file in ./**/deploy.zsh; do
  source $file
done

verifylink ~/.dotfiles
updatelinks ~/.dotfiles .