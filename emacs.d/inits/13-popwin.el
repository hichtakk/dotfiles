(when (locate-library "popwin")
  (require 'popwin)
  (popwin-mode 1)

  (push '("*Help*" :width 80 :position right) popwin:special-display-config)
  (push '("*Flycheck errors*" :position bottom :noselect t :dedicated nil) popwin:special-display-config)
  (push '("^\\*magit:.+\\*" :regexp t :width 80 :position right :dedicated nil) popwin:special-display-config)
  )
