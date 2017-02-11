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

  ;;(use-package org
  ;; :pin stable-melpa
  ;;:ensure org-plus-contrib
  ;;    :defer 7); fetch latest version of `org-mode'

  (use-package evil
    :load-path "lisp/ninrod/evil"
    :init
    (use-package goto-chg
      :ensure t)
    (use-package undo-tree
      :diminish ""
      :ensure t)
    :config
    (setcdr evil-insert-state-map nil) ;; emacsify insert state: http://stackoverflow.com/a/26573722/4921402
    (define-key evil-insert-state-map [escape] 'evil-normal-state);; but [escape] should switch back to normal state, obviously.
    (fset 'evil-visual-update-x-selection 'ignore);; Amazing hack lifted from: http://emacs.stackexchange.com/a/15054/12585

    (evil-mode)

    (evil-define-text-object ninrod/textobj-entire (count &optional beg end type)
      (evil-range (point-min) (point-max)))
    (define-key evil-outer-text-objects-map "e" 'ninrod/textobj-entire)))

(setq org-capture-templates
      '(("a" "My TODO task format." entry
         (file "~/code/sources/life/gtd/inbox.org")
         "* TODO %? ")))
(defun air-org-task-capture ()
  "Capture a task with my default template."
  (interactive)
  (org-capture nil "a"))

