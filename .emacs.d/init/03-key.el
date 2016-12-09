
(defun cf-show-kbd (key-list)
  (dolist (key key-list)
    (message "%s:\t%s" key
	     (key-binding (eval `(kbd ,key)))
	     )))

(defun cf-overlay-key-binding (key)
  "Keymaps can also be attached to overlays, like yasnippet.
   From: http://stackoverflow.com/questions/18801018/how-to-find-in-which-map-a-key-binding-is-from-programatically-in-emacs"
  (mapcar (lambda (keymap) (lookup-key keymap key))
          (cl-remove-if-not
           #'keymapp
           (mapcar (lambda (overlay)
                     (overlay-get overlay 'keymap))
                   (overlays-at (point))))))

(defun cf-find-kbd (key)
  "From: http://stackoverflow.com/questions/18801018/how-to-find-in-which-map-a-key-binding-is-from-programatically-in-emacs"
  (interactive "kInput key: ")
  (message "%s"
   (list
    (cf-overlay-key-binding key)
    (minor-mode-key-binding key)
    (local-key-binding key)
    (global-key-binding key))))

(defun cf-set-key-bindings (action bind-list &optional map)
  "Set key bindings. 'bind-list' is 2-D list."
  (dolist (pair bind-list)
    (if (null map)
	(funcall action (eval `(kbd ,(nth 0 pair))) (nth 1 pair))
      (funcall action map (eval `(kbd ,(nth 0 pair))) (nth 1 pair)))))

(defun cf-dos2unix ()
  "From: http://www.emacswiki.org/emacs/DosToUnix
Not exactly but it's easier to remember"
  (interactive)
  (set-buffer-file-coding-system 'unix 't))

(defun cf-get-path ()
  ""
  (interactive)
  (let ((path
         (or buffer-file-name default-directory)))
    (message path)
    path))

(defun cf-copy-path ()
  ""
  (interactive)
  (let ((path (cf-get-path)))
    (if path
        (kill-new path))))

(cf-set-key-bindings
 'global-set-key
 '(
   ("<f5>" compile)
   ("<f7>" speedbar-get-focus)
   ("C-x C-o" other-window)
   ("<C-tab>" other-window)
   ("C-x C-5 C-o" other-frame)
   ("<M-tab>" other-frame)
   ("M-q" fill-region)
   ("M-s" ispell-region)
   ("C-z" undo)
   ("M-/" undo)
   ("C-?" help-command)
   ("C-t" set-mark-command)
   ("M-t" set-mark-command)
   ("C-x C-t" transpose-words)
   ;; ("C-M-t" transpose-words)
   ;; ("C-q" back-to-indentation)
   ("M-n" hippie-expand)
   ("M-m" nil)
   ("C-x f" find-file)
   ("C-x g" goto-line)
   ("M-z" server-edit)
   ("C-x C-b" switch-to-buffer)
   ("C-x b" list-buffers)
   ("C-M-a" backward-paragraph)
   ("C-M-e" forward-paragraph)
   ("C-M-w" scroll-other-window-down)
   ("C-c RET" imenu)
   ("M-o" kill-ring-save)
   ("C-c C-y" comment-or-uncomment-region)
   ;; ("C-c C-c" ace-jump-mode)
   ("C-x C-z" nil)
   ("s-x" smex)))

(cf-set-key-bindings
 'global-set-key
 '(
   ("C-h" backward-char)
   ("C-j" next-line)
   ("C-k" previous-line)
   ("C-l" forward-char)

   ("C-b" backward-delete-char)
   ("C-n" newline-and-indent)
   ("C-p" recenter-top-bottom)
   ("C-f" kill-line)

   ("M-h" backward-word)
   ("M-j" nil)
   ("M-k" nil)
   ("M-l" forward-word)

   ("M-b" mark-paragraph)
   ;;("M-n" indent-new-comment-line)
   ("M-n" auto-complete)
   ("M-p" downcase-word)
   ("M-f" kill-sentence)

   ("C-M-h" backward-sexp)
   ("C-M-j" forward-list)
   ("C-M-k" backward-list)
   ("C-M-l" forward-sexp)

   ("C-M-b" mark-defun)
   ("C-M-n" indent-new-comment-line)
   ("C-M-p" reposition-window)
   ("C-M-f" kill-sexp)))

(cf-set-key-bindings
 'global-set-key
 '(
   ;;("M-x" kill-region)
   ("M-v" yank)
   ("C-w" scroll-down)
   ("M-w" mark-word)
   ;;("M-w" capitalize-word)
   ("C-y" yank)))

(cf-set-key-bindings
 'define-key
 '(
   ("M-h" backward-word)
   ("M-l" forward-word)
   ("M-j" next-history-element)
   ("M-k" previous-history-element)
   )
 minibuffer-local-map)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; chunfeng edit ;;;;;;;;;;;;;;;;;;;;;;
;; customed forward-word
(defun cf-forward-word (&optional arg)
  "Move point backward ARG words.  
Normally returns t.  If an edge of the buffer or a field boundary is
reached, point is left there and the function returns nil.
Do not bind this function to \"M-l\" or \"M-h\"!"
  (if (or (null arg) (= arg 1))
    (let
        ((start (point))
         rtnflag
         (forward (key-binding (kbd "M-l")))
         (backward (key-binding (kbd "M-h"))))
      (setq rtnflag
	    (funcall forward '1))
      (funcall backward '1)
      (if (>= start (point))
	  (funcall forward '1)
	rtnflag))
    (let ((forward (key-binding (kbd "M-l"))))
      (funcall forward arg))))

;; customed kill-word
(defun cf-kill-word (arg)
  "Kill characters forward until encountering the end of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (kill-region (point) (progn (cf-forward-word arg) (point))))
(global-set-key (kbd "M-d") 'cf-kill-word)

;; customed kill
(defun cf-kill (beg end)
  "If the mark is active, kill region will be used; otherwise, delete
char will be used."
  (interactive (list (point) (mark)))
  (if mark-active
      (kill-region beg end)
    (delete-char 1)))
(global-set-key (kbd "C-d") 'cf-kill)

;; customed open & copy
(defun cf-open-copy (beg end)
  "If the mark is active, copy region will be used; otherwise,
open a new line."
  (interactive (list (point) (mark)))
  (if mark-active
      (kill-ring-save beg end)
    (open-line 1)))
(global-set-key (kbd "C-o") 'cf-open-copy)

;; customed move to the beginning of line
(defun cf-move-beginning-of-line ()
  (interactive)
  (setq pos-temp (point))
  (back-to-indentation)
  (if (= (point) pos-temp)
      (move-beginning-of-line 1)))
(global-set-key (kbd "C-a") 'cf-move-beginning-of-line)

(defun cf-magic-kill-ring-save(beg end)
  "If the mark is active, save the region to the kill-ring; otherwise,
capitalize the word."
  (interactive (list (point) (mark)))
  (if mark-active
      (kill-ring-save beg end)
    (capitalize-word 1)))
(global-set-key (kbd "M-c") 'cf-magic-kill-ring-save)

(defun cf-indent-regidly-inverse (start end)
  (interactive "r")
  (indent-rigidly start end -1))

(defun cf-eval-and-replace ()
  "From: http://emacsredux.com/blog/2013/06/21/eval-and-replace/
   Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
(global-set-key (kbd "C-x C-e") 'cf-eval-and-replace)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; chunfeng edit ;;;;;;;;;;;;;;;;;;;;;;

;; From: http://blog.plover.com/prog/revert-all.html
(defun cf-revert-all-buffers ()
  "Refreshes all open buffers from their respective files"
  (interactive)
  (let* ((list (buffer-list))
         (buffer (car list)))
    (while buffer
      (when (and (buffer-file-name buffer)
                 (not (buffer-modified-p buffer)))
        (set-buffer buffer)
        (revert-buffer t t t))
      (setq list (cdr list))
      (setq buffer (car list))))
  (message "Refreshed open files"))

(defun cf-exec-cmd-on-current-file (command)
  "run a command on the current file"
  (shell-command
   (format "open -a %s %s" command
           (shell-quote-argument (buffer-file-name)))))

(defun cf-open-webstorm ()
  (interactive)
  (cf-exec-cmd-on-current-file "webstorm"))

(cf-set-key-bindings 'global-set-key '(("C-<f9>" cf-open-webstorm)))
