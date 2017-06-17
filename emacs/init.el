(let ((gc-cons-threshold (* 25 1024 1024)))
  (require 'package)
  (setq package-enable-at-startup nil)
  (defun ninrod--rsyncfy (repo) (concat "~/.dotfiles/deps/emacs/ninrod/rsynced-melpa/" repo))
  (setq package-archives `(("melpa" . ,(ninrod--rsyncfy "melpa/"))
                           ("org"   . ,(ninrod--rsyncfy "org/"))
                           ("gnu"   . ,(ninrod--rsyncfy "gnu/"))))
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
