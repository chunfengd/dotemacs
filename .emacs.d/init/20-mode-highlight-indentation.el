;; highlight-indetational

;; (cf-install-packages '(highlight-indentation))

;; (require 'highlight-indentation)

(if (display-graphic-p)
    (set-face-background
     'highlight-indentation-face "grey20"))
(if (display-graphic-p)
    (set-face-background
     'highlight-indentation-current-column-face "grey12"))
;; (setq highlight-indent-offset 2)

;; (set-face-background
;;  'highlight-indentation-face "#e3e3d3")
;; (set-face-background
;;  'highlight-indentation-current-column-face "#c3b3b3")
