;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  (org-babel-load-file (expand-file-name "~/.spacemacs.d/layers.org"))
)

(defun dotspacemacs/init ()
  (org-babel-load-file (expand-file-name "~/.spacemacs.d/settings.org")))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
   It is called immediately after `dotspacemacs/init', before layer configuration executes.
   This function is mostly useful for variables that need to be set before packages are loaded.
   If you are unsure, you should try in setting them in `dotspacemacs/user-config' first.")

(defun dotspacemacs/user-config ()
  (org-babel-load-file (expand-file-name "~/.spacemacs.d/userconfig.org")))
