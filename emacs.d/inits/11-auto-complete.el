; auto-complete

(when (locate-library "auto-complete")
  (require 'auto-complete-config)

  (ac-config-default)
  (setq ac-dwim t)

  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)
  (define-key ac-completing-map (kbd "TAB") 'ac-complete)
  )
