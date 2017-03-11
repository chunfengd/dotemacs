
(setq scss-compile-at-save nil)

(defun cf-init-scss ()
  (message "init-scss")
  (cf-set-key-bindings
   'local-set-key
   '())
  (setq css-indent-offset 2))
(add-hook 'scss-mode-hook 'cf-init-scss)
