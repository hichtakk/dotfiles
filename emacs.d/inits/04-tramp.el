; tramp setting
; see http://www.emacswiki.org/emacs/Tramp
;     http://qiita.com/catatsuy/items/f9fad90fa1352a4d3161
;(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
;(setq tramp-persistency-file-name "~/.emacs.d/.tramp")
(use-package tramp
  :config
  (setq tramp-persistency-file-name "~/.emacs.d/.tramp")
  (setenv "SHELL" "/bin/bash")
)
