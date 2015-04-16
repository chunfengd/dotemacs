;; platform specific

(defun cf-set-path (dir)
  (setenv "PATH" dir))

(defun cf-append-path (dir)
  (let (deli)
    (setq deli
        (if (string-equal system-type "windows-nt")
            (eval ";")
          (eval ":")))
    (setenv "PATH" (concat (getenv "PATH") deli dir))
    (add-to-list 'exec-path (expand-file-name dir))))

(defun cf-push-front-path (dir)
  (let (deli)
    (setq deli
        (if (string-equal system-type "windows-nt")
            (eval ";")
          (eval ":")))
    (setenv "PATH" (concat dir deli (getenv "PATH")))
    (add-to-list 'exec-path (expand-file-name dir))))

(cond
 ((string-equal system-type "windows-nt")
  ;; windows
  (progn
    ;; (cf-set-path "D:/qt/sdk-4.7.4/bin")
    ;; (cf-append-path "D:/qt/mingw-4.4.0/bin")
    ;; (cf-append-path (concat (getenv "systemroot") "/system32"))
    ;; (cf-append-path "D:/cc/depends22_x86")
    ;; (cf-append-path "D:/run")
    ;; (cf-append-path "C:/texlive/2011/bin/win32")
    ;; (setenv "QMAKESPEC" "win32-g++")
    ;; (defconst cf-system-include-dirs
    ;;   (list "D:/qt/sdk-4.7.4/include"
    ;;         "D:/qt/mingw-4.4.0/lib/gcc/mingw32/4.4.0/include/c++"))
    (defvar max-flag nil)
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
    (setq exec-path
          (delete-dups
           (append
            (split-string
             (shell-command-to-string
              "$SHELL -l -c 'printf $PATH'")
             ":")
            exec-path))) ;; set exec-path from shell path
    ;; for cedet include dir
    (defconst cf-system-include-dirs
      (list "/opt/local/include"))
    (defconst cf-macports-lisp-dir
      "/opt/local/share/emacs/site-lisp/")
    (if (file-exists-p cf-macports-lisp-dir)
        (add-to-list 'load-path cf-macports-lisp-dir))
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
