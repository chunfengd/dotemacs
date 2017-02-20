;; cmake

(autoload 'cmake-mode "cmake-mode" "Cmake Mode" t)

(add-to-list 'auto-mode-alist '("CMakeLists\\.txt$" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))

