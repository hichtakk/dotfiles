; auto-complete

(use-package auto-complete-config
  :config
  (ac-config-default)
  (setq ac-dwim t)
  (setq ac-comphist-file "~/.emacs.d/.ac-comphist.dat")
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)
  (define-key ac-completing-map (kbd "TAB") 'ac-complete)
  )
