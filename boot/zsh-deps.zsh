# fetch zsh deps
source $GIT_ROOT/zsh/deps-location.zsh
mkdir -p $deps && cd $deps

clonedep Tarrasch/zsh-bd                   
clonedep supercrabtree/k                   
clonedep ninrod/docker-zsh-completion      
clonedep zsh-users/zsh-completions         
clonedep zsh-users/zsh-syntax-highlighting 
clonedep rupa/z
