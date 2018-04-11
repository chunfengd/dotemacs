;; highlight-indetational

(defun cf-highlight-indetation-setup ()
  ;; (autoload 'js3-mode "js3-mode" nil t)
  (require 'highlight-indentation)
  ;; (setq highlight-indent-offset 2)
  (if (display-graphic-p)
      (set-face-background
       'highlight-indentation-face "grey20"))
  (if (display-graphic-p)
      (set-face-background
       'highlight-indentation-current-column-face "grey12")))

(if (package-installed-p 'highlight-indentation)
    (cf-highlight-indetation-setup)
  (message "highlight-indetation not installed"))
