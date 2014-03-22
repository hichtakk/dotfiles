; direx
(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
