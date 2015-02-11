; Rainbow Delimiters
; see http://www.emacswiki.org/emacs/RainbowDelimiters

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )
