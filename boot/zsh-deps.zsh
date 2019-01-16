# fetch zsh deps
mkdir -p $zsh_deps && cd $zsh_deps

# functionality
ningrab ninrod/zsh-bd
ningrab ninrod/k

# completions
ningrab ninrod/docker-zsh-completion
ningrab ninrod/docker-compose-zsh-completion
ningrab zsh-users/zsh-completions
ningrab ninrod/pass-zsh-completion
ningrab ninrod/gradle-zsh-completion

# appearance
ningrab zdharma/fast-syntax-highlighting
