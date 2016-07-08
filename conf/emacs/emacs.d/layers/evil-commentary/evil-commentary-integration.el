(defmacro evil-commentary/org-babel-do-in-edit-buffer (beg end &rest body)
  "Do `org-babel-do-in-edit-buffer' and restore view.

Return the same value as `org-babel-do-in-edit-buffer'. Save top
line of current window and restore it if sucess."
  (declare (indent defun))
  `(when (and (fboundp 'org-babel-do-in-edit-buffer)
              (org-in-src-block-p t))
     (let ((top-line (line-number-at-pos (window-start)))
           (current-point (point))
           found)
       (push-mark ,beg)
       (goto-char ,end)
       (setq mark-active t)
       (setq found (eval '(org-babel-do-in-edit-buffer
                             ,@body)))
       (pop-mark)
       (if (not found)
           (goto-char current-point)
         (save-excursion
           (scroll-up 1)              ; stupid fix
           (goto-char (point-min))
           (forward-line (1- top-line))
           (recenter 0)))
       found)))

;;;###autoload
(defun evil-commentary/org-comment-or-uncomment-region (beg end)
  "Comment function for `org-mode'."
  (interactive "r")
  (unless (evil-commentary/org-babel-do-in-edit-buffer beg end
            (call-interactively 'evil-commentary))
    (comment-or-uncomment-region beg end)))

(provide 'evil-commentary-integration)
