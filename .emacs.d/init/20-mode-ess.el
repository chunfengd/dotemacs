;;; ess

(cf-install-packages '(ess))

;;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-1.4")

(require 'ess-site)

;; ESS will not print the evaluated comands, also speeds up the
;; evaluation
(setq ess-eval-visibly nil)

;; if you don't want to be prompted each time you start an interactive
;; R session
 (setq ess-ask-for-ess-directory nil)

