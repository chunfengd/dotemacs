;; platform specific

(add-to-list 'load-path (concat cf-dotemacs-home "lib/exec-path-from-shell"))
(require 'exec-path-from-shell)

(cond
 ((string-equal system-type "windows-nt")
  ;; windows
  (progn
    (exec-path-from-shell-initialize)))
 ((string-equal system-type "darwin")
  ;; mac os x
  (progn
    (setq mac-option-key-is-meta nil)
    (setq mac-command-key-is-meta t)
    ;;(setq mac-command-modifier 'meta)
    ;;(setq mac-option-modifier nil)
    ;; (setenv "NODE_NO_READLINE" "1")
    (exec-path-from-shell-initialize)))
 ((string-equal system-type "gnu/linux")
  (message "linux")
  (progn
    (defconst cf-system-include-dirs nil))))
