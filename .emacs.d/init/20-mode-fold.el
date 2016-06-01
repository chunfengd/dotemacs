
'(a b c
    (d
     e)
    (f g)
    (h
     (i j))
    ((k l
        (m n)
        (p q) (r s))
     o))

(setq default-label 'cycle-fold)

(defun goto-list (count depth)
  (condition-case ex
      (goto-char (scan-lists (point) count depth))
    (error
      (message "Error: %s" ex)
      nil)))

(defun scan-lists-safe (from count depth &optional default)
  (condition-case ex
      (scan-lists from count depth)
    (error
      (message "Error in scan-lists: %s" ex)
      default)))

(defun get-bol (pos)
  (save-excursion (goto-char (or pos (point)))
                  (beginning-of-line)
                  (point)))

(defun get-eol (pos)
  (save-excursion (goto-char (or pos (point)))
                  (end-of-line)
                  (point)))

(defun my-filter (condp lst)
  (delq nil
        (mapcar (lambda (x) (and (funcall condp x) x)) lst)))

(defun label->tag (label)
  (intern (concat "tag-" (symbol-name (or label default-label)))))

(defun create-overlay (start end &optional label val)
  (let ((o (make-overlay start end))
        (tag (label->tag label)))
    ;; (message "tag: %s" tag)
    (if val
            (overlay-put o tag val)
          (overlay-put o tag t))
    (overlay-put o 'evaporate t)
    (overlay-put o 'invisible t)
    (overlay-put o 'display `(:string "..."))
    o))

(defun get-overlays (start end &optional label val)
  (let ((tag (label->tag label))
        (os (overlays-in start end)))
    (if (null tag)
        os
      (my-filter (lambda (o)
                   (if (null val)
                       (overlay-get o tag)
                     (equal (overlay-get o tag) val)))
                 os))))

(defun delete-overlays (start end &optional label val)
  (dolist (o (get-overlays start end label val))
    (delete-overlay o)))

(defun cal-fold-region-at (&optional pos)
  (interactive)
  (let* ((start (or pos (point)))
         (eol (get-eol start))
         (end (scan-lists start 1 0)))
    (if (> (- end eol) 1)
        (list (cons :start eol)
              (cons :end (1- end))))))

(defun cal-fold-region-line (&optional pos)
  (interactive)
  (let* ((p (or pos (point)))
         (bol (get-bol p))
         (eol (get-eol p))
         (end (scan-lists-safe bol 1 0 (min (1+ bol) eol))))
    (while (< end eol)
      (setq end (scan-lists-safe end 1 0 (min (1+ end) eol))))
    (if (> end eol)
        (cal-fold-region-at (scan-lists end -1 0)))))

(defun current-fold-state (&optional pos)
  (interactive)
  (let ((range (cal-fold-region-line pos)))
    (if range
        (let* ((start (cdr (assoc :start range)))
               (end (cdr (assoc :end range)))
               (os (get-overlays start end)))
          ;; (message "%s %s %s" start end os)
          (if os
              (if (and (null (cdr os))
                       (equal start (overlay-start (car os)))
                       (equal end (overlay-end (car os))))
                  :folded
                :mis-folded)
            :unfolded))
      :no-fold)))

(defun fold-at (&optional pos)
  (interactive)
  (let ((range (cal-fold-region-at pos)))
    (if range
        (create-overlay (cdr (assoc :start range))
                        (cdr (assoc :end range))))))

(defun fold-line (&optional pos)
  (interactive)
  (let ((range (cal-fold-region-line pos)))
    (if range
        (create-overlay (cdr (assoc :start range))
                        (cdr (assoc :end range))))))

(defun fold-at-end (&optional pos)
  (interactive)
  (save-excursion
    (goto-list -1 0)
    (fold-at (point))))

(defun unfold-line (&optional pos)
  (interactive)
  (let ((range (cal-fold-region-line pos)))
    (if range
        (delete-overlays (cdr (assoc :start range))
                         (cdr (assoc :end range))))))

(defun fold-children (&optional pos)
  (interactive)
  (save-excursion
    (let ((range (cal-fold-region-line pos)))
      (when range
        (goto-char (cdr (assoc :start range)))
        (while (goto-list 1 0)
          (fold-at-end))))))

(defun toggle-fold-line (&optional pos)
  (interactive)
  (let ((status (current-fold-state)))
    (cond
     ((eq status :no-fold) nil)
     ((eq status :unfolded) (fold-line pos))
     ((eq status :mis-folded)
      (unfold-line pos)
      (unless (eq last-command 'toggle-fold-line)
        (fold-line pos)))
     ((eq status :folded)
      (unfold-line pos)
      (fold-children pos))
     (t :default))))

(defun toggle-fold-all ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (if (and (eq last-command 'toggle-fold-all)
             (get-overlays (point-min) (point-max)))
        (delete-overlays (point-min) (point-max))
      (progn (delete-overlays (point-min) (point-max))
             (while (goto-list 1 0)
               (fold-at-end))))))

;; Test
;; (message "****************** start *******************")
;; (message "label->tag: %s" (label->tag 'test))
;; (message "label->tag === 'tag-test: %s" (eq (label->tag 'test) 'tag-test))
;; (message "delete-overlays: %s" (delete-overlays 1 100 'test))
;; (message "create-overlay: %s" (create-overlay 1 10 'test))
;; (message "get-overlays: %s" (get-overlays 1 100 'test))
;; (message "delete-overlays: %s" (delete-overlays 1 100 'test))
;; (message "get-overlays: %s" (get-overlays 1 100 'test))
;; (message "****************** end *******************")

;; (overlay-put o 'face `(:background "grey50"))
;; (overlay-put o 'face nil)
;; (overlay-put o 'display `(:string "(...)"))
;; (overlay-put o 'display nil)

(cf-set-key-bindings
 'global-set-key
 '(("<C-tab>" toggle-fold-line)))

(cf-set-key-bindings
 'global-set-key
 '(("C-S-<tab>" toggle-fold-all)))
