;; platform specific

(add-to-list 'load-path (concat cf-dotemacs-home "lib/exec-path-from-shell"))
(require 'exec-path-from-shell)

(cond
 ((string-equal system-type "windows-nt")
  ;; windows
  (progn
    (defvar max-flag nil)
    (exec-path-from-shell-initialize)
    (defun cf-win-toggle-frame-maximum ()
      "Toggle frame between maximum and norm."
      (interactive)
      (if (null max-flag)
          (progn
            (w32-send-sys-command 61488)
            (setq max-flag t))
        (w32-send-sys-command 61728)
        (setq max-flag nil)))
    (global-set-key [f6] 'cf-win-toggle-frame-maximum)))
 ((string-equal system-type "darwin")
  ;; mac os x
  (progn
    (setq mac-option-key-is-meta nil)
    (setq mac-command-key-is-meta t)
    ;;(setq mac-command-modifier 'meta)
    ;;(setq mac-option-modifier nil)
    ;; (setenv "NODE_NO_READLINE" "1")
    (exec-path-from-shell-initialize)
    (defun toggle-fullscreen ()
      "Toggle full screen. From: http://emacswiki.org/emacs/FullScreen."
      (interactive)
      (set-frame-parameter
       nil 'fullscreen
       (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
    ;; (global-set-key [f6] 'toggle-fullscreen)
    (global-set-key [f6] 'toggle-frame-maximized)))
 ((string-equal system-type "gnu/linux")
  (message "linux")
  (progn
    (defconst cf-system-include-dirs nil)
    (defun fullscreen (&optional f)
      (interactive)
      (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                             '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
      (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                             '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
    (defun toggle-frame-maxium ()
      (interactive)
      (when (eq window-system 'x)
        (set-frame-parameter nil 'fullscreen
         (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))
    (global-set-key [f6] 'toggle-frame-maximum))))
