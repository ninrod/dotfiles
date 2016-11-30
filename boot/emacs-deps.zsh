# fetch emacs deps
source ~/.zsh.d/constants.zsh

mkdir -p $emacs_deps && cd $emacs_deps

ningrab jtbm37/all-the-icons-dired
ningrab noctuid/rect-ext.el
ningrab supermomonga/evil-textobj-entire
ningrab syl20bnr/spacemacs-elpa-mirror

ningrab ninrod/evil-surround
ningrab ninrod/spacemacs-theme
ningrab ninrod/thin-melpa-mirror
ningrab ninrod/zerodark-theme
