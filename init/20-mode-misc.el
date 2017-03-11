
(defun cf-conf-mode-hook-func ()
  (cf-set-key-bindings
   'local-set-key
   '(
     )))
(add-hook 'conf-mode-hook 'cf-conf-mode-hook-func)
