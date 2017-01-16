# fetch zsh deps
source ~/.zsh.d/constants.zsh
mkdir -p $zsh_deps && cd $zsh_deps

ningrab Tarrasch/bd
ningrab supercrabtree/k
ningrab ninrod/docker-zsh-completion
ningrab zsh-users/zsh-completions
ningrab zsh-users/zsh-syntax-highlighting
ningrab seebi/dircolors-solarized
ningrab micha/jsawk
ningrab micha/resty
