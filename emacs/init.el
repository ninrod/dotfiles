(let* ((gc-cons-threshold (* 25 1024 1024))
       (local-elpa-mirror-base "~/.dotfiles/deps/emacs/ninrod")
       (local-elpa-mirror-thin (concat local-elpa-mirror-base "/thin-elpa-mirror"))
       (local-thin-installed nil)
       (local-thin-installed (file-directory-p local-elpa-mirror-thin))
       )

  (require 'package)
  (setq package-enable-at-startup nil)
  (cond (local-thin-installed
         (setq package-archives `(("melpa" . ,(concat local-elpa-mirror-thin))
                                  ("org"   . ,(concat local-elpa-mirror-thin))
                                  ("gnu"   . ,(concat local-elpa-mirror-thin)))))
        (t
         (message "there are no local elpa mirrors. going to the interwebz")
         (setq package-archives `(("melpa" . "https://melpa.org/packages/")
                                  ("org"   . "https://orgmode.org/elpa/")
                                  ("gnu"   . "https://elpa.gnu.org/packages/")))))
  (package-initialize)
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  (setq vc-follow-symlinks "t") ; prevent prompt when loading org file
  (use-package diminish :ensure t)
  (use-package org
    :pin org
    :ensure org-plus-contrib
    :defer 7) ;; fetch latest version of `org-mode'

  (defun ninrod/load-secrets-file (secrets-file)
    (defun ninrod/parent-dir (dirname times)
      "get the parent dir of DIRNAME"
      (let* ((path (file-truename dirname)))
        (dotimes (number times path)
          (setq path (file-name-directory (directory-file-name path))))
        path))
    (let* ((nin-source-dir (ninrod/parent-dir user-emacs-directory 2))
           (full-secrets-file (concat nin-source-dir secrets-file)))
      (cond ((file-exists-p full-secrets-file)
             (message "file `%s' EXISTS!!! loading..." full-secrets-file)
             (org-babel-load-file full-secrets-file))
            (t
             (message "pre-secrets does NOT exist. nothing to do here.")))))

  (ninrod/load-secrets-file "secrets/emacs-pre.org")
  (org-babel-load-file (expand-file-name "boot.org" user-emacs-directory))
  (ninrod/load-secrets-file "secrets/emacs-post.org")

  (garbage-collect))
