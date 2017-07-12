
(defun cf-node-modules-path-setup ()
  ;; From: https://github.com/codesuki/add-node-modules-path
  (defvar add-node-modules-path-debug nil
    "Enable verbose output when non nil.")

  (defun add-node-modules-path ()
    "Search the current buffer's parent directories for `node_modules/.bin`.
If it's found, then add it to the `exec-path'."
    (let* ((root (locate-dominating-file
                  (or (buffer-file-name) default-directory)
                  "node_modules"))
           (path (and root
                      (expand-file-name "node_modules/.bin/" root))))
      (if root
          (progn
            (make-local-variable 'exec-path)
            (add-to-list 'exec-path path)
            (when add-node-modules-path-debug
              (message (concat "added " path  " to exec-path"))))
        (when add-node-modules-path-debug
          (message (concat "node_modules not found in " root))))))
  (eval-after-load 'js-mode
    '(add-hook 'js-mode-hook #'add-node-modules-path))
  (eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook #'add-node-modules-path)))

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
  (cf-install-package-file 'js2-mode "lib/js2-mode/")
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (setq-default js-indent-level 2)
  ;; this will hide errors & warnings
  (setq-default js2-mode-show-parse-errors nil)
  (setq-default js2-mode-show-strict-warnings nil)
  (setq-default js2-bounce-indent-p t)
  ;; (setq-default js2-strict-inconsistent-return-warning nil)
  (defun cf-init-js ()
    (electric-indent-mode -1)
    (cf-set-key-bindings
     'local-set-key
     '()))
  (add-hook 'js2-mode-hook 'cf-init-js))

;; js3-mode
(defun cf-js3-setup ()
  (add-to-list 'load-path (cf-path "lib/js3-mode"))
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

;; json-mode
(defun cf-json-setup ()
  (cf-install-package-file 'json-mode "lib/json-mode/"))

(cf-node-modules-path-setup)
(cf-js-setup)
(cf-js2-setup)
;; (cf-js3-setup)
(cf-json-setup)
