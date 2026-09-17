;; -*- lexical-binding: nil; -*-

(let* ((gc-cons-threshold (* 25 1024 1024))
       (local-elpa-mirror-full
        (expand-file-name
         "~/.dotfiles/deps/emacs/d12frosted/elpa-mirror/"))
       (local-elpa-mirror-thin
        (expand-file-name
         "~/.dotfiles/deps/emacs/ninrod/thin-melpa-mirror/"))
       (local-full-installed (file-directory-p local-elpa-mirror-full))
       (local-thin-installed (file-directory-p local-elpa-mirror-thin)))

  (require 'package)
  (setq package-enable-at-startup nil)
  (cond (local-full-installed
         (message "local d12frosted ELPA mirror found: installing...")
         (setq package-archives
               `(("gnu" . ,(concat local-elpa-mirror-full "gnu/"))
                 ("nongnu" . ,(concat local-elpa-mirror-full "nongnu/"))
                 ("melpa" . ,(concat local-elpa-mirror-full "melpa/")))))
        (local-thin-installed
         (message "local thin MELPA mirror found: installing...")
         (setq package-archives `(("melpa" . ,local-elpa-mirror-thin)
                                  ("gnu"   . ,local-elpa-mirror-thin))))
        (t
         (message "there are no local elpa mirrors. going to the interwebz")
         (setq package-archives `(("melpa" . "https://melpa.org/packages/")
                                  ("gnu"   . "https://elpa.gnu.org/packages/")))))
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents))
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))

  (setq vc-follow-symlinks "t") ; prevent prompt when loading org file
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
