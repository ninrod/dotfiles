source ~/.zsh.d/constants.zsh
mkdir -p $emacs_deps && cd $emacs_deps

# mirrors
ningrab syl20bnr/spacemacs-elpa-mirror
ningrab ninrod/thin-melpa-mirror

# core editing
ningrab supermomonga/evil-textobj-entire
ningrab noctuid/rect-ext.el
ningrab noctuid/targets.el
ningrab timcharper/evil-surround develop

# forked themes
ningrab ninrod/spacemacs-theme
ningrab ninrod/zerodark-theme
ningrab ninrod/gruvbox-theme

# toys
ningrab parkouss/speed-type