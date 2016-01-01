
(cf-install-packages '(js2-mode))

;; (autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; from https://yoo2080.wordpress.com/2012/03/15/js2-mode-setup-recommendation/
(defun my-add-jslint-declarations ()
  (when (> (buffer-size) 0)
    (let ((btext (replace-regexp-in-string
                  (rx ":" (* " ") "true") " "
                  (replace-regexp-in-string
                   (rx (+ (char "\n\t\r "))) " "
                   ;; only scans first 1000 characters
                   (save-restriction
                     (widen)
                     (buffer-substring-no-properties
                      (point-min) (min (1+ 1000) (point-max)))) t t))))
      (mapc (apply-partially 'add-to-list 'js2-additional-externs)
            (split-string
             (if (string-match (rx "/*" (* " ") "global" (* " ")
                                   (group (*? nonl)) (* " ") "*/")
                               btext)
                 (match-string-no-properties 1 btext) "")
             (rx (* " ") "," (* " ")) t)))))
(add-hook 'js2-post-parse-callbacks 'my-add-jslint-declarations)

;; js2-mode-hide-comments
;; js2-mode-hide-element
;; js2-mode-hide-functions
;; js2-mode-hide-warnings-and-errors
;;
;; js2-mode-show-all
;; js2-mode-show-comments
;; js2-mode-show-element
;; js2-mode-show-functions
;; js2-mode-show-node
;;
;; js2-mode-toggle-element "C-c C-o"
;; js2-mode-toggle-hide-comments
;; js2-mode-toggle-hide-functions
;; js2-mode-toggle-warnings-and-errors
(defun cf-init-js ()
  (setq-default js-indent-level 2)
  (setq-default js2-basic-offset 2)
  (cf-set-key-bindings
   'local-set-key
   '(("C-c C-c" ace-jump-mode)
     ("C-c C-y" comment-or-uncomment-region))))
(add-hook 'js2-mode-hook 'cf-init-js)
