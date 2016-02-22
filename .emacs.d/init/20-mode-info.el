
;; info mode

(defun cf-init-info ()
  (cf-set-key-bindings
   'local-set-key
   '(("j" Info-next-reference)
     ("k" Info-prev-reference))))
;; (add-hook 'Info-mode-hook 'cf-init-info)

