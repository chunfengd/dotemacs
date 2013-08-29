
(cf-install-packages
 '(paredit
   ;;starter-kit
   ;;starter-kit-lisp
   ;;starter-kit-eshell
   clojure-mode
   clojure-test-mode
   nrepl))

(dolist (mode '(scheme emacs-lisp lisp clojure clojurescript))
    (when (> (display-color-cells) 8)
      (font-lock-add-keywords (intern (concat (symbol-name mode) "-mode"))
                              '(("(\\|)" . 'esk-paren-face))))
    (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
              'paredit-mode))

(defun cf-paredit-kill (beg end)
  "If the mark is active, kill region will be used; otherwise, delete
char will be used."
  (interactive (list (point) (mark)))
  (if mark-active
      (kill-region beg end)
    (paredit-forward-delete 1)))

(defun cf-paredit-key ()
  (cf-set-key-bindings
   'define-key
   '(
     ("C-j" next-line)
     ("C-k" previous-line)
     ("C-f" paredit-kill)
     ("C-n" paredit-newline)
     ("C-d" cf-paredit-kill)

     ("C-M-b" nil)
     ("C-M-f" nil)
     ("C-M-h" paredit-backward)
     ("C-M-l" paredit-forward)
     ("C-M-j" paredit-forward-up)
     ("C-M-k" paredit-backward-down)

     ("C-c C-c" paredit-comment-dwim)

     ("(" nil)
     (")" nil)
     ("[" nil)
     ("]" nil)
     ("{" nil)
     ("}" nil)
     )
   paredit-mode-map))

(eval-after-load 'paredit '(cf-paredit-key))

;; clojure
(add-hook 'nrepl-mode-hook 'subword-mode)
;(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

