
(cf-install-packages '(python-mode))

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")

(autoload 'python-mode "python-mode" "Python Mode." t)
 (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
 (add-to-list 'interpreter-mode-alist '("python" . python-mode))

(defun cf-init-python ()
  (cf-set-key-bindings
   'local-set-key
   '(
     ("C-c C-c" comment-or-uncomment-region)))
  (cf-set-key-bindings
   'define-key
   '(("C-j" nil)
     ("C-n" py-newline-and-indent)
     ("C-M-h" nil)
     ("C-M-b" py-mark-def-or-class))
   python-mode-map)
  (setq python-indent-offset 4)
  ;; (c-toggle-auto-state)
  (c-toggle-hungry-state 1))
(add-hook 'python-mode-hook 'cf-init-python)
