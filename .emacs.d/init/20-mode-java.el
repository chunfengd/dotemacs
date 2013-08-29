(defun cf-java-func ()
  (cf-set-key-bindings
   'local-set-key
   '(
     ("C-M-h" backward-sexp)
     ("C-M-b" c-mark-function)
     ("C-M-a" nil)
     ("C-M-e" nil)
     ("M-k" c-beginning-of-defun)
     ("M-j" c-end-of-defun)
     ("C-d" nil)
     )))
(add-hook 'java-mode-hook 'cf-java-func)
