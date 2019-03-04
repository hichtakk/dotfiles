(use-package direx
  :config
  (push '(direx:direx-mode :position left :width 40 :dedicated t)
        popwin:special-display-config)
  :bind (("C-x j" . direx:jump-to-directory-other-window)
         )
  )
