;; jump-char & ace-jump-char

(cf-install-packages '(jump-char ace-jump-mode))

;; jump
(cf-set-key-bindings
 'global-set-key
 '(
   ("C-c C-l" jump-char-forward)
   ("C-c C-h" jump-char-backward)
   ("C-c C-n" ace-jump-mode)
   ))
(setq jump-char-use-initial-char nil)
(setq jump-char-backward-key "C-,")
(setq jump-char-forward-key "C-.")
