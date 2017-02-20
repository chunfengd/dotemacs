
;; view
(defun cf-view-key-binding ()
  (cf-set-key-bindings
   'define-key
   ;;'local-set-key
   '(
     ;; ("C-j" View-scroll-line-forward)
     ("C-j" nil)
     )
   view-mode-map
   )
  )
(add-hook 'view-mode-hook 'cf-view-key-binding)
