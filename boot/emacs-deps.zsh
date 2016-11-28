# fetch emacs deps
source ~/.zsh.d/constants.zsh

mkdir -p $emacs_deps && cd $emacs_deps

ningrab jtbm37/all-the-icons-dired
ningrab ninrod/spacemacs-theme
ningrab ninrod/thin-melpa-mirror
ningrab ninrod/zerodark-theme isearch-tweak # temporary branch, while I wait for #29 to merge
ningrab noctuid/rectangle-ext.el
ningrab supermomonga/evil-textobj-entire
ningrab syl20bnr/spacemacs-elpa-mirror
