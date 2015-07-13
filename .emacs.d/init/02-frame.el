
(setq server-name "server")
;;(server-start)

(setq user-full-name "chunfeng")
(setq user-mail-address "chunfengd@gmail.com")

(defvar cf-default-frame-alist
  '(
    ;; (width . 150)
    ;; (width . 80)
    ;; (height . 42)
    ))

(cond
 ((string-equal system-type "windows-nt")
  (progn
    (add-to-list 'initial-frame-alist '(left . 650))
    ;; (add-to-list 'initial-frame-alist '(top . 100))
    (setq default-frame-alist
          (append cf-default-frame-alist
                  '((background-color . "black")
                    (foreground-color . "grey75")
                    (border-color . "white")
                    (cursor-color . "grey80")
                    (mouse-color . "dark orange"))))))
 ((string-equal system-type "darwin")
  (progn
    (add-to-list 'initial-frame-alist '(left . 650))
    (add-to-list 'initial-frame-alist '(top . 100))
    (setq default-frame-alist
          (append cf-default-frame-alist
                  '((width . 80)
                    (height . 42)
                    (background-color . "black")
                    (foreground-color . "grey75")
                    (border-color . "white")
                    (cursor-color . "purple")
                    (mouse-color . "dark orange"))))))
 ((string-equal system-type "gnu/linux")
  (progn
    (add-to-list 'initial-frame-alist '(left . 650))
    (setq default-frame-alist
          (append cf-default-frame-alist
                  '((background-color . "black")
                    (foreground-color . "grey75")
                    (border-color . "white")
                    (cursor-color . "grey80")
                    (mouse-color . "dark orange")))))))

(global-hl-line-mode t)
(if (display-graphic-p)
    (set-face-background hl-line-face "grey20"))

(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))
;; (menu-bar-no-scroll-bar)
;; (menu-bar-mode 0)
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

(setq default-fill-column 70)
(setq-default column-number-mode t)
(setq-default make-backup-files nil)
(setq visible-bell t)
(setq inhibit-startup-message t)
(setq sentence-end-double-space nil)
(setq-default scroll-margin 3
              scroll-conservatively 10000)
(global-font-lock-mode t)
(put 'narrow-to-region 'disabled nil)

(setq-default indent-tabs-mode nil)
(setq default-tab-width 8)

;; linum
(global-linum-mode t)
(if (not (display-graphic-p))
    (setq linum-format "%d ")) ; for margin in terminal

;; parentheses
;; (setq show-paren-mode t) ; does not work
(setq show-paren-mode nil)
(show-paren-mode)
(setq show-paren-style 'mixed)

(delete-selection-mode 1)

(add-hook
 'speedbar-load-hook
 '(lambda ()
    (add-to-list 'speedbar-frame-parameters '(width . 35))
    (setq speedbar-show-unknown-files t)))

;;
;; max-frame
;; some codes copy from https://github.com/rmm5t/maxframe.el
;;
(defvar cf-display-fringe-hori 0)
(defvar cf-display-fringe-verti 70)
(defvar cf-offset-x 0)
(defvar cf-offset-y 0)

