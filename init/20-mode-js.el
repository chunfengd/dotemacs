
(defun cf-js-setup ()
  (setq-default js-indent-level 2))


(defun cf-js2-setup ()
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
  (autoload 'js2-mode "js2-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (setq-default js2-basic-offset 2)
  (setq-default js2-strict-inconsistent-return-warning nil)
  (defun cf-init-js ()
    (electric-indent-mode -1)
    (cf-set-key-bindings
     'local-set-key
     '(("C-c C-c" ace-jump-mode)
       ("C-c C-y" comment-or-uncomment-region))))
  (add-hook 'js2-mode-hook 'cf-init-js)
  
  ;; from https://yoo2080.wordpress.com/2012/03/15/js2-mode-setup-recommendation/
  (add-hook
   'js2-post-parse-callbacks
   (lambda ()
     (when (> (buffer-size) 0)
       (let ((btext
              (replace-regexp-in-string
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
                (rx (* " ") "," (* " ")) t)))))))

;; js3-mode
(defun cf-js3-setup ()
  (add-to-list 'load-path (concat cf-dotemacs-home "lib/js3-mode"))
  (autoload 'js3-mode "js3-mode" nil t)
  (eval-after-load "js3-mode"
    (add-hook 'js3-mode-hook
              (lambda ()
                (setq js3-auto-indent-p nil
                      js3-curly-indent-offset 0
                      js3-enter-indents-newline t
                      js3-expr-indent-offset 2
                      js3-indent-on-enter-key t
                      js3-lazy-commas t
                      js3-lazy-dots t
                      js3-lazy-operators t
                      js3-paren-indent-offset 2
                      js3-square-indent-offset 4)
                (auto-complete-mode 1))))
  (add-to-list 'auto-mode-alist '("\\.js$" . js3-mode)))

(cf-js-setup)
;; (cf-js2-setup)
;; (cf-js3-setup)

