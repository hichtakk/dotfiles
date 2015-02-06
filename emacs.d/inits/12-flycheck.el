; flycheck for syntax checking

(use-package flycheck
  :init
  ;(add-hook 'after-init-hook #'global-flycheck-mode)
  :config
  (setq flycheck-display-errors-delay 0.3)
  (set-face-attribute 'flycheck-error nil :background "#8c5353")
  (set-face-attribute 'flycheck-warning nil :background "#535399")
  :bind (("M-n" . flycheck-next-error)
         ("M-p" . flycheck-previous-error))
)