(defun cf-width-to-columns (width)
  "Calculates the maximum number of columns that can fit in
pixels specified by WIDTH."
  (let ((scroll-width (or (frame-parameter nil 'scroll-bar-width) 0))
        (left-fringe (or left-fringe-width (nth 0 (window-fringes)) 0))
        (right-fringe (or right-fringe-width (nth 1 (window-fringes)) 0)))
    (/ (- width scroll-width left-fringe right-fringe
               cf-display-fringe-hori)
       (frame-char-width))))

(defun cf-height-to-rows (height)
  "Calculates the maximum number of rows that can fit in pixels
specified by HEIGHT."
  (/ (- height cf-display-fringe-verti)
     (frame-char-height)))

(defun cf-is-frame-rect-stored ()
  (frame-parameter (selected-frame) 'cf-rect-stored))

(defun cf-store-frame-rect ()
  (let ((cur-frame (selected-frame)))
    (progn
      (set-frame-parameter cur-frame 'cf-restore-width (frame-width))
      (set-frame-parameter cur-frame 'cf-restore-height (frame-height))
      (set-frame-parameter
       cur-frame 'cf-restore-top (frame-parameter nil 'top))
      (set-frame-parameter
       cur-frame 'cf-restore-left (frame-parameter nil 'left))
      (set-frame-parameter cur-frame 'cf-rect-stored t))))

(defun cf-get-frame-rect ()
  (let ((cur-frame (selected-frame)))
    (when (cf-is-frame-rect-stored)
      (list (frame-parameter cur-frame 'cf-restore-width)
            (frame-parameter cur-frame 'cf-restore-height)
            (frame-parameter cur-frame 'cf-restore-top)
            (frame-parameter cur-frame 'cf-restore-left)))))

(defun cf-maximize-frame ()
  "Maximize the curent frame (x or mac only)"
  (interactive)
  (let ((cur-frame (selected-frame)))
    (unless (cf-is-frame-rect-stored)
      (cf-store-frame-rect)
      (set-frame-size cur-frame
                      (cf-width-to-columns (display-pixel-width))
                      (cf-height-to-rows (display-pixel-height)))
      (set-frame-position cur-frame
                          cf-offset-x cf-offset-y))))

(defun cf-maximize-frame-width ()
  (interactive)
  (let ((cur-frame (selected-frame)))
    (unless (cf-is-frame-rect-stored)
      (cf-store-frame-rect)
      (set-frame-size cur-frame
                      (cf-width-to-columns (display-pixel-width))
                      (frame-height))
      (set-frame-position cur-frame
                          cf-offset-x (frame-parameter nil 'top)))))

(defun cf-restore-frame ()
  "Restore the current frame (x or mac only)"
  (interactive)
  (let ((cur-frame (selected-frame)))
    (if (cf-is-frame-rect-stored)
        (let ((rect (cf-get-frame-rect)))
          ;;(message "%d, %d, %d, %d" (nth 0 rect) (nth 1 rect)
          ;;(nth 2 rect) (nth 3 rect))
          (set-frame-parameter cur-frame 'cf-rect-stored nil)
          (set-frame-size cur-frame (nth 0 rect) (nth 1 rect))
          (set-frame-position cur-frame (nth 3 rect) (nth 2 rect)))
      (message "Error: no stored rect"))))

;; (require 'maxframe)
;; (defvar max-flag nil)
(defun cf-toggle-frame-maximum ()
  (interactive)
  (if (cf-is-frame-rect-stored)
      (cf-restore-frame)
    (cf-maximize-frame)))

(defun cf-toggle-frame-maximum-width ()
  (interactive)
  (if (cf-is-frame-rect-stored)
      (cf-restore-frame)
    (cf-maximize-frame-width)))

;; (global-set-key [f6] 'cf-toggle-frame-maximum-width)

(cond
 ;; windows
 ((string-equal system-type "windows-nt")
  (progn
    (set-default-font "Consolas:pixelsize=14:antialias=subpixel")
    (set-fontset-font "fontset-default"
		      'han '("Microsoft Yahei" . "unicode-bmp"))
    (add-to-list 'default-frame-alist
		 '(font . "Consolas:pixelsize=14:antialias=subpixel"))
    ;;(cf-set-en-font
     ;;'("Consolas" "Monaco" "DejaVu Sans Mono" "Courier New")
     ;;":pixelsize=14:antialias=subpixel")
    ;;(cf-set-ch-font
     ;;'("Microsoft Yahei" "文泉驿等宽微米黑" "新宋体" "宋体")
     ;;":pixelsize=14:antialias=subpixel")
    ))
 ((string-equal system-type "darwin")
  (progn
    (setq default-directory "~/")
    (if (display-graphic-p)
        (set-fontset-font
         t 'han (font-spec :name "Songti SC")))))
 ;; linux
 ((string-equal system-type "gnu/linux")))

(defun cf-font-exist (font)
  (if (null (x-list-fonts font))
      nil t))
(defun cf-make-font-string (font-name font-size)
  (if (and (stringp font-size)
	   (equal ":" (string (elt font-size 0)))
	   )
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))
(require 'cl)
(defun cf-set-en-font (font-list font-size)
  (setq font-str
	(cf-make-font-string
	 (find-if #'cf-font-exist font-list)
	 font-size))
  (message "Set English Font to %s" font-str)
  (set-face-attribute 'default nil :font font-str))
(defun cf-set-ch-font (font-list font-size)
  (setq font-str
	(cf-make-font-string
	 (find-if #'cf-font-exist font-list)
	 font-size))
  (message "Set Chinese Font to %s" font-str)
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset font-str)))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq diff-switches "-u")

(setq save-place-file (concat user-emacs-directory "places"))
