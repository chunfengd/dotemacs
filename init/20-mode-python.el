
(cf-install-packages '(python-mode))

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(defun cf-init-python ()
  (cf-set-key-bindings
   'local-set-key
   '(("C-c C-c" ace-jump-mode)
     ("C-c C-y" comment-or-uncomment-region)))
  (cf-set-key-bindings
   'define-key
   '(("C-j" nil)
     ("C-n" py-newline-and-indent)
     ("C-m" nil)
     ("C-M-h" nil)
     ("C-M-b" py-mark-def-or-class)
     ("M-j" py-forward-block-or-clause)
     ("M-k" py-backward-block-or-clause)
     ("C-M-j" py-forward-block-or-clause)
     ("C-M-k" py-backward-block-or-clause)
     ("C-M-a" nil)
     ("C-M-e" nil)
     ("C-c C-v" nil)
     ("C-c C-x" nil)
     ("C-c C-m" nil)
     ("C-c C-v C-l" py-shift-right)
     ("C-c C-v C-h" py-shift-left)
     ("C-c C-i C-l" py-shift-right)
     ("C-c C-i C-h" py-shift-left)
     ("C-c C-x C-l" py-shift-block-or-clause-right)
     ("C-c C-x C-h" py-shift-block-or-clause-left))
   python-mode-map)
  (subword-mode)
  (setq python-indent-offset 4)
  ;; (c-toggle-auto-state)
  (c-toggle-hungry-state 1)
  (highlight-indentation-mode)
  (highlight-indentation-current-column-mode))
(add-hook 'python-mode-hook 'cf-init-python)