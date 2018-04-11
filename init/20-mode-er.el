
;; expand-region

;; (cf-install-packages '(expand-region))

(defun cf-expand-region-setup ()
  (cf-set-key-bindings
   'global-set-key
   '(
     ("C-=" er/expand-region)
     ("M-t" er/expand-region)
     )))

(if (package-installed-p 'expand-region)
    (cf-expand-region-setup)
  (message "expand-region not installed"))
