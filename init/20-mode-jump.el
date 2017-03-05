;; jump-char & ace-jump-char

(cf-install-packages '(ace-jump-mode))

;; jump
(cf-set-key-bindings
 'global-set-key
 '(
   ("C-c C-c" ace-jump-mode)
   ))
