;; -*- lexical-binding: nil; -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(evil-search-module 'evil-search)
 '(ibuffer-fontification-alist
   '((10 buffer-read-only font-lock-constant-face)
     (15
      (and buffer-file-name
           (string-match ibuffer-compressed-file-name-regexp
                         buffer-file-name))
      font-lock-doc-face)
     (20 (string-match "^*" (buffer-name)) font-lock-comment-face)
     (25
      (and (string-match "^ " (buffer-name)) (null buffer-file-name))
      italic)
     (30 (memq major-mode ibuffer-help-buffer-modes)
         font-lock-comment-face)
     (35 (eq major-mode 'dired-mode) font-lock-function-name-face)
     (1
      (or (eq major-mode 'emacs-lisp-mode) (eq major-mode 'lisp-mode))
      highlight-numbers-number)
     (1 (eq major-mode 'org-mode) org-level-1)))
 '(package-selected-packages
   '(ag aggressive-indent all-the-icons anaconda-mode atomic-chrome
        autothemer cargo company-anaconda counsel-projectile diminish
        dired-quick-sort docker editorconfig elpa-mirror emmet-mode
        evil-anzu evil-args evil-commentary evil-escape evil-exchange
        evil-indent-plus evil-lion
        evil-matchit evil-numbers evil-replace-with-char
        evil-replace-with-register evil-string-inflection
        evil-surround evil-test-helpers evil-visualstar exato
        eyebrowse fic-mode flycheck-package general git-gutter-fringe
        gitattributes-mode gitconfig-mode gitignore-mode groovy-mode
        gruvbox-theme helpful highlight-defined highlight-numbers
        highlight-parentheses highlight-quoted ibuffer-vc ivy-hydra
        json-mode json-reformat kotlin-mode lisp-extra-font-lock lispy
        lispyville magit markdown-mode
        multi-term nginx-mode ob-http org-bullets origami pass pkgbuild-mode
        projectile
        py-isort pyvenv rainbow-delimiters rainbow-mode restart-emacs
        rjsx-mode smartparens smex spaceline systemd tide toml-mode
        use-package vdiff vimrc-mode web-mode which-key worf
        yapfify yasnippet))
 '(safe-local-variable-values
   '((eval when
           (and (buffer-file-name) (file-regular-p (buffer-file-name))
                (string-match-p "^[^.]" (buffer-file-name)))
           (unless (featurep 'package-build)
             (let ((load-path (cons "../package-build" load-path)))
               (require 'package-build)))
           (package-build-minor-mode)
           (set (make-local-variable 'package-build-working-dir)
                (expand-file-name "../working/"))
           (set (make-local-variable 'package-build-archive-dir)
                (expand-file-name "../packages/"))
           (set (make-local-variable 'package-build-recipes-dir)
                default-directory))
     (eval when (fboundp 'rainbow-mode) (rainbow-mode 1))
     (origami-fold-style . triple-braces))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(trailing-whitespace ((t (:background "dark magenta" :foreground "#B3B3B3")))))

(put 'narrow-to-region 'disabled nil)
