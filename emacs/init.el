(let ((gc-cons-threshold (* 25 1024 1024)))
  (require 'package)

  (setq package-enable-at-startup nil)
  ;; (setq package-archives '(("melpa" . "~/.emacs.d/lisp/ninrod/thin-melpa-mirror")))
  (setq package-archives '(("melpa" . "~/.emacs.d/mirror-elpa/melpa/")
                           ("org"   . "~/.emacs.d/mirror-elpa/org/")
                           ("gnu"   . "~/.emacs.d/mirror-elpa/gnu/")))
  (package-initialize)
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  (use-package org
    :pin org
    :ensure org-plus-contrib
    :defer 7); fetch latest version of `org-mode'

  (setq vc-follow-symlinks "t") ; prevent prompt when loading org file
  (org-babel-load-file (expand-file-name "boot.org" user-emacs-directory))

  (garbage-collect))