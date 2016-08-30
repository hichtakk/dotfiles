; ~/.emacs.d/init.el
(setq debug-on-error t)

; load-path setting for cask
(setq load-path
  (append
   (list "~/.cask" ; install from script
         "/usr/local/share/emacs/site-lisp" ; install from homebrew
         )
   load-path))

; Package management tool
; see https://github.com/cask/cask
(require 'cask)
(cask-initialize)

; use-package
; see https://github.com/jwiegley/use-package
;     http://qiita.com/kai2nenobu/items/5dfae3767514584f5220
(unless (require 'use-package nil t)
  (defmacro use-package (&rest args)))

; init-loader
; see https://github.com/emacs-jp/init-loader
(use-package init-loader
  :config
  (setq init-loader-show-log-after-init t)
  (init-loader-load "~/.emacs.d/inits"))
