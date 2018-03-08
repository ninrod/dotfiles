(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(evil-search-module (quote evil-search))
 '(ibuffer-fontification-alist
   (quote
    ((10 buffer-read-only font-lock-constant-face)
     (15
      (and buffer-file-name
           (string-match ibuffer-compressed-file-name-regexp buffer-file-name))
      font-lock-doc-face)
     (20
      (string-match "^*"
                    (buffer-name))
      font-lock-comment-face)
     (25
      (and
       (string-match "^ "
                     (buffer-name))
       (null buffer-file-name))
      italic)
     (30
      (memq major-mode ibuffer-help-buffer-modes)
      font-lock-comment-face)
     (35
      (eq major-mode
          (quote dired-mode))
      font-lock-function-name-face)
     (1
      (or
       (eq major-mode
           (quote emacs-lisp-mode))
       (eq major-mode
           (quote lisp-mode)))
      highlight-numbers-number)
     (1
      (eq major-mode
          (quote org-mode))
      org-level-1))))
 '(package-selected-packages
   (quote
    (kotlin-mode circe pkgbuild-mode powershell flycheck-package pass docker general ivy-hydra which-key emmet-mode yasnippet smex groovy-mode feature-mode py-isort pyvenv yapfify company-anaconda anaconda-mode flycheck-rust cargo toml-mode go-guru go-eldoc go-mode yaml-mode dockerfile-mode gitattributes-mode gitignore-mode gitconfig-mode vimrc-mode json-mode json-reformat tide js2-mode web-mode markdown-mode f aggressive-indent helpful lispyville lispy worf neotree dired-sort counsel-projectile projectile vdiff-magit evil-magit magit git-gutter-fringe atomic-chrome disable-mouse ibuffer-vc editorconfig origami ag multi-term eyebrowse restart-emacs spaceline smartparens rainbow-mode rainbow-delimiters org-bullets lisp-extra-font-lock kurecolor info+ highlight-defined highlight-quoted highlight-parentheses highlight-numbers fic-mode autothemer all-the-icons evil-string-inflection evil-replace-with-char exato vdiff evil-ediff evil-lion evil-indent-plus evil-numbers evil-args evil-god-state evil-anzu evil-escape evil-visualstar evil-exchange evil-matchit evil-commentary evil-replace-with-register evil-surround evil-test-helpers org-plus-contrib diminish use-package)))
 '(safe-local-variable-values
   (quote
    ((eval when
           (and
            (buffer-file-name)
            (file-regular-p
             (buffer-file-name))
            (string-match-p "^[^.]"
                            (buffer-file-name)))
           (unless
               (featurep
                (quote package-build))
             (let
                 ((load-path
                   (cons "../package-build" load-path)))
               (require
                (quote package-build))))
           (package-build-minor-mode)
           (set
            (make-local-variable
             (quote package-build-working-dir))
            (expand-file-name "../working/"))
           (set
            (make-local-variable
             (quote package-build-archive-dir))
            (expand-file-name "../packages/"))
           (set
            (make-local-variable
             (quote package-build-recipes-dir))
            default-directory))
     (eval when
           (fboundp
            (quote rainbow-mode))
           (rainbow-mode 1))
     (origami-fold-style . triple-braces)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:background "dark magenta" :foreground "#B3B3B3")))))

(put 'narrow-to-region 'disabled nil)
