;; highlight-indetational

(defun cf-highlight-indetation-setup ()
  (add-to-list 'load-path (cf-path "lib/highlight-indetation"))
  ;; (autoload 'js3-mode "js3-mode" nil t)
  (require 'highlight-indentation)
  ;; (setq highlight-indent-offset 2)
  (if (display-graphic-p)
      (set-face-background
       'highlight-indentation-face "grey20"))
  (if (display-graphic-p)
      (set-face-background
       'highlight-indentation-current-column-face "grey12")))

(cf-highlight-indetation-setup)
