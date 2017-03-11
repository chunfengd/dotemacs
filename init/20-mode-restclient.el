
;; (cf-install-packages '(restclient-mode))

(defun cf-init-restclient ()
  (cf-set-key-bindings
   'local-set-key
   '(
     ("C-c C-h" restclient-http-send-current)
     ("C-c C-k" restclient-jump-prev)
     ("C-c C-j" restclient-jump-next))))
(add-hook 'restclient-mode-hook 'cf-init-restclient)
