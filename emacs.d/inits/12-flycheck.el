; flycheck for syntax checking

(when (locate-library "flycheck")
  (require 'flycheck)
  ;; enable flycheck mode in available major mode
  (add-hook 'after-init-hook #'global-flycheck-mode)

  (set-face-attribute 'flycheck-error nil :background "#8c5353")
  (set-face-attribute 'flycheck-warning nil :background "#535399")

  (setq flycheck-display-errors-delay 0.3)
  (define-key global-map (kbd "M-n") 'flycheck-next-error)
  (define-key global-map (kbd "M-p") 'flycheck-previous-error)
  )
