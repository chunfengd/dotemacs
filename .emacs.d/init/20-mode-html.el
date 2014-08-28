
;; html

(defun cf-html-func ()
  (cf-set-key-bindings
   'define-key
   '(
     ("C-c C-c -" nil)
     ("C-c C-c c" nil)
     ("C-c C-c h" nil)
     ("C-c C-c i" nil)
     ("C-c C-c l" nil)
     ("C-c C-c n" nil)
     ("C-c C-c o" nil)
     ("C-c C-c r" nil)
     ("C-c C-c u" nil)

     ("C-c C-c" comment-or-uncomment-region)
     ("C-c C-x -" html-horizontal-rule)
     ("C-c C-x c" html-checkboxes)
     ("C-c C-x h" html-href-anchor)
     ("C-c C-x i" html-image)
     ("C-c C-x l" html-list-item)
     ("C-c C-x n" html-name-anchor)
     ("C-c C-x o" html-ordered-list)
     ("C-c C-x r" html-radio-buttons)
     ("C-c C-x u" html-unordered-list))
   html-mode-map)
  (cf-set-key-bindings
   'define-key
   '(("C-c C-/" sgml-close-tag))
   sgml-mode-map))
(add-hook 'html-mode-hook 'cf-html-func)