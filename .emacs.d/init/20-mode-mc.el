
;; multiple-cursors

;; (cf-install-packages '(multiple-cursors))

(cf-set-key-bindings
 'global-set-key
 '(
   ("C-S-c C-S-c" mc/edit-lines)
   ("C-<" mc/mark-previous-like-this)
   ("C->" mc/mark-next-like-this)
   ("C-S-c C-<" mc/mark-all-like-this)
   ("C-S-c C-S-r" set-rectangular-region-anchor)
   ("C-S-c C-S-x" set-rectangular-region-anchor)))
