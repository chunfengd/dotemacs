
;; info mode

(defun cf-init-info ()
  (cf-set-key-bindings
   'local-set-key
   '(("j" next-line)
     ("k" previous-line)
     ("h" backward-char)
     ("l" forward-char)
     ("b" Info-history-back)
     ;; ("?" Info-help)
     )))
(add-hook 'Info-mode-hook 'cf-init-info)
