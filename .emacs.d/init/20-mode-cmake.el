;; cmake

(defconst cedet-pro-home "/opt/local/share/emacs/site-lisp/cmake-mode.el")

(add-to-list 'auto-mode-alist '("^CMakeLists\\.txt$" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))

(if (file-exists-p cedet-pro-home)
    (autoload 'cmake-mode cedet-pro-home t))

