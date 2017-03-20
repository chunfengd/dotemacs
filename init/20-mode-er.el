
;; expand-region

;; (cf-install-packages '(expand-region))

(defun cf-expand-region-setup ()
  (cf-install-package-file 'expand-region "lib/expand-region/")
  (cf-set-key-bindings
   'global-set-key
   '(
     ("C-=" er/expand-region)
     ("M-t" er/expand-region)
     )))

(cf-expand-region-setup)
