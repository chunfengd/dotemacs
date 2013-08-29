(cf-install-packages
 '(ido-ubiquitous))

(defun cf-ido-forward-char (arg)
  "Move forward in user input. see ido-magic-forward-char."
  (interactive "P")
  (if (or arg (not (eobp)))
      (forward-char
       (min (prefix-numeric-value arg)
            (- (point-max) (point))))))

(defun cf-ido-backward-char (arg)
  "Move backward in user input. see ido-magic-backward-char."
  (interactive "P")
  (if (or arg (> (point) (minibuffer-prompt-end)))
      (forward-char
       (- (min (prefix-numeric-value arg)
	     (- (point) (minibuffer-prompt-end)))))))

(defun cf-ido-magic-f (arg)
  "kill line or perform magic action. see ido-magic-backward-char."
  (interactive "P")
  (cond
   ((or arg (not (eobp)))
    (ido-delete-file-at-head arg)) ; change here
   ((memq ido-cur-item '(file dir))
    (ido-fallback-command))
   (ido-context-switch-command
    (call-interactively ido-context-switch-command))
   ((eq ido-cur-item 'buffer)
    (ido-enter-find-file))))

(defun cf-ido-magic-b (arg)
  "Backward delete char or perform magic action. see
ido-magic-backward-char."
  (interactive "P")
  (cond
   ((or arg (> (point) (minibuffer-prompt-end)))
    (ido-delete-backward-updir arg)) ; change here
   ((eq last-command this-command)
    (when (and (memq ido-cur-item '(file dir))
	       (not (bobp)))
      (ido-push-dir))) ; else do nothing
   ((eq ido-cur-item 'buffer)
    (ido-fallback-command))
   (ido-context-switch-command
    (call-interactively ido-context-switch-command))
   (t
    (ido-enter-switch-buffer))))

(defun cf-ido-keys ()
  "Add my keybindings for ido."
  (define-key ido-completion-map " " 'ido-next-match)
  (cf-set-key-bindings
   'define-key
   '(
     ("C-n" ido-select-text) ; for create a new file
     ("C-j" ido-next-match)
     ("C-k" ido-prev-match)
     ("C-h" cf-ido-backward-char)
     ("C-l" cf-ido-forward-char)
     ("C-b" ido-delete-backward-updir)
     ;;("C-f" nil)
     ;;("C-b" cf-ido-magic-b)
     ;;("C-f" cf-ido-magic-f)
     ("C-u" ido-up-directory)
     )
   ido-completion-map)
  )
(add-hook 'ido-setup-hook 'cf-ido-keys)

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-create-new-buffer 'prompt)

(ido-ubiquitous t)
(setq ido-enable-prefix nil)
(setq ido-use-filename-at-point 'guess)
(setq ido-use-virtual-buffers t)
(setq ido-handle-duplicate-virtual-buffers 2)
(setq ido-max-prospects 10)

;; ido-ignore-buffers
;; ido-ignore-directories
;; ido-ignore-files
;; variable completion-ignored-extensions
;; //
;; ~/
;; M-d : Searches for the input in all sub-directories.
;; M-m : Creates a new sub-directory.
