
(defun cf-conf-mode-hook-func ()
  (cf-set-key-bindings
   'local-set-key
   '(
     ("C-c C-c" ace-jump-mode) ;; used to be conf-colon-mode
     )))
(add-hook 'conf-mode-hook 'cf-conf-mode-hook-func)
