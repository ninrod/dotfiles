(let ((gc-cons-threshold (* 25 1024 1024)))
  (require 'package)
  (setq package-enable-at-startup nil)

  ;; option 1: my fat local melpa/elpa mirror
  (defun ninrod--rsyncfy (repo) (concat "~/.dotfiles/deps/emacs/ninrod/rsynced-melpa/" repo))
  (setq package-archives `(("melpa" . ,(ninrod--rsyncfy "melpa/"))
                           ("org"   . ,(ninrod--rsyncfy "org/"))
                           ("gnu"   . ,(ninrod--rsyncfy "gnu/"))))

  ;; option 3: my thin local mirror
  ;; (setq package-archives
  ;;       `(("melpa" . "~/.emacs.d/thin-elpa-mirror")
  ;;         ("org"   . "~/.emacs.d/thin-elpa-mirror")
  ;;         ("gnu"   . "~/.emacs.d/thin-elpa-mirror")))

  ;; option 2: my thin github mirror
  ;; (setq package-archives
  ;;       `(("melpa" . "https://raw.githubusercontent.com/ninrod/thin-elpa-mirror/master/")
  ;;         ("org"   . "https://raw.githubusercontent.com/ninrod/thin-elpa-mirror/master/")
  ;;         ("gnu"   . "https://raw.githubusercontent.com/ninrod/thin-elpa-mirror/master/")))

  (package-initialize)
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  (use-package diminish :ensure t)

  (use-package org
    :pin org
    :ensure org-plus-contrib
    :defer 7) ;; fetch latest version of `org-mode'

  (setq vc-follow-symlinks "t") ; prevent prompt when loading org file

  (defun ninrod/parent-dir (dirname times)
    "get the parent dir of DIRNAME"
    (let* ((path (file-truename dirname)))
      (dotimes (number times path)
        (setq path (file-name-directory (directory-file-name path))))
      path))
  (let ((secrets-file "secrets/emacs-pre.org"))
    (cond ((file-exists-p (concat (ninrod/parent-dir user-emacs-directory 2) secrets-file))
           (message "pre-secrets EXISTS!!! loading...")
           (org-babel-load-file (expand-file-name secrets-file "~/code/sources")))
          (t
           (message "pre-secrets does NOT exist. nothing to see here."))))

  (org-babel-load-file (expand-file-name "boot.org" user-emacs-directory))

  (let ((secrets-file "secrets/emacs-post.org"))
    (cond ((file-exists-p (concat (ninrod/parent-dir user-emacs-directory 2) secrets-file))
           (message "post-secrets EXISTS!!! loading...")
           (org-babel-load-file (expand-file-name secrets-file "~/code/sources")))
          (t
           (message "post-secrets does NOT exist. nothing to see here."))))

  (garbage-collect))

