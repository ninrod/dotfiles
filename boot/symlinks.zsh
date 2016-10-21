# apply symlinks
cd $GIT_ROOT
for file in symlinks/*.symlink; do
  verifylink ~/.${file:t:r}
done
for file in symlinks/*.symlink; do
  updatelinks ~/.${file:t:r} $file
done
for file in symlinks/*.copy; do
  cp $file ~/.${file:t:r}
done
