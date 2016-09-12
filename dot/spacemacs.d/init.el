;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers () (org-babel-load-file (expand-file-name "~/.spacemacs.d/layers.org")))
(defun dotspacemacs/init () (org-babel-load-file (expand-file-name "~/.spacemacs.d/settings.org")))
(defun dotspacemacs/user-init ())
(defun dotspacemacs/user-config () (org-babel-load-file (expand-file-name "~/.spacemacs.d/userconfig.org")))
