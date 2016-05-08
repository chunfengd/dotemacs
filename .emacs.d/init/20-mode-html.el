
;; html
;; (add-to-list 'auto-mode-alist '("\\.hbs$" . html-mode))
(defun cf-html-func ()
  (cf-set-key-bindings
   'local-set-key
   '(("C-c C-c" ace-jump-mode)
     ("C-c C-y" comment-or-uncomment-region)
     ("C-c C-x -" html-horizontal-rule)
     ("C-c C-x c" html-checkboxes)
     ("C-c C-x h" html-href-anchor)
     ("C-c C-x i" html-image)
     ("C-c C-x l" html-list-item)
     ("C-c C-x n" html-name-anchor)
     ("C-c C-x o" html-ordered-list)
     ("C-c C-x r" html-radio-buttons)
     ("C-c C-x u" html-unordered-list))
   ;; html-mode-map
   )
  (cf-set-key-bindings
   'define-key
   '(("C-c C-/" sgml-close-tag))
   sgml-mode-map))
(add-hook 'html-mode-hook 'cf-html-func)

(defun cf-nxml-func()
  (cf-set-key-bindings
   'define-key
   '(
     ("C-c C-e" sgml-close-tag)
     ("M-h" nil))
   nxml-mode-map))
(add-hook 'nxml-mode-hook 'cf-nxml-func)

;; http://web-mode.org/
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))
(defun cf-web-mode-func()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-style-padding 2)
  (setq web-mode-script-padding 2)
  (setq web-mode-block-padding 0)
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "SkyBlue1")
  (setq web-mode-enable-current-element-highlight t)
  (set-face-attribute 'web-mode-current-element-highlight-face nil :background "honeydew4")
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-enable-sexp-functions t)
  (cf-set-key-bindings
   'defind-key
   '(
     ("C-t" web-mode-mark-and-expand)
     ("C-c C-e C-c" web-mode-element-close)
     ("C-c C-e C-/" web-mode-element-close)
     )
   web-mode-map))
(add-hook 'web-mode-hook 'cf-web-mode-func)
