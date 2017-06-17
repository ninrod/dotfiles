# deploy symlinks

cd $GIT_ROOT
for file in ./**/deploy.zsh; do
  source $file
done

verifylink ~/.dotfiles
updatelinks ~/.dotfiles .

verifylink ~/.lscolors
updatelinks ~/.lscolors ~/.dotfiles/deps/zsh/seebi/dircolors-solarized/dircolors.256dark