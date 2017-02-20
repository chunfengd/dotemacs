(require 'tramp)
(setq tramp-default-method "scp")
;;(custom-set-variables '(tramp-verbose 6))
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
