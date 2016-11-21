# fetch emacs deps
source ~/.zsh.d/constants.zsh

mkdir -p $emacs_deps && cd $emacs_deps

ningrab jtbm37/all-the-icons-dired
ningrab Dewdrops/evil-ReplaceWithRegister
ningrab syl20bnr/spacemacs-elpa-mirror
ningrab ninrod/thin-melpa-mirror
