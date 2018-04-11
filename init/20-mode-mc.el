
;; multiple-cursors

(defun cf-multiple-cursors-setup ()
  (setq mc/list-file (cf-path "mc-list.el"))
  (setq mc/always-run-for-all t)
  (cf-set-key-bindings
   'global-set-key
   '(
     ("C-S-c C-S-c" mc/edit-lines)
     ("C-M-_" mc/mark-previous-like-this)
     ("C-M-+" mc/mark-next-like-this)
     ("C-M-|" mc/mark-all-like-this)
     ("C-S-c C-<" mc/mark-all-like-this)
     ("C-S-c C-S-r" set-rectangular-region-anchor)
     ("C-S-c C-S-k" set-rectangular-region-anchor))))

(if (package-installed-p 'multiple-cursors)
    (cf-multiple-cursors-setup)
  (message "multiple-cursors not installed"))
